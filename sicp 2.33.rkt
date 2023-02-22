;Exercise 2.33: Fill in the missing expressions to complete
;the following definitions of some basic list-manipulation
;operations as accumulations:

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (map1 p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence)) ;oh it's the funny accumulate

(map1 (lambda (x) (* 2 x)) '(1 2 3))

(define (append1 seq1 seq2)
 (accumulate cons seq2 seq1)) ;seq2 then seq1 because

(append1 '(1 2 3) '(4 5 6))
;(define (length sequence)
; (accumulate ⟨??⟩ 0 sequence))

(cons 1 (cons 2 (cons 3 '(4 5 6))))
;4 5 6 functions as the initial sequence
;does what is above

(define (length1 sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence)) ;no matter what you put in for x, will output +1, null is exit clause, y is recursive (iterative) call to accumulate

(length1 '(1 2 3 4 5))