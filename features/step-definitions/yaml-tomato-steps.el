(Then "^I should copied \"\\([^\"]+\\)\"$"
      (lambda (arg)
        (cl-assert (member arg kill-ring))))
