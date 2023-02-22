;List-tree
;Write the function list->tree that takes a list of increasing numbers as its input and returns a weight-balanced binary search tree containing those numbers.
;(define binary-tree (list->tree '(1 2 3 4 5 6 7 8)))
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



;A weight-balanced tree is a binary tree in which for each node the number
;of nodes in the left subtree is at least half and at most twice the number of nodes in the right subtree.

(define (list->tree input)
  (define (sublist-cons-L mid input)
    (define (counter n mid)
      (cond ((= n mid) '()) ;exit clause
            (else (append (list (list-ref input n)) (counter (+ n 1) mid)))))
    (counter 0 mid))
  (define (sublist-cons-U mid input)
    (define (counter1 n mid)
      (cond ((= n (length input)) '()) ;exit clause
            (else (append (list (list-ref input n)) (counter1 (+ n 1) mid)))))
    (counter1 mid mid))
  (define (mid-detector input) ;finds middle of a list
    (cond ((odd? (length input)) (ceiling (/ (length input) 2)))
          (else (+ (/ (length input) 2) 1))))
  (cond ((= (length input) 1) (make-bintree (car input) tet tet))
        ((= (length input) 2) (make-bintree (mid-detector input) (list->tree (list (car input))) tet))
        (else (make-bintree (mid-detector input)
                            (list->tree (sublist-cons-L (mid-detector input) input))
                            (list->tree (sublist-cons-U (mid-detector input) input))))))
                            
                            
(define binary-tree (list->tree '(1 2 3 4 5 6 7 8)))

binary-tree
                 
(define (helper bintree1)
    (cond ((empty-tree? bintree1) '()) ;empty list
          (else (append (list (datum bintree1))
                        (helper (left bintree1))
                        (helper (right bintree1))))))

(helper binary-tree) ;fix this tmrw, it's clearly not working
                                    
        