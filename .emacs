 ;; Ido-mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
;;end Ido-mode

;; Tab only completes and does not open files.
(setq ido-confirm-unique-completion t)

;switch buffers with C-b for instance - shorter than C-x b
(global-set-key [(control b)] 'ido-switch-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;moving thought buffers
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Compiling commands
;Recompile with C-c c
(global-set-key [(control c) (c)] 'recompile)
;see the errors with C-c e
(global-set-key [(control c) (e)] 'next-error)
;set the compilation windows height
(setq compilation-window-height 14)
;scoll automaticly to follow compilation
(setq compilation-scroll-output t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Numeros de lines
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%d ")

;goto-line
(global-set-key [(control c) (l)] 'goto-line)

;Spel check (aspell)
;usage avec M-$ ou M-x ispell (a = accep; A=reject)
(setq-default ispell-program-name "aspell")

;show matching parentheses
(require 'paren)
(show-paren-mode 1)
(setq show-paren-delay 0)

;show trailing spaces
(setq-default show-trailing-whitespace t)

;;80 col rules
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)

;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)


;; Les 'beep' deviennent visibles (et non plus audibles)
(setq visible-bell t)


;;bracket alignment for epita's coding style (if, while, for, ...)
(c-set-offset 'substatement-open '0)
(c-set-offset 'brace-list-open '0)
(c-set-offset 'statement-case-open '0)


;;gdb
(setq-default gdb-many-windows t)

;;autocompletion
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)


;; ===== Turn off tab character =====

;;
;; Emacs normally uses both tabs and spaces to indent lines. If you
;; prefer, all indentation can be made from spaces only. To request this,
;; set `indent-tabs-mode' to `nil'. This is a per-buffer variable;
;; altering the variable affects only the current buffer, but it can be
;; disabled for all buffers.

;;
;; Use (setq ...) to set value locally to a buffer
;; Use (setq-default ...) to set value globally 
;;
(setq-default indent-tabs-mode nil)

;; ========== Support Wheel Mouse Scrolling ==========
(mouse-wheel-mode t)
(setq xterm-mouse-mode t)
;; ========== Place Backup Files in Specific Directory ==========

;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))


;;TIGER COLORATION
(autoload 'tiger-mode "tiger" "Load tiger-mode" t)
(add-to-list 'auto-mode-alist '("\\.ti[gh]$" . tiger-mode))
