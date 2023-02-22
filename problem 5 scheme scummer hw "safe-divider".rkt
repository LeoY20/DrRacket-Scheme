;(define divide-by-12 (safe-divider 12))
;(divide-by-12 4)    // returns 3
;write safe-divider, which takes in number which will be used as numerator

(define (safe-divider numerator)
  (lambda (denom) (if (equal? denom 0) 'cow (/ numerator denom))))

(define divide-by-20 (safe-divider 20)) ; names the lambda lol

(divide-by-20 -4)