(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(load-theme 'solarized-dark)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(defun meow-setup ()
  (meow-motion-overwrite-define-key
   '("a" . meow-next)
   '("e" . meow-prev)
   '("<escape>" . ignore))

  (meow-leader-define-key
   '("w" . save-buffer))

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
   '("<escape>" . ignore)))
   
(require 'meow)
(meow-setup)
(meow-global-mode 1)
