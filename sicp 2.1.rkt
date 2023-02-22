;2.1

(define (numer rat)
  (car rat))

(define (denom rat)
  (cdr rat))

(define (make-rat n d)
  (cons n d))

(define (better-rat rational)
  (if (and (or (< 0 (numer rational)) (< 0 (denom rational))) (not (and (< 0 (numer rational)) (< 0 (denom rational)))))
      (make-rat (* -1 (abs (numer rational))) (abs (denom rational)))
      (make-rat (abs (numer rational)) (abs (denom rational)))))

(define a (make-rat -2 3))
(define b (make-rat 2 -3))
(define c (make-rat -2 -3))

(better-rat a)
(better-rat b)
(better-rat c)
