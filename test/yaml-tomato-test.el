(ert-deftest yaml-tomato--get-yaml-key/test ()
  (should (s-equals? (yaml-tomato--get-yaml-key "  abc:") "abc"))
  (should (s-equals? (yaml-tomato--get-yaml-key "hello_world:") "hello_world"))
  (should (s-equals? (yaml-tomato--get-yaml-key "  hello1: abc") "hello1")))
