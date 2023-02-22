(define (flatten lyst)
  (define (lyst-check input)
    (cond ((list? input) input)
          (else (list input))))
  (define (verify-true lyst)
    (cond ((null? lyst) #t) ;if list null then all #f, this is good
          ((equal? #t (car lyst)) #f) ;returns #f if even one element of the list is a sublist
          (else (verify-true (cdr lyst)))))
  (define (append-iter lyst result) ;counter will be set to match length of lyst, just append car and cdr, then use member on it to get the rest ig?
    (cond ((= (length lyst) 0) (if (verify-true (map list? result)) result (append-iter result '()))) ;checks list to see if it is all true, if not
          (else (append-iter (cdr lyst) (append result (lyst-check (car lyst))))))) ;literally just appending the car of a reducing list to the result
  (append-iter lyst '()))

(flatten '(((a b) c (d e)) (f g) ((((h))) (i j) k))) ; should be (a b c d e f g h i j k)

