#|
  This file is a part of get-element-by project.
  Copyright (c) 2015 asciian (asciian@outlook.jp)
|#

#|
  Author: asciian (asciian@outlook.jp)
|#

(in-package :cl-user)
(defpackage get-element-by-asd
  (:use :cl :asdf))
(in-package :get-element-by-asd)

(defsystem get-element-by
  :version "0.1"
  :author "asciian"
  :license "BSD 2-Clause"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "get-element-by"))))
  :description "selector for cl-html-parse"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op get-element-by-test))))
