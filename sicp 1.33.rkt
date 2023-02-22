(define (filtered-accumulate pred op id fn a next b)
  (cond ((> a b) id)
        ((pred a) (op (fn a) (filtered-accumulate pred op id fn (next a) next b))) ; deferred operations taking this into acc, then calls again with next a
        (else (filtered-accumulate pred op id fn (next a) next b))))

(define (prime? n)
  (define (iter x counter)
    (cond ((<= n 0) #f)
          ((= n 1) #f)
          ((and (= x 1)(= counter 2)) #t)
          ((and (= x 1)(> counter 2)) #f)
          ((= (remainder n x) 0)(iter (- x 1)(+ counter 1)))
          (else (iter (- x 1) counter))))
  (iter n 1))

(filtered-accumulate prime? + 0 (lambda (x) (* x x)) 1 (lambda (x) (+ x 1)) 5)

;5, 3, 2 -> 25, 9, 4

;product of all positive integers less than n that are relatively prime to n, aka the gcd between the numbers must be 1, is a test
(define (geecd a b)
  (if (= b 0) ; if b 0, then return a
      a
      (gcd b (remainder a b)))) ; else a becomes b, b becomes the remainder of a and b
;b is remainder until b is 0
;basically it reduces b every single time until it is 0, and at that point it outputs a, which is the prior value of b. must be 1 to be prime, as defined in the book.


(filtered-accumulate (lambda (x) (if (equal? (geecd x 5) 1) #t #f)) * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)

;1*2*3*4 -> 24, non inclusive of 5 because of the way the problem is written.
;note: for some reason to make identity, you have to do (lambda (x) x) or else it goes woke, it's probably because (x) in the second part calls procedure, but this isn't really a procedure
;pred must be lambda in order to output #t/#f for pred on filtered accumulate
