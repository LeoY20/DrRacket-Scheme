;Exercise 2.31: Abstract your answer to Exercise 2.30 to
;produce a procedure tree-map with the property that squaretree could be defined as
;(define (square-tree tree) (tree-map square tree))

(define (tree-map procedure tree)
  (cond ((null? tree) '()) ;exit clause for car-cdr, on cdr side
        ((not (list? tree)) (procedure tree)) ;will square every instance of not list
        (else (cons (tree-map procedure (car tree)) (tree-map procedure (cdr tree))))))

(define (square x) (* x x))

(define (square-tree tree) (tree-map square tree))

(square-tree
(list 1
(list 2 (list 3 4) 5)
(list 6 7)))
'(1 (4 (9 16) 25) (36 49))