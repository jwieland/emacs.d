(setq load-path (cons "~/.emacs.d/" load-path))
(load-library "p4")

(setq c-basic-offset 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)


(autoload 'js-mode "js" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

(load "~/.emacs.d/nxhtml/autostart.el")

(require 'ido)
(ido-mode t)


(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

(add-to-list 'load-path
             "~/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet) 
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")


(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(add-to-list 'auto-mode-alist
	     (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "s
vg" "rss") t) "\\'")
		   'nxml-mode))
(unify-8859-on-decoding-mode)
(setq magic-mode-alist
      (cons '("<\\?xml " . nxml-mode)
	    magic-mode-alist))
(fset 'xml-mode 'nxml-mode)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; If you haven't added ~/.emacs.d/site-lisp to your load-path, do it with this.
(add-to-list 'load-path "~/.emacs.d/emacs-flymake/")

;; Require flymake.
(require 'flymake)
;; If you're a TTY emacs user, flymake-cursor is a must-have.
;; Grab it with apt-get or ports or whatever your OS package manager is.
(require 'flymake-cursor)

;; Static analysis can be slow, so only run flymake if I've not been typing for 5 seconds.
;; It will still run on save or hitting return.
(setq flymake-no-changes-timeout 5)

;; Disable in-place checking, and tell it to use ~/.emacs.d/tmp/ for the temp files.
(setq temporary-file-directory "~/.emacs.d/tmp/")
(setq flymake-run-in-place nil)



;; flymake-perlcritic stuff
(setq flymake-perlcritic-severity 5)
;; If flymake_perlcritic isn't in your $PATH you'll need to give the full path here
(setq flymake-perlcritic-command "/home/jwieland/.emacs.d/emacs-flymake-perlcritic/bin/flymake_perlcritic")
(require 'flymake-perlcritic)
