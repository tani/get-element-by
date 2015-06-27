# Get-Element-By
getElementById like selector for cl-html-parse.
## Usage
```
    (defvar tree (net.html.parser:parse-html string-of-html))
    (get-elements-by :tag-name :h1 tree)
    (get-elements-by :id \"id0\" tree)
    (get-elements-by :class \"class1\" tree)
    (setf (getf (nth 2 (get-elements-by :class \"class1\" tree)) :class) \"class2\")
```
## Installation
1. `$ git clone git://github.com/ta2gch/get-element-by`
2. `$ cd get-element-by`
3. `$ ln -s $PWD/get-element-by.asd ~/common-lisp/`

## Author

* Masaya TANIGUCHI (ta2gch@gmail.com)

## LICENCE
BSD 2-Clause
## Copyright

Copyright (c) 2015 Masaya TANIGUCHI (ta2gch@gmail.com)
