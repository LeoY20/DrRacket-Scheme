(define (cont-frac n d k)
  ;n = procedure of 1st arg returning n(i) term of the continued fraction
  ;d = procedure of 2nd arg returning d(i) term of the continued fraction
  ;k = term limit on finite fraction.
  (define (frac-iter n d k i) ; i is the counter
    (cond ((= i k) 1) ; exit clause, divide by 1, not 0 so that it still works
          ((= i 1) (/ (n i) (frac-iter n d k (+ i 1)))) ;start of the recursion
          (else (+ (d (- i 1)) (/ (n i) (frac-iter n d k (+ i 1)))))))
  (frac-iter n d k 1))

;(cont-frac (lambda (i) 1.0)
           ;(lambda (i) 1.0)
           ;13)
; K must be 13 in order for an approximation of 4 decimal places to be obtained (given that rounding to the 4th is also accounted for, if truncated, then 12)

; 1 2 1 1 4 1 1 6 1 ; every 3 with the exception of the first one, which is 2. N is 1 every time
; x 2 x x 5 x x 8 x

(define (e-expansion k) ;k is term limit
  (define (d i)
    (cond ((= i 2) 2)
          ((= 0 (remainder (+ 1 i) 3)) (* (/ (+ 1 i) 3) 2)) ; a very funny way of ensuring that every 3 is 2 4 or 6, where we test rem 0, and then take the divisor by 3 and multiply it by 2
          (else 1.0)))
  (+ 2 (cont-frac (lambda (x) 1.0) d k))) ; because using cont-frac does e-expansion for e-2, so just add 2

(e-expansion 30)