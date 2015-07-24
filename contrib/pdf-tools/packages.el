;;; packages.el --- pdf-tools Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq pdf-tools-packages
    '(
      pdf-tools
      ))

;; List of packages to exclude.
(setq pdf-tools-excluded-packages '())

(defun pdf-tools/init-pdf-tools ()
  (use-package pdf-tools
    :config
    (progn
      (pdf-tools-install)

      (spacemacs|evilify-map pdf-view-mode-map
        :mode pdf-view-mode
        :bindings
        (kbd "j") 'pdf-view-next-page
        (kbd "k") 'pdf-view-previous-page
        (kbd "s") 'pdf-occur
        (kbd "?") 'pdf-tools-help
        (kbd "g") 'pdf-view-goto-page
        (kbd "m") 'pdf-view-midnight-minor-mode)

      (spacemacs|evilify-map pdf-occur-buffer-mode-map
        :mode pdf-occur-buffer-mode
        :bindings
        (kbd "RET") 'pdf-occur-goto-occurrence
        (kbd "v") 'pdf-occur-view-occurrence)

      (setq pdf-occur-prefer-string-search t)

      ))
  )
;; For each package, define a function pdf-tools/init-<package-name>
;;
;; (defun pdf-tools/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
