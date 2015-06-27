(in-package :cl-user)
(defpackage get-element-by
  (:use :cl)
  (:export :get-element-by))
(in-package :get-element-by)

(defun get-elements-by (tag-name-or-attribute value body)
  "
  DESCRIPTION:
    JavaScript like selector for cl-html-parser
  USAGE:
    (defvar tree (net.html.parser:parse-html string-of-html))
    (get-elements-by :tag-name :h1 tree)
    (get-elements-by :id \"id0\" tree)
    (get-elements-by :class \"class1\" tree)
    (setf (getf (nth 2 (get-elements-by :class \"class1\" tree)) :class) \"class2\")
  RETURN-TYPE:
    LIST
  "
  (let (elements target test)
    (if (eq tag-name-or-attribute :tag-name)
	(setf target value
	      test (lambda (x) (eq (car x) value)))
	(setf target tag-name-or-attribute
	      test (lambda (x) (string= (getf (cdr x) target) value))))
    (labels ((get-elements-by-rec (body)
	       (unless (or (not body) (atom body))
		 (when (member target body) (push body elements))
		 (mapcar #'get-elements-by-rec body))))
      (get-elements-by-rec body))
    (nreverse (delete-if-not test elements))))

(defun get-element-by (tag-name-or-attribute value body)
  "Alias for `(car (get-elements-by ...))'"
  (car (get-elements-by tag-name-or-attribute value body)))

