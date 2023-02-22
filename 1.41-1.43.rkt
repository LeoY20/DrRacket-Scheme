;1.41
;double - takes procedure of one arg as arg, returns procedure that applies original procedure twice
;double inc will add 2 if inc is +1
;SHOULD RETURN A PROCEDURE

(define (double procedure)
  (lambda (x) (procedure (procedure x))))

(define (inc x) (+ x 1))

((double inc) 3)

(((double (double double)) inc) 5)
; internal double returns double of double, then the outer double returns double of 2x double (4x double). It then takes in inc as a procedure, to result in 4x double to inc
; so 2^4 to inc, which is just + 16
; 5 + 16 = 21

; returns 21

;1.42
;let f, g be 2 one arg functs
;define compose taht implements composition of functions f(g(x))

(define (square x) (* x x))

(define (compose f1 f2) ; return funct
  (lambda (x) (f1 (f2 x))))

((compose square inc) 6)

;1.43
;if f is a num funct, n is pos int, can form nth repeated application of f. (basically just composition of functs but where n is the number of functs)
;if f is funct x -> x + 1, nth repeated applicaiton of f is funct x -> x + n
;if f is the operation of sq number, nth repeated applicaiton of f is funct raising arg to 2nth power
;write a procedure that computes f, positive int n, returns procedure that computes nth repeated application of f
;((repeated square 2) 5)

(define (repeated procedure num)
  (cond ((= num 1) procedure) ; num 1 because composition of functions is weird and basically does 2 every time, but you don't want to have an extra
        (else (compose procedure (repeated procedure (- num 1))))))

((repeated square 2) 5)

