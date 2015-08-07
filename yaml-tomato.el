(require 'cl)
(require 's)

(defun count-white-spaces (string)
  (s-count-matches " " (car (s-slice-at "[:alnum]"
                                        string))))

(defun get-yaml-key (string)
  (car (s-slice-at ":" (s-trim string))))

(defvar spaces-per-tab 2)

(defun show-current-path ()
  "show current yaml path in message buffer"
  (interactive)
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
    (message (s-concat (s-join "." path) "." last-key))))

(global-set-key (kbd "C-x y") 'show-current-path)

(provide 'yaml-tomato)
