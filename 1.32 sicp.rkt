(define (accumulate1 op id fn a next b)
  (cond ((> a b) id)
        (else (accumulate1 op (op a id) fn (next a) next b))))

(accumulate1 * 1 (lambda (x) x) 3 (lambda (x) (+ x 1)) 5) ; sum
(accumulate1 + 0 (lambda (x) x) 3 (lambda (x) (+ x 1)) 5) ; product

