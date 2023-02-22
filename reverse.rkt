;Write the function reverse that takes a list as its input and returns a list with the order of those elements reversed. Note that any sublists are not reversed.
; use map, seems like this is the best idea
; use cons, because it always adds stuff to the left
; just take car and use cons
; likely ur gonna want to start keeping the list in context
; do recursion first, then the next one
; model should be recursion first, because you're adding from left

(define (reverse1 lst)
  (cond ((null? lst) '()) ; for the one case where this is true
        ((null? (cdr lst)) (list (car lst))) ; final exit clause, needs to be list (car lst) because of append
        ; append literally takes the stuff out of the list. by listing this, you not only cover integers
        ; but you also cover for the sublist case when it is the last element
        ; basically, by doing list, you kind of put a protection thing around, so that only the surrounding brackets are removed when append used
        (else (append (reverse1 (cdr lst)) (list (car lst)))))) ; you gotta put list here to make append work, cuz 2 lists. has added benefit here of also protecting against append from removing further integers

(reverse1 '((1 2) 3))
(reverse1 '())
