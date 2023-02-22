;17.14  Write a procedure branch that takes as arguments a list of numbers and a nested list structure. It should be the list-of-lists equivalent of item, like this:
;> (branch '(3) '((a b) (c d) (e f) (g h)))
;(E F)

;> (branch '(3 2) '((a b) (c d) (e f) (g h)))
;F

;> (branch '(2 3 1 2) '((a b) ((c d) (e f) ((g h) (i j)) k) (l m)))
;H

(define (branch seek lst)
  (cond ((null? seek) lst)
        (else (branch (cdr seek) (list-ref lst (- (car seek) 1)))))) ; -1 because list-ref starts from 0

(branch '(3) '((a b) (c d) (e f) (g h)))
(branch '(3 2) '((a b) (c d) (e f) (g h)))
(branch '(2 3 1 2) '((a b) ((c d) (e f) ((g h) (i j)) k) (l m)))