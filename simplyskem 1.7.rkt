;17.1, 17.2, 17.3, 17.8 - 17.12, 17.14

;17.1
(car '(Rod Chris Colin Hugh Paul)) ;Rod
(cadr '(Rod Chris Colin Hugh Paul)) ;Chris (car of cdr)
(cdr '(Rod Chris Colin Hugh Paul)) ; '(Chris Colin Hugh Paul)
;(car 'Rod) ;error because not a list
(cons '(Rod Argent) '(Chris White)) ; '((Rod Argent) Chris White) because cons shoves to left of list
(append '(Rod Argent) '(Chris White)) ; '(Rod Argent Chris White) because append shoves 2 lists together
(list '(Rod Argent) '(Chris White)) ; '((Rod Argent) (Chris White)) because list just takes 2 args and makes a list with those args
(caadr '((Rod Argent) (Chris White) (Colin Blunstone) (Hugh Grundy) (Paul Atkinson))) ;Chris because takes cdr, which is the list minus rod argent part, car, which is (Chris White), and the car of that, which is Chris
(assoc 'Colin '((Rod Argent) (Chris White)
		  (Colin Blunstone) (Hugh Grundy) (Paul Atkinson))) ;will return the thing ASSOCIATED with it, which is (Colin Blunstone)
;association list searches first element of each entry with info we're looking for. names + corresponding values = association list. Assoc returns #f if you can't find name in list
;here, searches for colin, finds that (Colin Blunstone) is name + corresponding val, so outputs it.
(assoc 'Argent '((Rod Argent) (Chris White)
		   (Colin Blunstone) (Hugh Grundy) (Paul Atkinson))) ; #f because it only searches the FIRST value of each entry

;17.2, write procedure of 2 args, that when applied for sample args, return sample result

(define (f1 l1 l2)
  (list (append (cdr l1) (list (car l2))))) ;dot happens when you try to append a single char as 2nd var because it takes 2 lists. note: it only does this when 2nd one is char, 1st char crashes it

;(append '(a) 'b)

(f1 '(a b c) '(d e f))

(define (f2 l1 l2)
  (cons (cdr l1) (list (cadr l2))))

(f2 '(a b c) '(d e f))

(define (f3 l1 l2)
  (append l1 l1))

(f3 '(a b c) '(d e f))

(define (f4 l1 l2)
  (list (list (car l1) (car l2)) (append (cdr l1) (cdr l2))))

(f4 '(a b c) '(d e f))

;17.3
(map (lambda (x) (lambda (y) (+ x y))) '(1 2 3 4)) ; returns a lambda as a val, map does the thing to every individual arg
; '((lambda (y) (+ 1 y)) (lambda (y) (+ 2 y)) (lambda (y) (+ 3 y) (lambda (y) (+ 4 y)))

;17.8. Write member? tests for pred. there is a member pred

(member 2 '(1 2 3 4)) ;THERE IS MEMBER, BUT NOT A FULL PRED; IT GIVES THE LIST STARTING FROM THAT POINT ON.

(define (member? value lyst) ;lists autoeval to true
  (if (member value lyst)
      #t
      #f))

(if '() 1 3) ;lists autoeval to be true

(member? 2 '(1 2 3 4))

;17.9 write list-ref

(define (lst-rf lyst num)
  (define (lstrf-iter lyst num iterator)
    (cond ((= iterator num) (car lyst))
          (else (lstrf-iter (cdr lyst) num (+ iterator 1))))) ;already accounts for the error when over because ur cdr-ing an empty list, which is bad
  (lstrf-iter lyst (- num 1) 0)) ;displacement of starting at 0 vs starting at 1, subtracting 1 from num, which starts at 1, will bring both to start at 0, which is what we want.

(lst-rf '(1 2 3) 2)


;17.10
;(define (lngth lyst) this would work if there were a predicate that checked for errors
  ;(define (lystRefTester numElement lst)
    ;(cond ((list-ref lst numElement) (lystRefTester (+ numElement 1) lst)) ;list-ref starts at 0
      ;    (else (+ numElement 1))))
  ;(lystRefTester 0 lyst))

(define (lngth lyst) ;recursive process, w/ deferred operations
  (cond ((null? lyst) 0)
        (else (+ 1 (lngth (cdr lyst))))))

(lngth '(1 2 3 4))


;17.11 write before-in-list? which takes a list and 2 elements of list, should return #t if 2nd arg appears in list arg before 3rd arg
(define (before-in-list? lyst arg1 arg2)
  (let ((listlength (length lyst))) ;length is a compound expression in skem, is alredy there, double parentheses around let vars because of stuff
    (define (list-iter lyst iterator arg)
      (cond ((> iterator listlength) #f) ;not in list
            ((equal? (list-ref lyst iterator) arg) (+ 1 iterator)) ; better to use lyst first
            (else list-iter lyst (+ 1 iterator) arg)))
    (cond ((< (list-iter lyst 0 arg1) (list-iter lyst 0 arg2)) #t)
          (else #f))))

(before-in-list? '(1 2 3) 1 3)

;17.12 Write a procedure called flatten that takes as its argument a list, possibly including sublists, but whose ultimate building blocks are words (not Booleans or procedures). It should return a sentence containing all the words of the list, in the order in which they appear in the original:

;plan: use some sort of append thing in order to keep the order alive, but only utilizing append on 2 sequential lists?
;or, alternatively, some recursive process that adds a letter each time, and exits with a base case of '(). That should work, right?

(define (flatten lyst)
  (define (lyst-check input)
    (cond ((list? input) input)
          (else (list input))))
  (define (verify-true lyst)
    (cond ((null? lyst) #t) ;if list null then all #f, this is good
          ((equal? #t (car lyst)) #f) ;returns #f if even one element of the list is a sublist
          (else (verify-true (cdr lyst)))))
  (define (append-iter lyst result) ;counter will be set to match length of lyst, just append car and cdr, then use member on it to get the rest ig?
    (cond ((= (length lyst) 0) (if (verify-true (map list? result)) result (append-iter result '()))) ;checks list to see if it is all true, if not
          (else (append-iter (cdr lyst) (append result (lyst-check (car lyst))))))) ;literally just appending the car of a reducing list to the result
  (append-iter lyst '()))

(flatten '(((a b) c (d e)) (f g) ((((h))) (i j) k))) ; should be (a b c d e f g h i j k)
                                      

;17.14  Write a procedure branch that takes as arguments a list of numbers and a nested list structure. It should be the list-of-lists equivalent of item, like this:
;(branch '(3) '((a b) (c d) (e f) (g h)))
;(E F)

(define (branch seek lst)
  (cond ((null? seek) lst)
        (else (branch (cdr seek) (list-ref lst (- (car seek) 1)))))) ; -1 because list-ref starts from 0

(branch '(3) '((a b) (c d) (e f) (g h)))
(branch '(3 2) '((a b) (c d) (e f) (g h)))
(branch '(2 3 1 2) '((a b) ((c d) (e f) ((g h) (i j)) k) (l m)))