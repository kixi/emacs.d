;; ~/.emacs or ~/.emacs.d/init.el

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install straight.el

(defvar bootstrap-version)

(let ((install-url "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el")
      (bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer (url-retrieve-synchronously install-url 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install and enable use-package

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

(require' use-package)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install Corgi

(use-package corgi-packages
  :straight (corgi-packages
             :type git
             :host github
             :repo "kixi/corgi-packages"))

(add-to-list #'straight-recipe-repositories 'corgi-packages)

(let ((straight-current-profile 'corgi))
  (use-package corgi-defaults)
  (use-package corgi-editor)
  (use-package corgi-emacs-lisp)
  (use-package corgi-commands)
  (use-package corgi-clojure)
  (use-package corgi-stateline)
  (use-package corkey
    :config
    (corkey-mode 1)
    (corkey/install-bindings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Your own stuff goes here, we recommend these extra packages

                                        ;(use-package markdown)

                                        ;(use-package yaml)
;(use-package which-key)
(use-package org)
(use-package magit)

;(which-key-setup-side-window-bottom)

(global-linum-mode 1)

(load-theme 'tsdh-dark t)
