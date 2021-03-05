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
    (corkey/install-bindings 'my-keys)))

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
(use-package flycheck :ensure t :init (global-flycheck-mode))
(use-package flycheck-clj-kondo :ensure t)
(require 'flycheck-clj-kondo)


(add-hook 'clojure-mode-hook (lambda ()
                               (require 'flycheck-clj-kondo)
                               (evil-cleverparens-mode)
                               (show-paren-mode)))
(add-hook 'before-save-hook
          (lambda ()
            (when (derived-mode-p 'prog-mode)
              (delete-trailing-whitespace))))
(setq cider-repl-display-help-banner nil)
(setq cider-repl-pop-to-buffer-on-connect nil)

;(add-hook 'clojure-mode-hook 'show-paren-mode)
