# Get-Element-By
JavaScript like selector for cl-html-parse.
## Usage
```common-lisp
(defvar tree (net.html.parser:parse-html string-of-html))

(get-element-by  :id "id0" tree)
(get-elements-by :tag-name :h1 tree)
(get-elements-by :class "class1" tree)

(setf (getf (cdr (get-element-by :id "foo")) :value) "bar")
(setf (getf (cdr (nth 2 (get-elements-by :class "class1" tree))) :class) "class2")
```
## Installation
```
$ cd ~/common-lisp
$ git clone git://github.com/ta2gch/get-element-by
```
## LICENCE
BSD 2-Clause
## Copyright

Copyright (c) 2015 Masaya TANIGUCHI (ta2gch@gmail.com)
