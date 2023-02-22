(define (make-segment p1 p2) ;constructor
  (cons p1 p2))

(define (start-segment l-seg) ;selector
  (car l-seg))

(define (end-segment l-seg) ;selector
  (cdr l-seg)) ;works because cons creates pair

(define (make-point x y) ;constructor for points
  (cons x y))

(define (x-point p) ;selector for x-val
  (car p))

(define (y-point p) ;selector for y-val
  (cdr p))

(define (midpoint-segment lineseg)
  (make-point (/ (+ (x-point (start-segment lineseg)) (x-point (end-segment lineseg))) 2) (/ (+ (y-point (start-segment lineseg)) (y-point (end-segment lineseg))) 2)))

(define p1a (make-point 1 2))
(define p2a (make-point 5 3))
(define abstractionPain (make-segment p1a p2a))
(define mptAbsPain (midpoint-segment abstractionPain))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point mptAbsPain)