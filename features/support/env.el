(require 'f)

(defvar yaml-tomato-support-path
  (f-dirname load-file-name))

(defvar yaml-tomato-features-path
  (f-parent yaml-tomato-support-path))

(defvar yaml-tomato-root-path
  (f-parent yaml-tomato-features-path))

(add-to-list 'load-path yaml-tomato-root-path)

(require 'yaml-tomato)
(require 'espuds)
(require 'ert)

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
