(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(sml
     sql
     helm
     ranger
     frame-geometry
     ;; themes-megapack
     (better-defaults :variables better-defaults-move-to-beginning-of-code-first t)
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)
     racket
     emacs-lisp
     javascript
     python
     csv
     sql
     ;; dash
     (go :variables
         gofmt-command "goimports"
         go-tab-width 8)
     (haskell :variables haskell-completion-backend 'intero)
     (typescript :variables
                 typescript-fmt-on-save t)
     react
     purescript
     html
     markdown
     emoji
     yaml
     (elm :variables
          elm-format-command "elm-format-0.17")
     (typography :variables typography-enable-typographic-editing t)
     evil-commentary
     osx
     syntax-checking
     ;(git :variables
     ;     git-magit-status-fullscreen t
     ;     magit-push-always-verify nil
     ;     magit-save-repository-buffers 'dontask
     ;     magit-revert-buffers 'silent
     ;     magit-refs-show-commit-count 'all
     ;     magit-revision-show-gravatars nil)
     (version-control :variables
                      version-control-global-margin t
                      version-control-diff-tool 'git-gutter
                      )
     (shell :variables shell-default-shell 'multi-term)
     ;; org
     ;; spell-checking
     )
   dotspacemacs-additional-packages '(rjsx-mode)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages
   '(coffee-mode holy-mode)
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 10))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(leuven
                         deeper-blue
                         manoj-dark
                         zonokai-red
                         organic-green
                         occidental
                         alect-light
                         alect-light-alt
                         molokai
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; default: "Source Code Pro"
   ;; "Courier New"

   ;; "Pt Mono"
   ;; "Inconsolata-dz for Powerline"
   ;;"Courier New Regular"
   dotspacemacs-default-font '("dejaVu Sans ExtraLight"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 10
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))
(defun dotspacemacs/user-init ()
  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  ;; (setq tramp-mode nil)
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  ;; disable exec-from-shell-warning
  (setq exec-path-from-shell-check-startup-files nil)
  ;; (setq exec-path-from-shell-arguments '("-l"))
  (setq
   backup-directory-alist '(("." . "~/.saves"))
   backup-by-copying t
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)
  )

(defun dotspacemacs/user-config ()
  ;; make helm-projectile-find-file fast
  (setq shell-file-name "/bin/sh")
  (setq projectile-enable-caching t)
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-insert-state-cursor '("gray" box))
  (setq-default evil-visual-state-cursor '("red" box))
  (setq-default evil-normal-state-cursor '("gray" box))
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char)
  (define-key evil-insert-state-map (kbd "C-j") 'evil-next-visual-line)
  (define-key evil-insert-state-map (kbd "C-k") 'evil-previous-visual-line)
  (define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-visual-line)
  (define-key evil-insert-state-map (kbd "C-a") 'evil-beginning-of-visual-line)
  ;; (define-key evil-insert-state-map (kbd "C-d") 'evil-delete-line)
  (define-key evil-insert-state-map (kbd "C-s") 'evil-delete-whole-line)
  (define-key evil-normal-state-map "U" 'undo-tree-redo)
  (setq ranger-ignored-extensions '("mkv" "iso" "mp4"))
  (setq powerline-default-separator nil)
  (setq create-lockfiles nil)
  (define-key evil-normal-state-map ";" 'evil-ex)
  ;; Don't persist highlighting of evil searching results
  (global-evil-search-highlight-persist)
  (global-evil-search-highlight-persist)
  (turn-off-search-highlight-persist)
  ;; Source: http://www.emacswiki.org/emacs-en/download/misc-cmds.el
  (defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer :ignore-auto :noconfirm))
  ;; makes eshell nicer
  ;; ctrl-0 to open iterm
  (define-key global-map (kbd "C-0") 'iterm-here)
  (defun iterm-here ()
    (interactive)
    (dired-smart-shell-command "open -a iTerm $PWD" nil nil))
  ;; global hungry-delete-mode and solve conflict between hungty-delete-mode
  ;; and smart-parents-mode
  (global-hungry-delete-mode)
  (defadvice hungry-delete-backward (before sp-delete-pair-advice activate) (save-match-data (sp-delete-pair (ad-get-arg 0))))

  ;; add one more visual space at line end
  (setq evil-move-cursor-back nil)
  ;; remove annoying blinking
  (setq company-echo-delay 0)

  ;; symbol-linked file : just don't ask me again !
  (setq vc-follow-symlinks nil)

  ;; makes eshell nicer
  (defun my-eshell-mode-faces ()
    (face-remap-add-relative 'default '((:foreground "#BD9700")))
    (face-remap-add-relative 'eshell-prompt '((:foreground "#BD9700" :weight bold))))
  (add-hook 'eshell-mode-hook 'my-eshell-mode-faces)

  ;; elm
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-elm))

  ;; react
  (define-key evil-insert-state-map (kbd "C-d") 'rjsx-delete-creates-full-tag)
  ;; (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

  ;; vue
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

  ;; javascript
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-strict-trailing-comma-warning nil)
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   js-indent-level 2
   typescript-indent-level 2
   evil-shift-width 2
   json-encoding-default-indentation 2
   json-reformat:indent-width 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

  ;; only display file name
  ;; (setq frame-title-format "%b")
  ;; display full file path
  (setq frame-title-format
        '(:eval
          (if buffer-file-name
              (replace-regexp-in-string
               "\\\\" "/"
               (replace-regexp-in-string
                (regexp-quote (getenv "HOME")) "~"
                (convert-standard-filename buffer-file-name)))
            (buffer-name))))

  )

(defun vimniky-invalidate-cache ()
  "Invalidate projectile and recentf cache."
  (interactive)
  (progn (projectile-invalidate-cache nil)
         (recentf-cleanup)))

(defun vimniky-revert-buffer ()
  "revert current buffer to match it's curresponding file on disk"
  (interactive)
  (revert-buffer-no-confirm))

(defun vimniky-kill-other-buffers ()
  "kill all other buffers but current one"
  (interactive)
  (spacemacs/kill-other-buffers))

;; displace color in place start
;; Takes a color string like #ffe0e0 and returns a light
;; or dark foreground color to make sure text is readable.
(defun fg-from-bg (bg)
  (let* ((avg (/ (+ (string-to-number (substring bg 1 3) 16)
                    (string-to-number (substring bg 3 5) 16)
                    (string-to-number (substring bg 5 7) 16)
                    ) 3)))
    (if (> avg 128) "#000000" "#ffffff")
    ))

;; Improved from http://ergoemacs.org/emacs/emacs_CSS_colors.html
;; * Avoid mixing up #abc and #abcabc regexps
;; * Make sure dark background have light foregrounds and vice versa
(defun xah-syntax-color-hex ()
  "Syntax color text of the form 「#ff1100」 and 「#abc」 in current buffer.
URL `https://github.com/mariusk/emacs-color'
Version 2016-08-09"
  (interactive)
  (font-lock-add-keywords
   nil
   '(
     ("#[ABCDEFabcdef[:digit:]]\\{6\\}"
      (0 (progn (let* ((bgstr (match-string-no-properties 0))
                       (fgstr (fg-from-bg bgstr)))
                  (put-text-property
                   (match-beginning 0)
                   (match-end 0)
                   'face (list :background bgstr :foreground fgstr))))))
     ("#[ABCDEFabcdef[:digit:]]\\{3\\}[^ABCDEFabcdef[:digit:]]"
      (0 (progn (let* (
                       (ms (match-string-no-properties 0))
                       (r (substring ms 1 2))
                       (g (substring ms 2 3))
                       (b (substring ms 3 4))
                       (bgstr (concat "#" r r g g b b))
                       (fgstr (fg-from-bg bgstr)))
                  (put-text-property
                   (match-beginning 0)
                   (- (match-end 0) 1)
                   'face (list :background bgstr :foreground fgstr)
                   )))))
     ))
  (font-lock-fontify-buffer))

;; Generates a list of random color values using the
;; Golden Ratio method described here:
;;   http://martin.ankerl.com/2009/12/09/how-to-create-random-colors-programmatically/
;; The list will be length long. Example:
;;
;; (gen-col-list 3 0.5 0.65)
;; => ("#be79d2" "#79d2a4" "#d28a79")
(require 'color)
(defun gen-col-list (length s v &optional hval)
  (cl-flet ( (random-float () (/ (random 10000000000) 10000000000.0))
             (mod-float (f) (- f (ffloor f))) )
    (unless hval
      (setq hval (random-float)))
    (let ((golden-ratio-conjugate (/ (- (sqrt 5) 1) 2))
          (h hval)
          (current length)
          (ret-list '()))
      (while (> current 0)
        (setq ret-list
              (append ret-list
                      (list (apply 'color-rgb-to-hex (color-hsl-to-rgb h s v)))))
        (setq h (mod-float (+ h golden-ratio-conjugate)))
        (setq current (- current 1)))
      ret-list)))

(defun set-random-rainbow-colors (s l &optional h)
  ;; Output into message buffer in case you get a scheme you REALLY like.
  ;; (message "set-random-rainbow-colors %s" (list s l h))
  (rainbow-delimiters-mode t)

  ;; I also want css style colors in my code.
  (xah-syntax-color-hex)
  ;; Show mismatched braces in bright red.
  (set-face-background 'rainbow-delimiters-unmatched-face "red")

  ;; Rainbow delimiters based on golden ratio
  (let ( (colors (gen-col-list 9 s l h))
         (i 1) )
    (let ( (length (length colors)) )
      ;;(message (concat "i " (number-to-string i) " length " (number-to-string length)))
      (while (<= i length) 
        (let ( (rainbow-var-name (concat "rainbow-delimiters-depth-" (number-to-string i) "-face"))
               (col (nth i colors)) )
          ;; (message (concat rainbow-var-name " => " col))
          (set-face-foreground (intern rainbow-var-name) col))
        (setq i (+ i 1))))))

(add-hook 'js-mode-hook '(lambda () (set-random-rainbow-colors 0.5 0.49)))
(add-hook 'css-mode-hook '(lambda () (set-random-rainbow-colors 0.5 0.49)))
(add-hook 'html-mode-hook '(lambda () (set-random-rainbow-colors 0.5 0.49)))
(add-hook 'html-mode-hook '(lambda () (set-random-rainbow-colors 0.5 0.49)))
(add-hook 'emacs-lisp-mode-hook '(lambda () (set-random-rainbow-colors 0.5 0.49)))
(add-hook 'lisp-mode-hook '(lambda () (set-random-rainbow-colors 0.5 0.49)))
;; displace color in place ends

;; more details -->  auto-completion layer documenttation
(setq auto-completion-private-snippets-directory (concat dotspacemacs-directory "snippets"))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (github-browse-file clj-refactor edn cider queue evil-commentary hydra highlight anzu iedit undo-tree projectile helm helm-core async f s dash racket-mode faceup tide typescript-mode helm-gtags ggtags emoji-cheat-sheet-plus company-emoji nanoj-dark-theme avk-darkblue-white-theme smex xterm-color shell-pop multi-term flyspell-correct-helm flyspell-correct eshell-z eshell-prompt-extras esh-help auto-dictionary flycheck-haskell company-ghci company-ghc ghc helm-purpose hide-comnt window-purpose imenu-list pug-mode smart-mode-line rich-minority git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl ranger yaml-mode mwim smeargle orgit org magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor grovbox-theme purescript-mode markdown-mode livid-mode skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode helm-c-yasnippet haskell-mode haml-mode gh-md pos-tip flycheck web-completion-data dash-functional tern company yasnippet ac-ispell volatile-highlights vi-tilde-fringe spaceline rainbow-delimiters org-bullets neotree lorem-ipsum ido-vertical-mode helm-themes helm-make google-translate flx-ido fancy-battery eyebrowse evil-mc evil-lisp-state evil-indent-plus evil-exchange evil-ediff evil-args define-word clean-aindent-mode ace-jump-helm-line spacemacs-theme ws-butler window-numbering which-key web-mode web-beautify uuidgen use-package toc-org tagedit smartparens slim-mode scss-mode sass-mode reveal-in-osx-finder restart-emacs request quelpa psci psc-ide powerline popwin persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary org-plus-contrib open-junk-file move-text mmm-mode markdown-toc macrostep linum-relative link-hint less-css-mode launchctl json-mode js2-refactor js-doc jade-mode intero info+ indent-guide hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-swoop helm-projectile helm-mode-manager helm-hoogle helm-flx helm-descbinds helm-css-scss helm-company helm-ag haskell-snippets gruvbox-theme golden-ratio flycheck-pos-tip flycheck-elm fill-column-indicator expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-iedit-state evil-escape evil-anzu eval-sexp-fu emmet-mode elm-mode elisp-slime-nav dumb-jump company-web company-tern company-statistics company-cabal column-enforce-mode coffee-mode cmm-mode bind-map auto-yasnippet auto-highlight-symbol auto-complete auto-compile aggressive-indent adaptive-wrap ace-window ace-link)))
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (helm-pydoc wgrep ivy ob-sml sml-mode github-browse-file clj-refactor edn cider queue evil-commentary hydra highlight anzu iedit undo-tree projectile helm helm-core async f s dash racket-mode faceup tide typescript-mode helm-gtags ggtags emoji-cheat-sheet-plus company-emoji nanoj-dark-theme avk-darkblue-white-theme smex xterm-color shell-pop multi-term flyspell-correct-helm flyspell-correct eshell-z eshell-prompt-extras esh-help auto-dictionary flycheck-haskell company-ghci company-ghc ghc helm-purpose hide-comnt window-purpose imenu-list pug-mode smart-mode-line rich-minority git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl ranger yaml-mode mwim smeargle orgit org magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor grovbox-theme purescript-mode markdown-mode livid-mode skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode helm-c-yasnippet haskell-mode haml-mode gh-md pos-tip flycheck web-completion-data dash-functional tern company yasnippet ac-ispell volatile-highlights vi-tilde-fringe spaceline rainbow-delimiters org-bullets neotree lorem-ipsum ido-vertical-mode helm-themes helm-make google-translate flx-ido fancy-battery eyebrowse evil-mc evil-lisp-state evil-indent-plus evil-exchange evil-ediff evil-args define-word clean-aindent-mode ace-jump-helm-line spacemacs-theme ws-butler window-numbering which-key web-mode web-beautify uuidgen use-package toc-org tagedit smartparens slim-mode scss-mode sass-mode reveal-in-osx-finder restart-emacs request quelpa psci psc-ide powerline popwin persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary org-plus-contrib open-junk-file move-text mmm-mode markdown-toc macrostep linum-relative link-hint less-css-mode launchctl json-mode js2-refactor js-doc jade-mode intero info+ indent-guide hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-swoop helm-projectile helm-mode-manager helm-hoogle helm-flx helm-descbinds helm-css-scss helm-company helm-ag haskell-snippets gruvbox-theme golden-ratio flycheck-pos-tip flycheck-elm fill-column-indicator expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-iedit-state evil-escape evil-anzu eval-sexp-fu emmet-mode elm-mode elisp-slime-nav dumb-jump company-web company-tern company-statistics company-cabal column-enforce-mode coffee-mode cmm-mode bind-map auto-yasnippet auto-highlight-symbol auto-complete auto-compile aggressive-indent adaptive-wrap ace-window ace-link)))
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
