(require 'cl)
(require 's)

(defvar spaces-per-tab 2)

(defun count-white-spaces (string)
  (s-count-matches " " (car (s-slice-at "[:alnum]"
                                        string))))

(defun get-yaml-key (string)
  (car (s-slice-at ":" (s-trim string))))

(defun yaml-current-path ()
  (let* ((path '())
         (get-key (lambda () (get-yaml-key (s-trim (thing-at-point 'line t)))))
         (search-previous (lambda (spaces) (re-search-backward (s-concat "^" (s-repeat spaces " ") "[a-zA-Z\(]"))))
         (last-key (funcall get-key)))
    (save-excursion
      (while (not (bobp))
        (let* ((current-line (thing-at-point 'line t))
               (spaces (- (count-white-spaces current-line) spaces-per-tab)))
          (funcall search-previous spaces)
          (add-to-list 'path (funcall get-key)))))
    (s-concat (s-join "." path) "." last-key)))

(defun show-current-path ()
  "show current yaml path in message buffer"
  (interactive)
  (message (yaml-current-path)))

(defun yaml-tomato/copy ()
  "copy current path to kill-ring"
  (interactive)
  (kill-new (yaml-current-path)))

(provide 'yaml-tomato)
