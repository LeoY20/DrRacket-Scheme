(define (every-other x . y)
  (define (iter lyst counter result)
    (cond ((or (> counter (length lyst)) (= counter (length lyst))) result)
          (else (iter lyst (+ counter 2) (append result (list (list-ref lyst counter)))))))
  (iter y 1 (list x)))

;= is for when odd -> it shows that the counter has exceeded list-ref for odd, so you want to output the result at that point because you only want even elements in an odd list
;> is for even -> it will never truly hit counter equalling to the length of the list, as that is 1 past list-ref.  So, it will hit 2, so you can just do greater than.
;doing '(x) makes scheme think that ur just passing in the list x, which is just the character x

;(every-other 1 2 3 4 5 6)
(every-other 1 2 3 4 5 6 7)