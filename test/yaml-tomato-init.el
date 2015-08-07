(defvar yaml-tomato-test/test-path
  (directory-file-name (file-name-directory load-file-name))
  "Path to tests directory.")

(defvar yaml-tomato-test/root-path
  (directory-file-name (file-name-directory yaml-tomato-test/test-path))
  "Path to root directory.")

(load (expand-file-name "yaml-tomato" yaml-tomato-test/root-path) 'noerror 'nomessage)

(require 'ert)

(provide 'yaml-tomato-init)
