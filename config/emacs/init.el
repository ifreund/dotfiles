;; -*- lexical-binding: t -*-

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package emacs
  :config
  ;; Anything persistent should go in this init.el file
  (setq custom-file null-device)
  
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (horizontal-scroll-bar-mode -1)
  
  (save-place-mode 1)

  (setq inhibit-startup-screen t)
  
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  (set-frame-font "Hack 12")

  (setq tab-always-indent 'complete))
  
(use-package solarized-theme
  :config
  (setq solarized-use-less-bold t)
  (load-theme 'solarized-dark t))

(use-package vertico
  :init
  (vertico-mode))

(use-package hotfuzz
  :config
  (setq completion-styles '(hotfuzz))
  (setq completion-ignore-case t))

(use-package consult
  :bind (("C-x b" . consult-buffer)))

(use-package marginalia
  :init (marginalia-mode))

(use-package corfu
  :init (global-corfu-mode))

(use-package magit)

(use-package meow
  :config
  (meow-motion-overwrite-define-key
   '("a" . meow-next)
   '("e" . meow-prev)
   '("<escape>" . ignore))

  (setq meow-keypad-ctrl-meta-prefix ?M)
  (meow-leader-define-key
   '("w" . save-buffer)
   '("b" . "C-x b")
   '("g" . "C-x g")
   '("o" . "C-x p D")
   '("p" . "C-x p f"))

  (meow-normal-define-key
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("a" . meow-next)
   '("A" . meow-next-expand)
   '("e" . meow-prev)
   '("E" . meow-prev-expand)
   '("i" . meow-right)
   '("I" . meow-right-expand)
   
   '("w" . meow-next-word)
   '("W" . meow-next-symbol)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("s" . meow-mark-word)
   '("S" . meow-mark-symbol)
 
   '("l" . meow-insert)
   '("k" . meow-append)
   '("c" . meow-change)
   '("o" . meow-open-below)
   '("O" . meow-open-above)
   
   '("0" . meow-expand-0)
   '("1" . meow-expand-1)
   '("2" . meow-expand-2)
   '("3" . meow-expand-3)
   '("4" . meow-expand-4)
   '("5" . meow-expand-5)
   '("6" . meow-expand-6)
   '("7" . meow-expand-7)
   '("8" . meow-expand-8)
   '("9" . meow-expand-9)

   '("/" . meow-visit)
   '("n" . meow-search)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("m" . meow-block)
   '("M" . meow-to-block)
   '("f" . meow-find)


   '("t" . meow-till)
   '("j" . meow-join)
   
   '("-" . negative-argument)
   '("v" . meow-reverse)

   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("(" . meow-beginning-of-thing)
   '(")" . meow-end-of-thing)

   '("d" . meow-kill)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("p" . meow-yank)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)

   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)

   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("z" . meow-pop-selection)

   '("'" . repeat)

   '("q" . meow-quit)
   '("<escape>" . ignore))
  (meow-global-mode 1))
