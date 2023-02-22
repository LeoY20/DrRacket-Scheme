;Define a procedure square-tree analogous
;to the square-list procedure of Exercise 2.21.at is, squaretree should behave as follows:
;Define square-tree both directly (i.e., without using any
;higher-order procedures) and also by using map and recursion.

(define (square-list items) ;car-cdr recursion
  (define (square x) (* x x))
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))


(define (square-tree items)
  (define (square x) (* x x))
  (cond ((null? items) '()) ;exit clause for car-cdr, on cdr side
        ((not (list? items)) (square items)) ;will square every instance of not list
        (else (cons (square-tree (car items)) (square-tree (cdr items))))))

(square-tree
(list 1
(list 2 (list 3 4) 5)
(list 6 7)))
'(1 (4 (9 16) 25) (36 49))

(define (square-tree1 items)
  (define (square x) (* x x))
  (cond ((list? items) (map square-tree1 items))
        (else (square items))))
        

(square-tree1
(list 1
(list 2 (list 3 4) 5)
(list 6 7)))
'(1 (4 (9 16) 25) (36 49))
  
       