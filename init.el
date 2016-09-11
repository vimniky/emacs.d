(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     helm
     ranger
     (better-defaults :variables better-defaults-move-to-beginning-of-code-first t)
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)
     emacs-lisp
     javascript
     haskell
     vim-powerline
     intero
     react
     purescript
     html
     markdown
     yaml
     (elm :variables
          elm-format-command "elm-format-0.17")
     osx
     syntax-checking
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages
   '(coffee-mode neotree holy-mode)
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
   dotspacemacs-themes '(gruvbox
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; default: "Source Code Pro"
   ;; "Courier New"
   ;; "Monaco"
   ;; "Pt Mono"
   ;; "Inconsolata-dz for Powerline"
   dotspacemacs-default-font '("Source Code Pro"
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
   dotspacemacs-mode-line-unicode-symbols t
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
  )
(defun dotspacemacs/user-config ()
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-insert-state-cursor '("green" box))
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map "U" 'undo-tree-redo)
  (setq ranger-ignored-extensions '("mkv" "iso" "mp4"))

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
  ;; (add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode))

  ;; javascript
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-strict-trailing-comma-warning nil)
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   js-indent-level 2
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
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl ranger yaml-mode mwim smeargle orgit org magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor grovbox-theme purescript-mode markdown-mode livid-mode skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode helm-c-yasnippet haskell-mode haml-mode gh-md pos-tip flycheck web-completion-data dash-functional tern company yasnippet ac-ispell volatile-highlights vi-tilde-fringe spaceline rainbow-delimiters org-bullets neotree lorem-ipsum ido-vertical-mode helm-themes helm-make google-translate flx-ido fancy-battery eyebrowse evil-mc evil-lisp-state evil-indent-plus evil-exchange evil-ediff evil-args define-word clean-aindent-mode ace-jump-helm-line spacemacs-theme ws-butler window-numbering which-key web-mode web-beautify uuidgen use-package toc-org tagedit smartparens slim-mode scss-mode sass-mode reveal-in-osx-finder restart-emacs request quelpa psci psc-ide powerline popwin persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary org-plus-contrib open-junk-file move-text mmm-mode markdown-toc macrostep linum-relative link-hint less-css-mode launchctl json-mode js2-refactor js-doc jade-mode intero info+ indent-guide hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-swoop helm-projectile helm-mode-manager helm-hoogle helm-flx helm-descbinds helm-css-scss helm-company helm-ag haskell-snippets gruvbox-theme golden-ratio flycheck-pos-tip flycheck-elm fill-column-indicator expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-iedit-state evil-escape evil-anzu eval-sexp-fu emmet-mode elm-mode elisp-slime-nav dumb-jump company-web company-tern company-statistics company-cabal column-enforce-mode coffee-mode cmm-mode bind-map auto-yasnippet auto-highlight-symbol auto-complete auto-compile aggressive-indent adaptive-wrap ace-window ace-link)))
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
