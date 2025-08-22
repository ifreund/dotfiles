#!/usr/bin/env janet

(import spork/sh)
(import spork/path)

(defn version-string [v]
  (string (v :major) "." (v :minor) "." (v :patch) (v :pre-release)))

(defn get-version [zon]
  (def [major minor patch pre-release]
    (->> zon (peg/match
               ~{:n (number :d+)
                 :version (* :n "." :n "." :n (? '(* "-" (to `"`))))
                 :main (* (thru ".version") :s "=" :s `"` :version)})))
  @{:major major :minor minor :patch patch :pre-release pre-release})

(defn put-version [zon v]
  (first (->> zon (peg/match
                    ~{:before (* (thru ".version") :s "=" :s `"`)
                      :version (/ (to `"`) ,|(version-string v))
                      :main (% (* ':before :version '(any 1)))}))))

(defn main [& args]
  (def field (case (get args 1)
               "minor" :minor
               "patch" :patch
               (error "invalid argument")))

  (if-not (= 0 (sh/exec "git" "diff-index" "--quiet" "HEAD"))
    (error "detected uncommitted changes"))

  (def build-zig-zon "build.zig.zon")
  (def zon (slurp build-zig-zon))
  (def v (get-version zon))
  (print "initial: " (version-string v))

  (if-not (= "-dev" (v :pre-release))
    (error "not a -dev version"))
  (if (= field :minor)
    (if-not (= 0 (v :patch))
      (error "non-zero patch version for minor bump")))

  (put v :pre-release nil)
  (print "bump to: " (version-string v))
  (spit build-zig-zon (put-version zon v))

  (sh/exec-fail "git" "add" build-zig-zon)
  (sh/exec-fail "git" "commit" "-m"
                (string "build: bump version to " (version-string v)))

  (def prev (table/clone v))
  (update prev field dec)

  (def shortlog (sh/exec-slurp "git" "shortlog"
                               (string "v" (version-string prev) "..HEAD")))

  (def project-name (path/basename (os/cwd)))
  (def tag-template ".git/.my-tag-template")
  (spit tag-template
        (string project-name " " (version-string v) "\n\n"
                "Full changelog:\n\n" shortlog "\n"))
  (sh/exec-fail "git" "tag" "-as" "--edit" "-F" tag-template
                (string "v" (version-string v)))

  (def tarball-name (string project-name "-" (version-string v)))
  (sh/exec-fail "tarball.sh" tarball-name)
  (sh/exec-fail "gpg" "--detach-sign" (string tarball-name ".tar.gz"))

  (update v field inc)
  (put v :pre-release "-dev")
  (print "bump to: " (version-string v))
  (spit build-zig-zon (put-version zon v))

  (sh/exec-fail "git" "add" build-zig-zon)
  (sh/exec-fail "git" "commit" "-m"
                (string "build: bump version to " (version-string v))))
