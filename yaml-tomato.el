(require 'cl)
(require 's)


(defun count-white-spaces (string)
  (s-count-matches " " (car (s-slice-at "[:alnum]" string))))

(provide 'yaml-tomato)
