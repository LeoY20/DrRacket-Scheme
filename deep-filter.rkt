(define (deep-filter pred lyst)
  (cond ((null? lyst) '())
        ((list? (car lyst)) (cons (deep-filter pred (car lyst)) (deep-filter pred (cdr lyst))))
        ((pred (car lyst)) lyst)
        (else (deep-filter pred (cdr lyst)))))

(deep-filter even? '(0 1 2 () 3 4 5 (6 7 8) 9))



               
         