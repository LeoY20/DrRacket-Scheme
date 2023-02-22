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
                 
      
                                    
        ;inorder
;takes in bst as input, returns data in ascending order
;bst abstraction
(define (make-bintree datum left right)
  (lambda (msg)
    (cond ((= msg 0) datum)
          ((= msg 1) left)
          ((= msg 2) right))))

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



(define compVal 0)
(define (sort lyst output) ;STUPID BUBBLE SORT WHY DID I DO THIS
  (cond ((and (null? output) (< (car lyst) (cadr lyst))) (set! compVal (cadr lyst)) ;first value of output anyway
                                                         (sort (cdr lyst) (append (list (cadr lyst) (car lyst)) output))) ;first one, put first 2 in sorted
        ((and (null? output) (> (car lyst) (cadr lyst))) (set! compVal (car lyst)) ;first value of output anyway
                                                         (sort (cdr lyst) (append (list (car lyst) (cadr lyst)) output)))
        ((= (length lyst) 1) output) ;final exit clause cuz I am evaluating based on cadr here
        ((= (length lyst) 2) (sort (cdr lyst) (append (list (cadr lyst)) output))) ;need to use cadr because my program is dumb and stupid and this is the only way it doesn't die
        ((or (< compVal (cadr lyst)) (= compVal (cadr lyst))) (set! compVal (cadr lyst))
                                                              (sort (cdr lyst) (append (list (cadr lyst)) output)))
        (else (set! compVal (car output))
              (set-car! output (cadr lyst)) ;changing to correct sorted value in case where it's not already sorted
              (sort (cdr lyst) (append (list compVal) output))))) ;adding other value

(define (repeater counter output1)
  (cond ((= counter (length output1)) (reverse output1))
        ((= counter 0) (repeater (+ counter 1) (sort output1 '())))
        (else (repeater (+ counter 1) (sort (reverse output1) '())))))

;(repeater 0 '(1 3 2 4 5 8 9))

;(reverse (sort '(1 3 2 4 5 3 8 9) '()))

(define (inorder bintree)
  (define (helper bintree1)
    (cond ((empty-tree? bintree1) '()) ;empty list
          (else (append (list (datum bintree1))
                        (helper (left bintree1))
                        (helper (right bintree1))))))
  (repeater 0 (helper bintree)))

(inorder binary-tree) ;debug this tmrw
