(require 'yaml-tomato)

(ert-deftest count-white-spaces/test ()
  (should (eq (count-white-spaces "a") 0))
  (should (eq (count-white-spaces " a") 1))
  (should (eq (count-white-spaces " a ") 1))
  (should (eq (count-white-spaces "  a") 2)))
