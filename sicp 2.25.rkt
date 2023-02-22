;Exercise 2.25: Give combinations of cars and cdrs that
;will pick 7 from each of the following lists:

(car(cdr(car(cdr(cdr '(1 3 (5 7) 9)))))) ; cadaddr
(caar '((7))) ;caar
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr '(1 (2 (3 (4 (5 (6 7))))))))))))))))))
;cdr ((2 (3 (4 (5 (6 7))))))
;car
;*5 more times
;so, just cadadadadadadad
