(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(require 'linum)
(setq ring-bell-function 'ignore) ; アラートのベルを鳴らさないようにする
(blink-cursor-mode 0) ; カーソルが点滅しないようにする
(global-linum-mode t) ; 行数表示

(set-default-coding-systems 'utf-8) ; utf-8 にする
(prefer-coding-system 'utf-8)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(let ((bootstrap-file (concat user-emacs-directory "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 3))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package bind-key)

(setq straight-use-package-by-default t)

;; init-loaderをインストール&読み込み
(use-package init-loader)

;; ~/.emacs.d/inits/ 以下のファイルを全部読み込む
(init-loader-load)

