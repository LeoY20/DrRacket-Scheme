; The below abstraction for binary trees is implemented with
; a function in order to force you to use selectors to inspect
; tree data in the interpreter.
(define (make-bintree datum left right)
  (lambda (msg)
    (cond ((= msg 0) datum)
          ((= msg 1) left)
          ((= msg 2) right)))) ;outputs a lambda, will need double parentheses

(define (datum bintree) (bintree 0))
(define (left bintree) (bintree 1))
(define (right bintree) (bintree 2))

(define tet 'toasterhead)  ; tet = the empty tree
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

;1. Write the function contains? which takes a binary search tree of numbers and a datum as its input and returns #t if the datum is in the tree, #f otherwise.

;> (contains? bst 17)
;#t
;> (contains? bst 18)
;#f

(define (contains? bst num)
  (cond ((empty-tree? bst) #f) ;check0: empty tree so it doesn't crash
        ((= num (datum bst)) #t) ;check 1: datum equvalent. Check 2: left present? check 3: right present?
        ((contains? (left bst) num) #t) ;recursive call to check
        ((contains? (right bst) num) #t)
        (else #f)))
        

;(contains? bst 18)


;2. Write the function inorder which takes a binary search tree as its input and returns a list of the data in ascending order.

;> (inorder bst)
;(2 6 15 16 17 19 22 24)

;NOTE: WILL DO LATER, DO NOT KNOW HOW TO DO RN



;3. 3. Write the function count-nodes which takes a binary tree (does not have to be a binary search tree) as its input and returns the number of nodes in the tree.

;> (count-nodes bst)
;8

(define (count-nodes bintree)
  (cond ((empty-tree? bintree) 0)
        ((integer? (datum bintree)) (+ 1 (count-nodes (left bintree)) (count-nodes (right bintree))))
        (else 'cope)))

(count-nodes bst)

;4. Write the function square-tree which takes a binary tree that contains numbers as its input and returns a binary tree with the same structure and the numbers squared.

;> (datum (square-tree bst))
;225
;> (datum (left (square-tree bst)))
;36
;> (datum (left (left (right (square-tree bst)))))
;256

(define (square-tree bintree)
  (define (square x) (* x x))
  (cond ((empty-tree? bintree) tet) ;to ensure that the edges are still tets
          (else (make-bintree (square (datum bintree)) (square-tree (left bintree)) (square-tree (right bintree))))))

(square-tree bst)
(datum (square-tree bst))
(datum (left (square-tree bst)))
(datum (left (left (right (square-tree bst)))))


;5. Write the function map-tree which takes a function and a binary search tree as its inputs and returns a binary search tree with the same structure and the data in the tree modified by the function.

;> (datum (map-tree square bst))
;225
;> (datum (left (map-tree (lambda (x) (+ x 1))  bst)))
;7
                                   
(define (map-tree fn bintree)
  (cond ((empty-tree? bintree) tet) ;to ensure that the edges are still tets
          (else (make-bintree (fn (datum bintree)) (map-tree fn (left bintree)) (map-tree fn (right bintree))))))

(define (square x) (* x x))
(datum (map-tree square bst))
(datum (left (map-tree (lambda (x) (+ x 1))  bst)))

;6.
(define cope-harder (make-bintree 31
                                  (make-bintree 18 tet
                                                (make-bintree 25 tet tet))
                                  (make-bintree 44 tet tet)))

;7. Yes, it is possible that the tree in 6 is a BST because all of the datums of the left nodes are lower than the datum above, and all of the right nodes are greater than the datums of the node above


        