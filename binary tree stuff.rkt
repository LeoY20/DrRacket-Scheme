;bst (binary search tree) abstraction
;will come back in java
;every number to right of node is greater, to left is less than
;left/right subtree must be binary search tree

(define (make-bintree datum left right) ;datum is the node on top of each branch
  (lambda (msg)
    (cond ((= msg 0) datum)
          ((= msg 1) left)
          ((= msg 2) right))))

; storing tree as a lambda

(define tet 'toasterhead) ; tet stands for empty tree. Empty tree can be anything we want, it doesn't matter

(define (datum bintree) (bintree 0))
(define (left bintree) (bintree 1))
(define (right bintree) (bintree 2))

;use recursion in really funky ways to pull stuff out
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

(define (addtree t)
  (cond ((empty-tree? t) 0)
        (else (+ (datum t)
                 (addtree (left t))
                 (addtree (right t)))))) ;recursive call to addtree. this works because you're basically just going either right or left until the filter goes to 0. then, it ends


