(require 'iso-transl)
(require 'package)

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(elpy-enable)
;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;; Fixing another key binding bug in i edit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("/home/pedro/Dropbox/research/food/researchLog.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
(add-hook 'python-mode-hook 'jedi:setup)

;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t))
)

;; Syntax highlighting in org-mode:
(setq org-src-fontify-natively t)
;; Using tabs in src blocks:
(setq org-src-tab-acts-natively t)

;; Copy and paste from System
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Matching brackets
(electric-pair-mode 1)
;; Show matching parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Inline TODO in org-mode
(require 'org-inlinetask)

;; Line-wraping toggle
(global-set-key [f12] 'toggle-truncate-lines)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 100)

;; Word-wrapping: 
(setq longlines-wrap-follows-window-size t)
(global-set-key [(control meta l)] 'longlines-mode)

;; Agenda to see all todos
(setq org-agenda-files (list "/home/pedro/Dropbox/research/food/researchLog.org")
)

;; Autocomplete AucTex
(require 'package)
(package-initialize)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'ac-math) 
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

 (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
   (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                 ac-sources))
   )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(global-auto-complete-mode t)
 
(setq ac-math-unicode-in-math-p t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
