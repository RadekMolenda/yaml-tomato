(require 'cl)
(require 's)

(defun count-white-spaces (string)
  (s-count-matches " " (car (s-slice-at "[:alnum]"
                                        string))))

(defun get-yaml-key (string)
  (car (s-slice-at ":" (s-trim string))))

(provide 'yaml-tomato)
