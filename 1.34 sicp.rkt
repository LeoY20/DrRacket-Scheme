(define (f g) (g 2))

(define (square x)
  (* x x))
(f square)
4
(f (lambda (z) (* z (+ z 1))))
6

; what happens if we ask interpreter to evaluate combo (f f)?

; it wouldn't work. F (the procedure) is substituted for g. Consequently, when it gets to (f 2), it tries to evaluate (2 2) which doesn't work, as 2 isn't a defined procedure.
