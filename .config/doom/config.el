(setq display-line-numbers-type 'relative)

(setq doom-theme 'doom-tokyo-night)

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 15 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 15 :weight 'bold :slant 'italic))

(setq doom-modeline-height 30                   ;; sets modeline height
      doom-modeline-env-load-string "..."       ;; sets modeline loading string
      doom-modeline-bar-width 5)                ;; sets right bar width

(setq org-directory "~/org/")

(beacon-mode 1)

(setq bookmark-default-file "~/.config/doom/bookmarks")

(map! :leader
      (:prefix ("c h" . "Help info from Clippy")
       :desc "Clippy describes function under point" "f" #'clippy-describe-function
       :desc "Clippy describe variable under point" "v" #'clippy-describe-variable))

(setq fancy-splash-image "~/.config/doom/banner/doom-emacs-dash.png")

(map! :leader
      (:prefix ("d". "dired")
       :desc "Open Dired" "d" #'dired
       :desc "Dired Jump To Current Directory" "j" #'dired-jump)
      (:after dired
        (:map dired-mode-map
         :desc "Peep-dired image previews" "d p" #'peep-dired
         :desc "Dired view file" "d v" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "O") 'dired-do-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "+") 'dired-create-directory
  (kbd "N") 'dired-create-empty-file
  (kbd "-") 'dired-do-kill-lines
  (kbd "% l") 'dired-downcase
  (kbd "% m") 'dired-mark-files-regexp
  (kbd "% u") 'dired-upcase
  (kbd "* %") 'dired-mark-files-regexp
  (kbd "* .") 'dired-mark-extension
  (kbd "* /") 'dired-mark-directories
  (kbd "; d") 'epa-dired-do-decrypt
  (kbd "; e") 'epa-dired-do-encrypt)
;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(use-package emojify
  :hook (after-init . global-emojify-mode))

(setq doom-localleader-key "\\")

(xterm-mouse-mode 1)

(setq minimap-window-location 'right)
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle minimap-mode" "m" #'minimap-mode))

(after! neotree
  (setq neo-smart-open t
        neo-window-fixed-size nil))
(after! doom-themes
  (setq doom-neotree-enable-variable-pitch t))
(map! :leader
      :desc "Toggle neotree file viewer" "t n" #'neotree-toggle
      :desc "Open directory in neotree" "d n" #'neotree-dir)

(use-package obsidian
  :ensure t
  :demand t
  :config
  (obsidian-specify-path "~/Documents/Notebook")
  )

(map! :leader
      (:prefix ("O" . "Obsidian")
       :desc "obsidian-insert-link" "l" #'obsidian-insert-link
       :desc "obsidian-insert-wikilink" "w" #'obsidian-insert-wikilink
       :desc "obsidian-jump" "j" #'obsidian-jump
       :desc "obsidian-capture" "n" #'obsidian-capture
       :desc "obsidian-search" "s" #'obsidian-search
       :desc "obsidian-tag-find" "t" #'obsidian-tag-find
       :desc "obsidian-move-file" "m" #'obsidian-move-file))

(map! :leader
      :desc "Org babel Tangle" "\\ B" #'org-babel-tangle)

(after! org
  (setq org-directory "~/org"
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist  ;This overwrites the default Doom org-link-abbrev-list
        '(("google" . "https://www.google.com/search?q=")
          ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-table-convert-region-max-lines 2000
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "BLOG(b)"           ; Blog writing assignments
             "GYM(g)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED"))))    ; Task has been cancelled

(after! org
  (setq org-agenda-files '("~//gdrive:harshv5094@gmail.com:/My Drive/org/agenda.org")))

(setq
   org-fancy-priorities-list '("🟥" "🟧" "🟨")
   org-priority-faces
   '((?A :foreground "#ff6c6b" :weight bold)
     (?B :foreground "#98be65" :weight bold)
     (?C :foreground "#c678dd" :weight bold))
   org-agenda-block-separator 8411)

(setq org-agenda-custom-commands
      '(("v" "A better agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (tags "PRIORITY=\"B\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Medium-priority unfinished tasks:")))
          (tags "PRIORITY=\"C\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Low-priority unfinished tasks:")))
          (tags "customtag"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Tasks marked with customtag:")))

          (agenda "")
          (alltodo "")))))

(setq org-journal-dir "~/org/journal"
      org-journal-date-prefix "* "
      org-journal-time-prefix "** "
      org-journal-date-format "%B %d %Y (%A)"
      org-journal-file-format "%Y-%m-%d")

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                (list 'org-agenda-mode)))
     (rainbow-mode 1))))
(global-rainbow-mode 1 )

(setq shell-file-name "/bin/fish"
      vterm-max-scrollback 5000)
(setq eshell-rc-script "~/.config/doom/eshell/profile"
      echell-aliases-file "~/.config/doom/eshell/aliases"
      eshell-history-size 5000
      eshell-buffer-maximum-lines 5000
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands '("bash" "fish" "btop" "ssh" "top" "zsh"))

;; Eshell Mapping
;; (map! :leader
;;       (:prefix ("e" . "Eshell")
;;       :desc "Eshell"                 "s" #'eshell
;;       :desc "Eshell popup toggle"    "t" #'+eshell/toggle
;;       :desc "Counsel eshell history" "h" #'counsel-esh-history))

;; For Vterm Mapping
(map! :leader
      (:prefix ("v". "Vterm")
       :desc "Vterm Popup Toggle" "t" #'+vterm/toggle))
