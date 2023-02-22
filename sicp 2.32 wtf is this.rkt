;sicp 2.32

;can represent set as list of distinct elements
;can represent set of all subsets as list of lists
;e,g, if set = (1 2 3), set of all subsets is (|()| (3) (2) |(2 3)| (1) (1 3) (1 2) |(1 2 3)|)

(define (subsets s)
  (if (null? s) ;tests for if the set is null
      (list '()) ;if it is empty, then it will output a null list. this is the last check
      (let ((rest (subsets (cdr s)))) ;rest is basically 3 variables, as it calls itself recursively. s becomes diff each time, down then up
        (append rest (map (lambda (x) (cons (car s) x)) rest))))) ;clearly must start with original

(subsets '(1 2 3))

'(1 2 3)

;explanation
;rest recursively calls subsets until subsets is null, at that point rest is defined as a list of a null list
;but in the process of doing this, frames of subset are created, which need to be completed
;at the end of the recursion, s = (3), because it was the last sublist call before rest was defined as a list of an empty list
;append is called with (()) and (3) (obtained from mapping cons of the car of S (3) onto (()), which should output (3) as ur constructing 3 and an empty list as a pair
;then, append outputs (() (3))
;this is defined as rest of the previous call for sublist, as it's the result of the call.
;thus, s is now (2 3), and rest is (() (3))
;append is called with (() (3)) and mapping
; map (cons 2 ()), (cons 2 (3)) -> (2), (2 3)
;appending with 3 elements -> outputs  (() (3) (2) (2 3)
;don't need to do anything with 3 (no cdr needed) because it's already been done
;rest output from before is now (() (3) (2) (2 3)), as it's the output from the previous
;calls append with rest when s is now (1 2 3), 
;map with rest, cons 1 onto each x
;map outputs to (1) (1 3) (1 2) (1 2 3)
;append those 4 onto previous rest back side, outputs  (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)
;it's basically abusing the fact that you can create the version of other subsets by just tacking stuff on.
