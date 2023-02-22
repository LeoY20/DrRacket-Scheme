;2.7
; She also presumes that, given the endpoints of an interval, she can construct the interval using the data constructor make-interval.

(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

;2.8
;She reasons that the
;minimum value the sum could be is the sum of the two lower bounds
;and the maximum value it could be is the sum of the two upper bounds:

(define (add-interval x y) ; where x and y represent intervals specifically. Using her logic, it's literally a carbon copy
  (make-interval (+ (lower-bound y) (lower-bound x))
                 (+ (upper-bound y) (upper-bound x))))

(define (sub-interval x y) ; where x and y represent intervals specifically. Using her logic, it's literally a carbon copy
  (make-interval (- (lower-bound y) (lower-bound x))
                 (- (upper-bound y) (upper-bound x))))

;2.9
;width of interval = half of difference between upper/lower bounds
;measure of uncertainty by # specified by interval
;for some arith operations with combination: width = function of only widths of argument intervals themselves
;others: width of combination is not a function of the widths of arg intervals
;show width of sum of 2 intervals is function only to the widths of the intervals being added/subtracted, disprove this case in multiplication or division

(define intv1 (make-interval 3 8))
(define intv2 (make-interval 4 10))
(define subt (sub-interval intv1 intv2))
(define addinv (add-interval intv1 intv2))

(define (width interval)
  (* 1.0 (/ (- (upper-bound interval) (lower-bound interval)) 2)))

(width subt) ; 0.5
(width addinv) ; 5.5

;width = upper + lower / 2
;the width of an added interval -> (upper1 + upper2) + (lower1 + lower2) / 2
; is the same as (upper1 + lower1) / 2 + (upper2 + lower2) / 2, which is just adding the widths of the intervals because same denominator
; same thing with subtraction, just that the signs are different

;multiplication doesn't work because upper bounds are multiplied with lower bounds, which screws over the calculation of width such that it's no longer the sum of the widths as the min can be something like (upper1 * lower2) in some situations
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

(width (mul-interval intv1 intv2)) ;this is 34.0
(+ (width intv1) (width intv2)) 5.5

;same thing with division - it crosses calculation of the upper and lower bounds, and is not purely addition, which width accounts for. Thus, it's not equal
(width (div-interval intv1 intv2)) ; this is 0.85, which isn't 5.5
