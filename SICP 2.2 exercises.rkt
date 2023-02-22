;sicp 2.17
;Exercise 2.17: Define a procedure last-pair that returns
;the list that contains only the last element of a given (nonempty)
;(last-pair (list 23 72 149 34))
;(34)

(define (last-pair lyst)
  (list (list-ref lyst (- (length lyst) 1))))

;(last-pair (list 23 72 149 34))


;sicp 2.18
;Exercise 2.18: Define a procedure reverse that takes a list
;as argument and returns a list of the same elements in reverse order:
;(reverse (list 1 4 9 16 25))
;(25 16 9 4 1)

(define (reverse1 lyst)
  (define (list-iter lyst1 result counter)
    (cond ((= counter -1) result) ;you just want to exit with the result lol
          (else (list-iter lyst1 (append result (list (list-ref lyst1 counter))) (- counter 1)))))
  (list-iter lyst '() (- (length lyst) 1)))

;(reverse1 (list 1 4 9 16 25))

;sicp 2.20
;Use this (dotted tail) notation to write a procedure same-parity that
;takes one or more integers and returns a list of all the arguments that have the same even-odd parity as the first
;argument. For example,
;(same-parity 1 2 3 4 5 6 7)
;(1 3 5 7)
;(same-parity 2 3 4 5 6 7)
;(2 4 6)

(define (same-parity x . y) ;car/cdr recursion because I feel like it
  (define (selector input pred)
    (cond ((null? input) '()) ;exit clause
          ((pred (car input)) (cons (car input) (selector (cdr input) pred))) ;pred car input so that it checks for the first one
          (else (selector (cdr input) pred))))
  (if (even? x)
      (cons x (selector y even?))
      (cons x (selector y odd?))))

;(same-parity 1 2 3 4 5 6 7)
;(same-parity 2 3 4 5 6 7)

;sicp 2.21
;Exercise 2.21: the procedure square-list takes a list of
;numbers as argument and returns a list of the squares of
;those numbers
;(square-list (list 1 2 3 4))
;(1 4 9 16)
(define (square-list items) ;car-cdr recursion
  (define (square x) (* x x))
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))



(define (square-list1 items)
  (define (square x) (* x x))
  (map square items))

;(square-list (list 1 2 3 4))
;(square-list1 (list 1 2 3 4))

;sicp 2.22
;Louis Reasoner tries to rewrite the first squarelist procedure of Exercise 2.21 so that it evolves an iterative process:
(define (square x) (* x x))
(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

;reverse order results because you add to the left with cons (pairs), and because it goes from left to right in the list, it will take the first, put it onto the left, and subsequent elements will be inserted to the left of the first element.
(define (square-list3 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))
; this just makes a dotted pair every time because you're inserting the answer, a list, to a non-list, which creates a pair represented by a dot. At least it's in the right order?

;(square-list3 (list 1 2 3 4))

;Exercise 2.23: the procedure for-each is similar to map. It
;takes as arguments a procedure and a list of elements. However, rather than forming a list of the results, for-each just
;applies the procedure to each of the elements in turn, from
;left to right. the values returned by applying the procedure
;to the elements are not used at all—for-each is used with
;procedures that perform an action, such as printing. For example,
;(for-each (lambda (x)
 ;           (newline)
  ;          (display x))
   ;       (list 57 321 88))
;57
;321
;88

(define (for-each1 function lyst) ; do some recursive procedure to guarantee that the thing does not process
  (function (car lyst)) ;scheme ig just decides that it will go thru everything in parentheses in define
  (cond ((= (length lyst) 2) (function (cadr lyst)))
        (else (for-each1 function (cdr lyst))))) ;why does putting 2 processes in a define work?
(for-each1 (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))

;Exercise 2.24
;Exercise 2.24: Suppose we evaluate the expression
;(list 1 (list 2 (list 3 4))). Give the result printed by the
;interpreter, the corresponding box-and-pointer structure,
;and the interpretation of this as a tree (as in Figure 2.6).

;(1 (2 (3 4)))
; diagrams are on my phone

;Exercise 2.25: Give combinations of cars and cdrs that
;will pick 7 from each of the following lists:

(car(cdr(car(cdr(cdr '(1 3 (5 7) 9)))))) ; cadaddr
(caar '((7))) ;caar
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr '(1 (2 (3 (4 (5 (6 7))))))))))))))))))
;cdr ((2 (3 (4 (5 (6 7))))))
;car
;*5 more times
;so, just cadadadadadadad

;Exercise 2.26: Suppose we define x and y to be two lists:
(define x (list 1 2 3))
(define y (list 4 5 6))

;(append x y) -> '(1 2 3 4 5 6)
;(cons x y) '((1 2 3) 4 5 6))
;(list x y) '((1 2 3) (4 5 6))

(append x y)
(cons x y)
(list x y)

;Exercise 2.27: Modify your reverse procedure of Exercise
;2.18 to produce a deep-reverse procedure that takes a list
;as argument and returns as its value the list with its elements reversed and with all sublists deep-reversed as well.
;For example,

(define (deep-reverse lyst)
  (define (list-iter lyst1 result counter)
    (cond ((= counter -1) result) ;you just want to exit with the result lol
          ((list? (list-ref lyst1 counter)) (list-iter lyst1 (append result (list (deep-reverse (list-ref lyst1 counter)))) (- counter 1)))
          (else (list-iter lyst1 (append result (list (list-ref lyst1 counter))) (- counter 1)))))
  (list-iter lyst '() (- (length lyst) 1)))

(define x (list (list 1 2) (list 3 4)))

(deep-reverse x)

(define make-mobile cons)
(define left-branch car)
(define right-branch cdr)

(define weight? number?)
(define mobile? pair?)

(define (make-branch length structure)
  (lambda (msg)
    (cond ((= msg 0) length)
          ((= msg 1) structure))))

(define (lngth branch)
  (branch 0))

(define (struct branch)
  (branch 1))

(define (torque branch)
  (* (lngth branch) (branch-weight branch)))

(define (branch-weight branch)
  (total-weight (struct branch)))

(define (total-weight structure)
  (cond ((weight? structure) structure)
        (else (+ (branch-weight (left-branch structure)) ;must use branch-weight here because it uniquely utilizes the message passing such that you can actually use the function. if you don't use branch weight then you get problems because it passes
                 (branch-weight (right-branch structure))))))

(define m ; sample mobile
  (make-mobile
   (make-branch 6
                (make-mobile
                 (make-branch 1 8)
                 (make-branch 4 2)))
   (make-branch 5 12)))

(total-weight m)

(define (balanced? structure)
  (or (weight? structure)
      (and (= (torque (left-branch structure))
              (torque (right-branch structure)))
           (balanced? (struct (left-branch structure))) ; you MUST use struct here, MUST MUST MUST because otherwise selector will take in length which is kinda bad
           (balanced? (struct (right-branch structure))))))

(balanced? m)
              
