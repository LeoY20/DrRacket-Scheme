(define (accumulate op id fn a next b)
  (cond ((> a b) id)
        (else (op (fn a) (accumulate op id fn (next a) next b)))))

(accumulate + 0 (lambda (x) (if (odd? x) (+ (/ 1 x)) (- (/ 1 x)))) 1 (lambda (x) (+ x 1)) 5)

(accumulate + 0 (lambda (x) (expt (if (odd? x) x (- x)) (- 1))) 1 (lambda (x) (+ x 1)) 5)