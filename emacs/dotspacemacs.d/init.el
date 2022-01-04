;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(systemd
	 ;(org-roam :location local)
	 ;(trello :location local)
	 emacs-lisp
	 treemacs
	 multiple-cursors
	 (org :variables
		  org-enable-roam-support t
		  org-enable-trello-support t
		  org-roam-v2-ack t
		  org-roam-directory "~/org/roam/"
		  )
	 html
	 javascript
	 octave
	 rust
	 csv
	 markdown
	 yaml
	 (python :variables
			 python-indent 4
			 python-indent-offset 4
			 indent-tabs-mode t
			 tab-width 4
			 )
	 lua
	 helm
	 auto-completion
	 better-defaults
	 git
	 (shell :variables
			 shell-default-height 30
			 shell-default-position 'bottom
			 )
	  spell-checking
	  syntax-checking
	  version-control
	  )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(arduino-mode
									  ;org-trello
									  ;org-roam
									  org-autolist
									  gcode-mode
									  yasnippet
									  drag-stuff
									  nodemcu-mode
									  gnuplot-mode
									  graphviz-dot-mode
									  gnu-elpa-keyring-update
									  rtags
									  rtags-xref
									  company-rtags
									  flycheck-rtags
									  )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '(
								(todos . 5)
								(recents . 7)
								(recents-by-project . (3 . 3))
								;(bookmarks . 3)
								)

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
						 spacemacs-dark
						 inkpot
						 nano
						 ;nano-light
						 ;nano
						 ;warm-night
						 ;melancholy
						 dracula
						 spacemacs-light)

   doom-modeline-minor-modes t
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '(
							   ("Source Code Pro"
								:size 10.0
								:weight normal
								:width normal
								:powerline-scale 1.1)
							   ("Symbola"
								:size 10.0
								:weight normal
								:width normal
								:powerline-scale 1.1)
							   ("Fira Mono"
								:size 10.0
								:weight normal
								:width normal
								:powerline-scale 1.1)
							   ("MesloLGS NF"
								:size 10.0
								:weight normal
								:width normal
								:powerline-scale 1.1)
							   )

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 98

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 95

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. Fo example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)

  (setq exec-path-from-shell-check-startup-files nil)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Personal Info
  (setq user-full-name (getenv "USERNAME")
		user-email (getenv "USER-EMAIL"))

  (setq magit-commit-arguments '("-S"))
  (setq tramp-default-method "ssh")

  (setq tab-width 4
		hs-hide-comments-when-hiding-all nil ; don't fold comments
		drag-stuff-global-mode t
		hide-ifdef-shadow t)
  )


(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (set-fontset-font t 'unicode "Symbola")
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.

This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (spacemacs/enable-transparency)
  (spacemacs/toggle-fill-column-indicator-on)
  (flyspell-mode nil)


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Minor modes

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; __   __ _    ____        _                  _
  ;; \ \ / // \  / ___| _ __ (_)_ __  _ __   ___| |_
  ;;  \ V // _ \ \___ \| '_ \| | '_ \| '_ \ / _ \ __|
  ;;   | |/ ___ \ ___) | | | | | |_) | |_) |  __/ |_
  ;;   |_/_/   \_\____/|_| |_|_| .__/| .__/ \___|\__|
  ;;                           |_|   |_|

  (yas-global-mode t)   ;; Enable it globally

  (defun buffer-mode (&optional buffer-or-name)
	"Returns the major mode associated with a buffer.
   If buffer-or-name is nil return current buffer's mode. used by yasnippet"
  (buffer-local-value 'major-mode
			(if buffer-or-name (get-buffer buffer-or-name) (current-buffer))))

  (defun yas/org-very-safe-expand ()
	(let ((yas/fallback-behavior 'return-nil)) (yas-expand)))

  (setq yas-visit-from-menu t)

  (add-to-list 'yas-snippet-dirs '"/home/config-files/emacs/snippets" )

  ;; Bind `TAB' to `yas-expand' when snippet expansion available
  ;; (it will still call whatever is bound to it otherwise).
  (define-key yas-minor-mode-map (kbd "TAB") yas-maybe-expand)

  ;; Bind global key
  (global-set-key (kbd "C-c e") 'yas-expand)

  (yas-reload-all)
										;(yas-global-mode t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; All mode hooks


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; all code-like modes
  (add-hook 'prog-mode
			(lambda ()
			  (spacemacs/toggle-fill-column-indicator-on)
			  (flyspell-mode-off)
			))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;  ____            _
  ;;  |  _ \ _   _ ___| |_
  ;;  | |_) | | | / __| __|
  ;;  |  _ <| |_| \__ \ |_
  ;;  |_| \_\\__,_|___/\__|
  (add-hook 'rust-mode
			(lambda ()
			  (auto-fill-mode)
			  (evil-close-folds)
			  ))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;   ____
  ;;  / ___|
  ;;  | |
  ;;  | |___
  ;;  \____|
  (add-hook 'cc-mode
			 (lambda ()
			   (hide-ifdef-mode)
			   (rtags-start-process-unless-running)
			   (flycheck-mode t)
			   (evil-close-folds)
			   (auto-fill-mode)
			   (hide-ifdefs)
			   ))
  (setq c-syntactic-indentation t
		c-default-style "linux"
		c-basic-offset 4
		c-tab-always-indent t
		indent-tabs-mode nil
   )

  (defun trim-at-col (line)
	"trim C comments at a specified column"
	(interactive (list (if current-prefix-arg
						   (read-from-minibuffer "line to trim at: ") nil)))
	(end-of-line)
	(backward-char 9)
	(setq c (- (point) (if line line '80)))
	(if (> c 0) (universal-argument c "-") (universal-argument (* c -1) "DEL"))
	)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Objdump mode

  ;; set to read only by default
  (add-to-list 'auto-mode-alist '("\\.objdump\\'" . view-mode))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;     _                           _     _
  ;;    / \   ___ ___  ___ _ __ ___ | |__ | | ___ _ __
  ;;   / _ \ / __/ __|/ _ \ '_ ` _ \| '_ \| |/ _ \ '__|
  ;;  / ___ \\__ \__ \  __/ | | | | | |_) | |  __/ |
  ;; /_/   \_\___/___/\___|_| |_| |_|_.__/|_|\___|_|
  (add-hook 'asm-mode-hook
			(lambda ()
			  (setq tab-width 8
					electric-indent-mode nil
					indent-tabs-mode t)
			  (auto-fill-mode)
			  ))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;   ____ _   _ _   _   __  __       _
  ;;  / ___| \ | | | | | |  \/  | __ _| | _____
  ;; | |  _|  \| | | | | | |\/| |/ _` | |/ / _ \
  ;; | |_| | |\  | |_| | | |  | | (_| |   <  __/
  ;;  \____|_| \_|\___/  |_|  |_|\__,_|_|\_\___|
  (add-hook  'makefile-mode (lambda () (setq tab-width 4)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;  ____        _   _
  ;; |  _ \ _   _| |_| |__   ___  _ __
  ;; | |_) | | | | __| '_ \ / _ \| '_ \
  ;; |  __/| |_| | |_| | | | (_) | | | |
  ;; |_|    \__, |\__|_| |_|\___/|_| |_|
  ;;        |___/
  (add-hook 'python-mode-hook
	  (lambda ()
		(spacemacs/toggle-fill-column-indicator-on)
		(anaconda-eldoc-mode)
		(auto-fill-mode)
		))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;   ___  ____   ____
  ;;  / _ \|  _ \ / ___|
  ;; | | | | |_) | |  _
  ;; | |_| |  _ <| |_| |
  ;;  \___/|_| \_\\____|
  (setq  org-confirm-babel-evaluate nil
		 org-tag-alist '((work . w) (personal . p) (college . c) (leisure . l))
		 org-image-actual-width 600
		 org-startup-with-inline-images t
		 org-directory "~/org/"
		 org-agenda-files '( "~/org/" )
		 org-default-notes-file (concat org-directory "todo.org")
		 org-startup-folded t
		 org-agenda-start-on-weekday 1 ;; set week to start on monday
		 org-todo-keywords '("TODO" "WAIT" "|" "DONE" "WTDO")
		 org-todo-keyword-faces'(("TODO" . org-todo)
								 ("WAIT" . (:foreground "#F0C674" :weight bold))
								 ("WTDO" . org-done)
								 ("TEST" . (:foreground "#6eb0e9" :weight bold))
								 ("TFIX" . (:foreground "#b34e6b" :weight bold))
								 ("DONE" . org-done))
		 org-latex-packages-alist '(("margin=2cm" "geometry" nil)
									(" " "indentfirst" " "))
		 org-format-latex-options '(:scale 1.5)
		 ;;org-roam-directory (file-truename "~/org")
		 )

  (add-hook 'org-mode-hook
			(lambda ()
			  (yas-minor-mode)
			  (make-variable-buffer-local 'yas/trigger-key)
			  (setq-local yas/trigger-key [tab])
			  (setq indent-tabs-mode nil)
			  (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
			  (define-key yas/keymap [tab] 'yas/next-field)
			  (flycheck-mode 1)
			  (flyspell-mode-on)
			  (org-autolist-mode)
			  ;(org-bullets-mode)
			  (org-indent-mode)
			  (visual-line-mode)
			  (local-set-key (kbd "C-c C-x s") 'org-sort-headings-todo-prio)
			  (local-set-key [c-x c-c c-r] 'org-preview-latex-default-process)
			  ))

  ;; Babel config
  (setq org-babel-load-languages '((gnuplot . t)
								   (emacs-lisp . t)
								   (dot . t)
								   ))
  (defun my/fix-inline-images ()
	(when org-inline-image-overlays
	  (org-redisplay-inline-images)))

  (add-hook 'org-babel-after-execute-hook 'my/fix-inline-images)

  (defun org-insert-image-from-clipboard ()
	"Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file. Depends in X.org to work (for now)"
	(interactive)
	(setq folder-name (concat (file-name-sans-extension (buffer-file-name)) "-orgimg"))
	(message folder-name)
	(if (not (file-directory-p folder-name))
		(make-directory folder-name nil))
	(setq filename
		  (concat folder-name "/"
				  (make-temp-name (format-time-string "%Y%m%d_%H%M%S_")) ".png"))
	;; TODO: add switch to detect Xorg or wayland session using (getenv "XDG_SESSION_TYPE")
	(insert
	 (if (string=
		  (car
		   (split-string
			(shell-command-to-string
			 (concat "xclip -selection clip -t image/png  -o >> " filename ))
						":")) "Error")
		 (message "clipboard does not contain a image!")
	   (concat "[[./" (file-relative-name filename) "]]")))
	(org-display-inline-images))

  (defun org-sort-headings-todo-prio ()
	"sort org headings first by priority then by todo order"
	(interactive)
	(org-sort-entries t ?p )
	(org-sort-entries t ?o ))

  (defun dfeich/org-export-delete-commented-cols (back-end)
	"Delete columns $2 to $> marked as `<#>' on a row with `/' in $1.
	If you want a non-empty column $1 to be deleted make it $2 by
	inserting an empty column before and adding `/' in $1."
	(while (re-search-forward "^[ \t]*| +/ +|\\(.*|\\)? +\\(<#>\\) *|" nil t)
	  (goto-char (match-beginning 2))
	  (org-table-delete-column)
	  (beginning-of-line)))

  (add-hook 'org-export-before-processing-hook #'dfeich/org-export-delete-commented-cols)

  ;; Keybinds
  (global-set-key (kbd "M-m b o")
				  (lambda () (interactive)
					(find-file org-default-notes-file)))
  (global-set-key (kbd "C-c c") 'org-capture)

  (spacemacs/set-leader-keys "n l" 'org-roam-buffer-toggle)
  (spacemacs/set-leader-keys "n f" 'org-roam-node-find)
  (spacemacs/set-leader-keys "n i" 'org-roam-node-insert)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Company mode
  (global-company-mode)

  ;; Set company mode to not suggest numbers
  (push (apply-partially #'cl-remove-if
						 (lambda (c)
						   (string-match-p "[0-9]+" c)))
		company-transformers)

  ;;;;;;;;;;;;;;;;;;;;
  ;; EVil

  ;; close and open folds
  (global-set-key (kbd "<backtab>") 'evil-toggle-fold)
  (global-set-key (kbd "M-m c f") 'evil-close-folds)
  (global-set-key (kbd "M-m o f") 'evil-open-folds)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Multi-cursor

  (global-set-key (kbd "C-c m c") 'mc/edit-lines)
  (global-set-key [C-mouse-1] 'mc/add-cursor-on-click)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Flyspell

  ;; only enable flyspell when needed
  (flyspell-mode-off)
  (flyspell-mode nil)

  ;; Isto e' para habilitar o dicionario em portugues brasileiro
  (setq ispell-dictionary "brasileiro")
  (setq ispell-alternate-dictionary "english")

  ;(setq ispell-dictionary-alist (list (map 'list  'list (list "brasileiro" "english"))))
  (setq flyspell-issue-message-flag nil)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; General Shortcuts

  ;multiframe window movement
  (global-set-key (kbd "M-n") 'next-multiframe-window)

  ;; text movement keybinds
  (global-set-key [M-up] 'drag-stuff-up)
  (global-set-key [M-down] 'drag-stuff-down)
  (global-set-key [M-left] 'drag-stuff-left)
  (global-set-key [M-right] 'drag-stuff-right)
  ;;(global-set-key [M-down] 'move-text-down)
  ;;(global-set-key [M-up] 'move-text-up)

  ;; Zoom controls
  (global-set-key  [C-mouse-4] 'zoom-frm-in)
  (global-set-key  [C-mouse-5] 'zoom-frm-out)
  (global-set-key (kbd "C-+") 'zoom-frm-in)
  (global-set-key (kbd "C--") 'zoom-frm-out)

  (global-unset-key (kbd "C-v")) ; remove annoying conflict
)


;;;;;;;;;;;;;;;;;;;;;;
;; not write anything past this comment. This is where Emacs will do
;; variable definitions.

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-capture-templates
;;    (quote
;;	(("n" "Quick Note" entry
;;	  (file org-default-notes-file)
;;	  "* %T %?"))))
;;  '(package-selected-packages
;;    (quote
;;	(company-fuzzy d-mode company-dcd ivy flycheck-dmd-dub rotate wide-column visual-fill-column company-c-headers auto-complete-clang highlight-doxygen lv f web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc tern coffee-mode gnu-elpa-keyring-update mmm-mode yasnippet company-arduino multiple-cursors org-edit-latex rainbow-mode rainbow-identifiers color-identifiers-mode org-projectile-helm dockerfile-mode csv-mode auctex nodemcu-mode lua-mode org-projectile org-pomodoro alert log4e unfill org-category-capture org-present gntp org-mime org-download mwim htmlize gnuplot transient drag-stuff org-babel-eval-in-repl babel xterm-color shell-pop multi-term git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter flyspell-correct-helm flyspell-correct eshell-z eshell-prompt-extras esh-help diff-hl auto-dictionary ess-smart-equals ess-R-data-view ctable ess julia-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit ghub let-alist with-editor arduino-mode yapfify yaml-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toml-mode toc-org spaceline powerline restart-emacs request rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox spinner org-plus-contrib org-bullets org-autolist open-junk-file neotree move-text markdown-toc macrostep lorem-ipsum live-py-mode linum-relative link-hint indent-guide hydra hy-mode dash-functional hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gh-md fuzzy flycheck-rust flycheck-pos-tip pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word cython-mode company-statistics company-anaconda company column-enforce-mode clean-aindent-mode cargo markdown-mode rust-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed anaconda-mode pythonic dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup)))
;;  '(safe-local-variable-values)
;;  )

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
 '(custom-safe-themes
   '("aca70b555c57572be1b4e4cec57bc0445dcb24920b12fb1fea5f6baa7f2cad02" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(evil-want-Y-yank-to-eol nil)
 '(org-capture-templates
   '(("n" "Quick Note" entry
	  (file org-default-notes-file)
	  "* %T %?")))
 '(package-selected-packages
   '(org-trello helm-rtags kotlin-mode gcode-mode rtags-xref company-rtags flycheck-rtags nano-theme systemd graphviz-dot-mode org-contrib gnuplot-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode counsel-css company-web web-completion-data activity-watch-mode prettier-js nodejs-repl import-js grizzl impatient-mode helm-gtags ggtags dap-mode lsp-treemacs bui lsp-mode counsel-gtags counsel swiper add-node-modules-path company-fuzzy d-mode company-dcd ivy flycheck-dmd-dub rotate wide-column visual-fill-column company-c-headers auto-complete-clang highlight-doxygen lv f web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc tern coffee-mode mmm-mode yasnippet company-arduino multiple-cursors org-edit-latex rainbow-mode rainbow-identifiers color-identifiers-mode org-projectile-helm dockerfile-mode csv-mode auctex nodemcu-mode lua-mode org-projectile org-pomodoro alert log4e unfill org-category-capture org-present gntp org-mime org-download mwim htmlize gnuplot transient drag-stuff org-babel-eval-in-repl babel xterm-color shell-pop multi-term git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter flyspell-correct-helm flyspell-correct eshell-z eshell-prompt-extras esh-help diff-hl auto-dictionary ess-smart-equals ess-R-data-view ctable ess julia-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit ghub let-alist with-editor arduino-mode yapfify yaml-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toml-mode toc-org spaceline powerline restart-emacs request rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox spinner org-plus-contrib org-bullets org-autolist open-junk-file neotree move-text markdown-toc macrostep lorem-ipsum live-py-mode linum-relative link-hint indent-guide hydra hy-mode dash-functional hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gh-md fuzzy flycheck-rust flycheck-pos-tip pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word cython-mode company-statistics company-anaconda company column-enforce-mode clean-aindent-mode cargo markdown-mode rust-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed anaconda-mode pythonic dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup))
 '(safe-local-variable-values
   '((eval setq company-clang-arguments
		   (list "-I/home/luctins/repo/macnica/celesc_identificador/sw/esp32/wifi_connector/main/include/" "-I/home/luctins/repo/macnica/esp-idf/components/newlib/platform_include/" "-I/home/luctins/repo/macnica/esp-idf/components/freertos/include/" "-I/home/luctins/repo/macnica/esp-idf/components/freertos/xtensa/include/" "-I/home/luctins/repo/macnica/esp-idf/components/heap/include/" "-I/home/luctins/repo/macnica/esp-idf/components/log/include/" "-I/home/luctins/repo/macnica/esp-idf/components/lwip/include/apps/" "-I/home/luctins/repo/macnica/esp-idf/components/lwip/include/apps/sntp/" "-I/home/luctins/repo/macnica/esp-idf/components/lwip/lwip/src/include/" "-I/home/luctins/repo/macnica/esp-idf/components/lwip/port/esp32/include/" "-I/home/luctins/repo/macnica/esp-idf/components/lwip/port/esp32/include/arch/" "-I/home/luctins/repo/macnica/esp-idf/components/soc/src/esp32/./" "-I/home/luctins/repo/macnica/esp-idf/components/soc/src/esp32/include/" "-I/home/luctins/repo/macnica/esp-idf/components/soc/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_rom/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_common/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_system/include/" "-I/home/luctins/repo/macnica/esp-idf/components/xtensa/include/" "-I/home/luctins/repo/macnica/esp-idf/components/xtensa/esp32/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp32/include/" "-I/home/luctins/repo/macnica/esp-idf/components/driver/include/" "-I/home/luctins/repo/macnica/esp-idf/components/driver/esp32/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_ringbuf/include/" "-I/home/luctins/repo/macnica/esp-idf/components/efuse/include/" "-I/home/luctins/repo/macnica/esp-idf/components/efuse/esp32/include/" "-I/home/luctins/repo/macnica/esp-idf/components/espcoredump/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_timer/include/" "-I/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/./" "-I/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/include/" "-I/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/../include/" "-I/home/luctins/repo/macnica/esp-idf/components/vfs/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_wifi/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_wifi/esp32/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_event/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_netif/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_eth/include/" "-I/home/luctins/repo/macnica/esp-idf/components/tcpip_adapter/include/" "-I/home/luctins/repo/macnica/esp-idf/components/app_trace/include/" "-I/home/luctins/repo/macnica/esp-idf/components/mbedtls/port/include/" "-I/home/luctins/repo/macnica/esp-idf/components/mbedtls/mbedtls/include/" "-I/home/luctins/repo/macnica/esp-idf/components/mbedtls/esp_crt_bundle/include/" "-I/home/luctins/repo/macnica/esp-idf/components/bootloader_support/include/" "-I/home/luctins/repo/macnica/esp-idf/components/app_update/include/" "-I/home/luctins/repo/macnica/esp-idf/components/spi_flash/include/" "-I/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/include/" "-I/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/port/include/" "-I/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/include/esp_supplicant/" "-I/home/luctins/repo/macnica/esp-idf/components/nvs_flash/include/" "-I/home/luctins/repo/macnica/esp-idf/components/pthread/include/" "-I/home/luctins/repo/macnica/esp-idf/components/perfmon/include/" "-I/home/luctins/repo/macnica/esp-idf/components/asio/asio/asio/include/" "-I/home/luctins/repo/macnica/esp-idf/components/asio/port/include/" "-I/home/luctins/repo/macnica/esp-idf/components/cbor/port/include/" "-I/home/luctins/repo/macnica/esp-idf/components/coap/port/include/" "-I/home/luctins/repo/macnica/esp-idf/components/coap/port/include/coap/" "-I/home/luctins/repo/macnica/esp-idf/components/coap/libcoap/include/" "-I/home/luctins/repo/macnica/esp-idf/components/coap/libcoap/include/coap2/" "-I/home/luctins/repo/macnica/esp-idf/components/console/" "-I/home/luctins/repo/macnica/esp-idf/components/nghttp/port/include/" "-I/home/luctins/repo/macnica/esp-idf/components/nghttp/nghttp2/lib/includes/" "-I/home/luctins/repo/macnica/esp-idf/components/esp-tls/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_adc_cal/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_gdbstub/include/" "-I/home/luctins/repo/macnica/esp-idf/components/tcp_transport/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_http_client/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_http_server/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_https_ota/include/" "-I/home/luctins/repo/macnica/esp-idf/components/protobuf-c/protobuf-c/" "-I/home/luctins/repo/macnica/esp-idf/components/protocomm/include/common/" "-I/home/luctins/repo/macnica/esp-idf/components/protocomm/include/security/" "-I/home/luctins/repo/macnica/esp-idf/components/protocomm/include/transports/" "-I/home/luctins/repo/macnica/esp-idf/components/mdns/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_local_ctrl/include/" "-I/home/luctins/repo/macnica/esp-idf/components/sdmmc/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_serial_slave_link/include/" "-I/home/luctins/repo/macnica/esp-idf/components/esp_websocket_client/include/" "-I/home/luctins/repo/macnica/esp-idf/components/expat/expat/expat/lib/" "-I/home/luctins/repo/macnica/esp-idf/components/expat/port/include/" "-I/home/luctins/repo/macnica/esp-idf/components/wear_levelling/include/" "-I/home/luctins/repo/macnica/esp-idf/components/fatfs/diskio/" "-I/home/luctins/repo/macnica/esp-idf/components/fatfs/vfs/" "-I/home/luctins/repo/macnica/esp-idf/components/fatfs/src/" "-I/home/luctins/repo/macnica/esp-idf/components/freemodbus/common/include/" "-I/home/luctins/repo/macnica/esp-idf/components/idf_test/include/" "-I/home/luctins/repo/macnica/esp-idf/components/idf_test/include/esp32/" "-I/home/luctins/repo/macnica/esp-idf/components/jsmn/include/" "-I/home/luctins/repo/macnica/esp-idf/components/json/cJSON/" "-I/home/luctins/repo/macnica/esp-idf/components/libsodium/libsodium/src/libsodium/include/" "-I/home/luctins/repo/macnica/esp-idf/components/libsodium/port_include/" "-I/home/luctins/repo/macnica/esp-idf/components/mqtt/esp-mqtt/include/" "-I/home/luctins/repo/macnica/esp-idf/components/openssl/include/" "-I/home/luctins/repo/macnica/esp-idf/components/spiffs/include/" "-I/home/luctins/repo/macnica/esp-idf/components/ulp/include/" "-I/home/luctins/repo/macnica/esp-idf/components/unity/include/" "-I/home/luctins/repo/macnica/esp-idf/components/unity/unity/src/" "-I/home/luctins/repo/macnica/esp-idf/components/wifi_provisioning/include/"))
	 (eval setq flycheck-clang-include-path
		   (list "/home/luctins/repo/macnica/celesc_identificador/sw/esp32/wifi_connector/main/include/" "/home/luctins/repo/macnica/esp-idf/components/newlib/platform_include/" "/home/luctins/repo/macnica/esp-idf/components/freertos/include/" "/home/luctins/repo/macnica/esp-idf/components/freertos/xtensa/include/" "/home/luctins/repo/macnica/esp-idf/components/heap/include/" "/home/luctins/repo/macnica/esp-idf/components/log/include/" "/home/luctins/repo/macnica/esp-idf/components/lwip/include/apps/" "/home/luctins/repo/macnica/esp-idf/components/lwip/include/apps/sntp/" "/home/luctins/repo/macnica/esp-idf/components/lwip/lwip/src/include/" "/home/luctins/repo/macnica/esp-idf/components/lwip/port/esp32/include/" "/home/luctins/repo/macnica/esp-idf/components/lwip/port/esp32/include/arch/" "/home/luctins/repo/macnica/esp-idf/components/soc/src/esp32/./" "/home/luctins/repo/macnica/esp-idf/components/soc/src/esp32/include/" "/home/luctins/repo/macnica/esp-idf/components/soc/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_rom/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_common/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_system/include/" "/home/luctins/repo/macnica/esp-idf/components/xtensa/include/" "/home/luctins/repo/macnica/esp-idf/components/xtensa/esp32/include/" "/home/luctins/repo/macnica/esp-idf/components/esp32/include/" "/home/luctins/repo/macnica/esp-idf/components/driver/include/" "/home/luctins/repo/macnica/esp-idf/components/driver/esp32/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_ringbuf/include/" "/home/luctins/repo/macnica/esp-idf/components/efuse/include/" "/home/luctins/repo/macnica/esp-idf/components/efuse/esp32/include/" "/home/luctins/repo/macnica/esp-idf/components/espcoredump/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_timer/include/" "/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/./" "/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/include/" "/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/../include/" "/home/luctins/repo/macnica/esp-idf/components/vfs/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_wifi/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_wifi/esp32/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_event/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_netif/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_eth/include/" "/home/luctins/repo/macnica/esp-idf/components/tcpip_adapter/include/" "/home/luctins/repo/macnica/esp-idf/components/app_trace/include/" "/home/luctins/repo/macnica/esp-idf/components/mbedtls/port/include/" "/home/luctins/repo/macnica/esp-idf/components/mbedtls/mbedtls/include/" "/home/luctins/repo/macnica/esp-idf/components/mbedtls/esp_crt_bundle/include/" "/home/luctins/repo/macnica/esp-idf/components/bootloader_support/include/" "/home/luctins/repo/macnica/esp-idf/components/app_update/include/" "/home/luctins/repo/macnica/esp-idf/components/spi_flash/include/" "/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/include/" "/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/port/include/" "/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/include/esp_supplicant/" "/home/luctins/repo/macnica/esp-idf/components/nvs_flash/include/" "/home/luctins/repo/macnica/esp-idf/components/pthread/include/" "/home/luctins/repo/macnica/esp-idf/components/perfmon/include/" "/home/luctins/repo/macnica/esp-idf/components/asio/asio/asio/include/" "/home/luctins/repo/macnica/esp-idf/components/asio/port/include/" "/home/luctins/repo/macnica/esp-idf/components/cbor/port/include/" "/home/luctins/repo/macnica/esp-idf/components/coap/port/include/" "/home/luctins/repo/macnica/esp-idf/components/coap/port/include/coap/" "/home/luctins/repo/macnica/esp-idf/components/coap/libcoap/include/" "/home/luctins/repo/macnica/esp-idf/components/coap/libcoap/include/coap2/" "/home/luctins/repo/macnica/esp-idf/components/console/" "/home/luctins/repo/macnica/esp-idf/components/nghttp/port/include/" "/home/luctins/repo/macnica/esp-idf/components/nghttp/nghttp2/lib/includes/" "/home/luctins/repo/macnica/esp-idf/components/esp-tls/" "/home/luctins/repo/macnica/esp-idf/components/esp_adc_cal/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_gdbstub/include/" "/home/luctins/repo/macnica/esp-idf/components/tcp_transport/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_http_client/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_http_server/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_https_ota/include/" "/home/luctins/repo/macnica/esp-idf/components/protobuf-c/protobuf-c/" "/home/luctins/repo/macnica/esp-idf/components/protocomm/include/common/" "/home/luctins/repo/macnica/esp-idf/components/protocomm/include/security/" "/home/luctins/repo/macnica/esp-idf/components/protocomm/include/transports/" "/home/luctins/repo/macnica/esp-idf/components/mdns/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_local_ctrl/include/" "/home/luctins/repo/macnica/esp-idf/components/sdmmc/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_serial_slave_link/include/" "/home/luctins/repo/macnica/esp-idf/components/esp_websocket_client/include/" "/home/luctins/repo/macnica/esp-idf/components/expat/expat/expat/lib/" "/home/luctins/repo/macnica/esp-idf/components/expat/port/include/" "/home/luctins/repo/macnica/esp-idf/components/wear_levelling/include/" "/home/luctins/repo/macnica/esp-idf/components/fatfs/diskio/" "/home/luctins/repo/macnica/esp-idf/components/fatfs/vfs/" "/home/luctins/repo/macnica/esp-idf/components/fatfs/src/" "/home/luctins/repo/macnica/esp-idf/components/freemodbus/common/include/" "/home/luctins/repo/macnica/esp-idf/components/idf_test/include/" "/home/luctins/repo/macnica/esp-idf/components/idf_test/include/esp32/" "/home/luctins/repo/macnica/esp-idf/components/jsmn/include/" "/home/luctins/repo/macnica/esp-idf/components/json/cJSON/" "/home/luctins/repo/macnica/esp-idf/components/libsodium/libsodium/src/libsodium/include/" "/home/luctins/repo/macnica/esp-idf/components/libsodium/port_include/" "/home/luctins/repo/macnica/esp-idf/components/mqtt/esp-mqtt/include/" "/home/luctins/repo/macnica/esp-idf/components/openssl/include/" "/home/luctins/repo/macnica/esp-idf/components/spiffs/include/" "/home/luctins/repo/macnica/esp-idf/components/ulp/include/" "/home/luctins/repo/macnica/esp-idf/components/unity/include/" "/home/luctins/repo/macnica/esp-idf/components/unity/unity/src/" "/home/luctins/repo/macnica/esp-idf/components/wifi_provisioning/include/"))
	 (eval progn
		   (setq-local flycheck-clang-include-path
					   (map 'list 'expand-file-name
							(append
							 '("./include/" "../build/include/")
							 (map 'list
								  (lambda
									(subpath)
									(concat "~/.esp-idf/components/" subpath))
								  (list "bt/host/bluedroid/btc/profile/esp/include" "bt/host/bluedroid/btc/profile/esp/blufi/include" "bt/host/bluedroid/stack/include" "bt/host/bluedroid/stack/rfcomm/include" "bt/host/bluedroid/stack/gatt/include" "bt/host/bluedroid/stack/avrc/include" "bt/host/bluedroid/stack/avdt/include" "bt/host/bluedroid/stack/gap/include" "bt/host/bluedroid/stack/btm/include" "bt/host/bluedroid/stack/a2dp/include" "bt/host/bluedroid/stack/l2cap/include" "bt/host/bluedroid/stack/avct/include" "bt/host/bluedroid/stack/sdp/include" "bt/host/bluedroid/stack/smp/include" "esp_http_client/include" "esp_http_client/lib/include" "esp_hid/include" "lwip/include" "lwip/lwip/src/include" "lwip/port/esp32/include" "esp_system/include" "esp_system/port/include" "protocomm/include" "tcp_transport/include" "cbor/port/include" "freertos/include" "freertos/port/xtensa/include" "freertos/port/riscv/include" "bootloader_support/include" "esp32/include" "xtensa/include" "xtensa/esp32/include" "xtensa/esp32s3/include" "xtensa/esp32s2/include" "freemodbus/common/include" "freemodbus/modbus/include" "esp_https_ota/include" "esp_timer/include" "ulp/include" "ulp/ulp_riscv/include" "esp_hw_support/include" "esp_rom/include" "wpa_supplicant/include" "wpa_supplicant/port/include" "esptool_py/esptool/flasher_stub/include" "openssl/include" "riscv/include" "soc/include" "soc/esp32/include" "soc/esp32c3/include" "soc/esp32s3/include" "soc/esp32s2/include" "spiffs/include" "unity/include" "nghttp/nghttp2/third-party/llhttp/include" "nghttp/nghttp2/third-party/mruby/include" "nghttp/nghttp2/third-party/mruby/mrbgems/mruby-io/include" "nghttp/nghttp2/third-party/mruby/mrbgems/mruby-time/include" "nghttp/port/include" "tinyusb/additions/include" "tinyusb/tinyusb/hw/mcu/nordic/nrf5x/s140_nrf52_6.1.1_API/include" "tinyusb/tinyusb/hw/bsp/esp32s2_saola_1/led_strip/include" "tinyusb/tinyusb/hw/bsp/fomu/include" "sdmmc/include" "idf_test/include" "esp_websocket_client/include" "jsmn/include" "perfmon/include" "esp_ipc/include" "esp_netif/include" "efuse/include" "efuse/esp32/include" "efuse/test/include" "efuse/esp32c3/include" "efuse/esp32s3/include" "efuse/esp32s2/include" "expat/port/include" "esp_serial_slave_link/include" "nvs_flash/include" "esp_https_server/include" "heap/include" "esp_wifi/include" "esp_wifi/esp32/include" "esp_wifi/esp32s3/include" "esp_wifi/esp32s2/include" "espcoredump/include" "esp32c3/include" "pthread/include" "log/include" "spi_flash/include" "spi_flash/sim/stubs/freertos/include" "spi_flash/sim/stubs/bootloader_support/include" "spi_flash/sim/stubs/esp_timer/include" "spi_flash/sim/stubs/soc/include" "spi_flash/sim/stubs/sdmmc/include" "spi_flash/sim/stubs/newlib/include" "spi_flash/sim/stubs/log/include" "spi_flash/sim/stubs/vfs/include" "spi_flash/sim/stubs/driver/include" "esp_http_server/include" "tcpip_adapter/include" "mdns/include" "esp_pm/include" "wifi_provisioning/include" "esp_ringbuf/include" "esp32s3/include" "hal/include" "hal/esp32/include" "hal/esp32c3/include" "hal/esp32s3/include" "hal/esp32s2/include" "esp_event/include" "coap/port/include" "coap/libcoap/include" "esp32s2/include" "vfs/include" "esp_gdbstub/include" "libsodium/libsodium/src/libsodium/include" "esp_local_ctrl/include" "mqtt/esp-mqtt/include" "mqtt/esp-mqtt/lib/include" "driver/include" "driver/esp32/include" "driver/test/include" "driver/test/touch_sensor_test/include" "driver/test/param_test/include" "driver/esp32c3/include" "driver/esp32s3/include" "driver/esp32s2/include" "esp_adc_cal/include" "app_update/include" "mbedtls/esp_crt_bundle/include" "mbedtls/port/include" "mbedtls/mbedtls/include" "asio/port/include" "asio/asio/asio/include" "wear_levelling/include" "esp_common/include"))))
					   company-clang-arguments
					   (map 'list
							(lambda
							  (a)
							  (concat "-I" a))
							flycheck-clang-include-path)
					   flycheck-gcc-include-path flycheck-clang-include-path))
	 (eval progn
		   (setq flycheck-clang-include-path
				 (list
				  (expand-file-name ".")
				  (expand-file-name "../../../bsp/drivers/inc")
				  (expand-file-name "../../../bsp/HAL/inc")
				  (expand-file-name "../../../bsp/")
				  (expand-file-name "../../../shared")))
		   flycheck-clang-includes "../../../shared/shared-def.h"
		   (setq company-clang-arguments
				 (map 'list
					  (lambda
						(a)
						(concat "-I" a))
					  flycheck-clang-include-path)))
	 (eval progn
		   (setq-local flycheck-clang-include-path
					   (map 'list 'expand-file-name
							(list "./inc" "../bsp/HAL/inc/" "../bsp/drivers/inc/" "../bsp" "../../shared"))
					   flycheck-clang-includes
					   (map 'list 'expand-file-name
							(list "../../shared/shared-def.h"))
					   company-clang-arguments
					   (map 'list
							(lambda
							  (a)
							  (concat "-I" a))
							flycheck-clang-include-path)
					   flycheck-gcc-include-path flycheck-clang-include-path))
	 (org-image-actual-height . 200)))
 '(send-mail-function 'smtpmail-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill undo-tree toml-mode toc-org tagedit systemd spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode rtags-xref restart-emacs rainbow-delimiters racer rust-mode pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-roam emacsql-sqlite emacsql org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets org-autolist open-junk-file nodemcu-mode neotree mwim multi-term move-text mmm-mode markdown-toc magit-gitflow magit-popup magit magit-section macrostep lua-mode lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint json-mode json-snatcher js2-refactor multiple-cursors js2-mode js-doc indent-guide hydra lv hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile projectile helm-mode-manager helm-make helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode graphviz-dot-mode google-translate golden-ratio gnuplot-mode gnuplot gnu-elpa-keyring-update git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter git-commit with-editor transient gh-md gcode-mode fuzzy flyspell-correct-helm flyspell-correct flycheck-rust flycheck-rtags flycheck-pos-tip pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump drag-stuff diminish diff-hl define-word cython-mode csv-mode company-web web-completion-data company-statistics company-rtags company-anaconda company column-enforce-mode coffee-mode clean-aindent-mode cargo markdown-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol ht auto-dictionary auto-compile packed arduino-mode spinner anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup rtags epc)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )