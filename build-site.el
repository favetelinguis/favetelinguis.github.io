;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

(require 'ox-publish)

(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
)

(setq org-publish-project-alist
      (list
       (list "henke-larsson-ab-org-site"
	     :recursive t
	     :base-directory "./content" ; where to put all org files
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :with-author t
	     :with-creator t
	     :with-toc t
	     :section-numbers nil
	     :time-stamp-file nil
	     )))

(org-publish-all t)

(message "Build complete!")
