(define (make-point x y) ; for each point
  (cons x y))

(define (x-val point)
  (car point))

(define (y-val point)
  (cdr point))

(define (perimeter p1 p2 p3 p4)
  (+ (* 2 (abs (- (x-val p2) (x-val p1)))) (* 2 (abs (- (y-val p2) (y-val p3))))))

(define (area p1 p2 p3 p4)
  (* (abs (- (x-val p2) (x-val p1))) (abs (- (y-val p2) (y-val p3)))))

(define pe1 (make-point 0 5))
(define pe2 (make-point 10 5))
(define pe3 (make-point 10 0))
(define pe4 (make-point 0 0))

(area pe1 pe2 pe3 pe4)
(perimeter pe1 pe2 pe3 pe4)


; you can do rect in just 2 points because you just need the diagonal points

(define (make-rect1 point width height)
  (cond point (cons width height)))

(define (rect-width r)
  (cadr r))

(define (rect-height r)
  (cddr r))

(define (rect-point r)
  (car r))]

;can still use area and perimeter public methods without worry since abstraction barrier created

