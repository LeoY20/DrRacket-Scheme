(define (filter pred lst)
  (cond ((null? lst) '()) ; basically, this serves as the last one. the way cons works, it adds left stuff to right list
        ((pred (car lst)) (cons (car lst) (filter pred (cdr lst)))) ; this will only add numbers, not lists, to the full list, thus preventing repeat of parentheses
        (else (filter pred (cdr lst))))) ; there is no need to add on stuff that is even or do tree, so you just simply chop off the even, and restart

(filter odd? '(5 12 31 7 98 13))

; in short: cons uses the empty list as the surrounding brackets once cdr removes everything.
; every time cons adds to the list, it is integers specifically, not integers within lists, cuz car cuts that off
; we want to reference car here, to prevent the error of recursively feeding car, a single integer, in places where lists should go
; using else with direct recursion here allows for immediate cutoff. you do not need to add on anything if it is even, so just lop them off, and go until you find even.
; It's kind of like a rabbit hole, it will go until it finds something that fulfills.
; in the end, it should look like (cons 5 (cons 5 '()). It will solve the inner-most one, and since you are exclusively adding valid integers
; it will end up never adding more parentheses.