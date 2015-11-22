;;; yaml-tomato.el --- Some useful functions for editing yaml files

;; Author: qrczeno
;; Created: 22-Nov-2015
;; Version: 0.1
;; Keywords: Yaml
;; Package-Requires: ((s "1.9"))

;;; Commentary:

;; Installation:
;;   - Put `yaml-tomato.el' in your Emacs load-path.
;;   - Add this line to your .emacs file:
;;       (require 'yaml-tomato)

;;; Code:

;;;###autoload
(require 's)

(defvar spaces-per-tab 1)

(defun count-white-spaces (string)
  "Count how many white spaces there are at the beginning of the STRING."
  (s-count-matches " " (car (s-slice-at "[:alnum]"
                                        string))))

(defun get-yaml-key (string)
  "Get the yaml tag from STRING."
  (car (s-slice-at ":" (s-trim string))))

(defun yaml-current-path ()
  "Get the tags path under cursor."
  (let* ((path '())
         (get-key (lambda () (get-yaml-key (s-trim (thing-at-point 'line t)))))
         (search-previous (lambda (spaces) (re-search-backward (s-concat "^" (s-repeat spaces " ") "[a-zA-Z\(]") nil t nil)))
         (white-spaces (count-white-spaces (thing-at-point 'line t))))
    (save-excursion
      (while (not (bobp))
        (let* ((current-line (thing-at-point 'line t)))
          (end-of-line)
          (when (funcall search-previous white-spaces)
              (add-to-list 'path (funcall get-key)))
            (setq white-spaces (- white-spaces spaces-per-tab)))))
    path))

(defun yaml-tomato/show-current-path ()
  "Show current yaml path in message buffer."
  (interactive)
  (message (s-join "." (yaml-current-path))))

(defun yaml-tomato/copy ()
  "Copy current path to 'kill-ring'."
  (interactive)
  (kill-new (s-join "." (yaml-current-path))))

(provide 'yaml-tomato)
;;; yaml-tomato.el ends here
