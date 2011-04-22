(setq load-path (cons "~/.emacs.d/" load-path))
(load-library "p4")


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

(add-to-list 'load-path "~/.emacs.d/jade-mode")
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . sws-mode))


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
