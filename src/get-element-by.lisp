(in-package :cl-user)
(defpackage get-element-by
  (:use :cl)
  (:nicknames :geby)
  (:export  :get-element-by :get-elements-by))
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
    (setf (getf (cdr (nth 2 (get-elements-by :class \"class1\" tree))) :class) \"class2\")
  RETURN-TYPE:
    LIST
  "
  (let (elements target test)
    (if (eq tag-name-or-attribute :tag-name)
	(setf target value
	      test (lambda (x)
		     (or (eq (car x) value)
			 (eq (caar x) value))))
	(setf target tag-name-or-attribute
	      test (lambda (x)
		     (or (string= (getf (cdr x) target) value)
			 (string= (getf (cdar x) target) value)))))
    (labels ((get-elements-by-rec (body)
	       (unless (or (not body) (atom body))
		 (cond 
		   ((and (listp (first body))
			 (member target (first body)))
		    (push body elements)
		    (mapcar #'get-elements-by-rec (rest body)))
		   ((member target body)
		    (push body elements)
		    (mapcar #'get-elements-by-rec body))
		   (t (mapcar #'get-elements-by-rec body))))))
      (get-elements-by-rec body))
    (nreverse (delete-if-not test elements))))

(defun get-element-by (tag-name-or-attribute value body)
  "Alias for `(car (get-elements-by ...))'"
  (car (get-elements-by tag-name-or-attribute value body)))

