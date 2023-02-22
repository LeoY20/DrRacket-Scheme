(define (accumulate op id fn a next b pred)
  (cond  ((> a b) id)
         ((pred a) (op (fn a) (accumulate op id fn (next a) next b pred))) ;take value, aggregate, call again to create deferred operation
         (else (accumulate op id fn (next a) next b pred)))) ; does not meet condition, skip

;a

(define (prime? n)
  (cond ((
