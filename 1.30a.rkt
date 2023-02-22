(define (product a b)
  (define (product-ifer f a b result)
    (if (> a b)
        result
        (product-ifer f (+ 1 a) b (* (f a) result))))
  (product-ifer (lambda (x) (if (odd? x) (/ (+ x 1) (+ x 2)) (/ (+ x 2) (+ x 1)))) a b 1))

(product 1 3)