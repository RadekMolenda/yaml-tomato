(require 's)

(defvar spaces-per-tab 1)

(defun count-white-spaces (string)
  (s-count-matches " " (car (s-slice-at "[:alnum]"
                                        string))))

(defun get-yaml-key (string)
  (car (s-slice-at ":" (s-trim string))))

(defun yaml-current-path ()
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
  "show current yaml path in message buffer"
  (interactive)
  (message (s-join "." (yaml-current-path))))

(defun yaml-tomato/copy ()
  "copy current path to kill-ring"
  (interactive)
  (kill-new (s-join "." (yaml-current-path))))

(provide 'yaml-tomato)
