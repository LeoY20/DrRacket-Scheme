(define (fast-exponent b n)
  (define (iter a b n) ; iterative so that user doesn't need to put in 1 for a lol
    (cond ((= n 0) a)
          ((even? n) (iter a (* b b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))

(fast-exponent 2 3)

