; The below abstraction for binary trees is implemented with
; a function in order to force you to use selectors to inspect
; tree data in the interpreter.
(define (make-bintree datum left right)
  (lambda (msg)
    (cond ((= msg 0) datum)
          ((= msg 1) left)
          ((= msg 2) right))))

(define (datum bintree) (bintree 0))
(define (left bintree) (bintree 1))
(define (right bintree) (bintree 2))

(define the-empty-tree 'cow)
(define tet the-empty-tree)
(define (empty-tree? tree) 
  (eq? tree tet))
(define (leaf? bintree)
  (and (not (empty-tree? bintree))
       (empty-tree? (left bintree))
       (empty-tree? (right bintree))))


(define bst
  (make-bintree 15
     (make-bintree 6
        (make-bintree 2 tet tet)
        tet)
     (make-bintree 22
        (make-bintree 17
           (make-bintree 16 tet tet)
           (make-bintree 19 tet tet))
        (make-bintree 24 tet tet))))

; bst --->                              15
;                                      /  \
;                                     /    \
;                                    6     22
;                                   /     /  \
;                                  /     /    \
;                                 2     17    24
;                                      /  \
;                                     /    \
;                                    16    19

;1. Write the function first-n that takes two inputs, a list, lyst, and a number, n. It returns a list containing the first n elements of lyst.

;Examples:

;> (first-n '(A B C D E) 3)
;(A B C)

(define (first-n lyst n) ;n is the first n
  (define (helper lyst result n x) ; x is counter
    (cond ((= x n) result)
          (else (helper lyst (append (list (list-ref lyst x)) result) n (+ x 1)))))
  (reverse (helper lyst '() n 0)))

(first-n '(A B C D E) 3)
