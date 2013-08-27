; DISPLAY
(setq inhibit-startup-message t);; don't show splash screen
(column-number-mode t);; display column number
(menu-bar-mode nil);; disable menu-bar
;(tool-bar-mode nil);; disable tool-bar
;(toggle-scroll-bar nil);; disable scroll-bar

; TEXT HIGHLIGHTING
(show-paren-mode t);; highlight opposite ( { [
(setq-default show-trailing-whitespace t)       ;; show trailing whitespaces
(custom-set-faces       ;; red comments
 '(font-lock-comment-face ((t (:foreground "brown")))))
  (if (functionp 'global-hi-lock-mode)
      (global-hi-lock-mode 1)
    (hi-lock-mode 1))

(defun eightycols nil
  (defface line-overflow
    '((t (:background "red" :foreground "black")))
    "Face to use for `hl-line-face'.")
  (highlight-regexp "^.\\{80,\\}$" 'line-overflow)
)
(add-hook 'find-file-hook 'eightycols);; highlight when > 80 cols

; KEYBOARD
(delete-selection-mode t);; typing rm selected text
(setq scroll-step 1);; smooth scrolling
(global-set-key "\C-h" 'backward-delete-char);; backspace *is* backspace
(fset 'yes-or-no-p 'y-or-n-p);; short answers


; C mode
(require 'cc-mode)
(setq c-style-alist                             ;; for epita coding style
      (append
       (list nil
	               '("epita"
			            (c-basic-offset . 2)
				              (c-comment-only-line-offset . 0)
					               (c-hanging-braces-alist     . ((substatement-open before
													     after)))
						               (c-offsets-alist . ((topmost-intro        . 0)
										          (substatement         . +)
											            (substatement-open    . 0)
												         (case-label           . +)
													         (access-label         . -)
														    (inclass              . +)
														          (inline-open          . 0)
															           ))))
       c-style-alist))
(setq c-default-style "epita")

; utf-8
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

; Open files/switch buffers
(when (string-match "^22." emacs-version)
  (ido-mode t)
  (ido-everywhere t)
)

;; Don't switch to GDB-mode buffers
(setq ido-ignore-buffers (quote ("\\`\\*breakpoints of.*\\*\\'"
  "\\`\\*stack frames of.*\\*\\'" "\\`\\*gud\\*\\'"
  "\\`\\*locals of.*\\*\\'"  "\\` ")))
;; Better gdb
(setq-default gdb-many-windows t)

;; Tiger Mode
(defconst conf-dir "~/emacs-config/"
  "Location of the configuration files") ;; declaring a new conf folder
(add-to-list 'load-path conf-dir) ;; adding the conf folder to emacs

(autoload 'tiger-mode "tiger" "Load tiger-mode" t)
(add-to-list 'auto-mode-alist '("\\.ti[gh]$" . tiger-mode))


;; Tuareg
;; aller chercher les fichiers dans le bon repertoire
(setq load-path (cons (expand-file-name "~/emacs-config/tuareg-mode")
		                              load-path))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; append-tuareg.el - Tuareg quick installation: Append this file to .emacs.
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(if (and (boundp 'window-system) window-system)
    (when (string-match "XEmacs" emacs-version)
      (if (not (and (boundp 'mule-x-win-initted) mule-x-win-initted))
            (require 'sym-lock))
      (require 'font-lock)))

;; Configuration  de tuareg
(add-hook 'tuareg-mode-hook
	      '(lambda ()
		             (auto-fill-mode 1)
			         ; turn on auto-fill minor mode
			         ; (passage a la ligne automatique)
			              (define-key tuareg-mode-map [f4] 'goto-line)
				            (define-key tuareg-mode-map [f5] 'compile)
					               (define-key tuareg-mode-map [f6] 'recompile)
						               (define-key tuareg-mode-map [f7] 'next-error)
							       ; quelques raccourcis
							            (setq tuareg-sym-lock-keywords nil)
								         ; ne pas remplacer les mots cles par des symboles
								              ))
; GNUS
(setq gus-select-method '(nntp "news.epita.fr" (nntp-port-number 119))) ;; news server
(setq user-full-name "Sharma Shubham")  ;; set my name
(setq user-nickname "shubs")  ;; set my nickname
(setq user-mail-address "sharma_s@epimeros.org")  ;; set my email address

