;Exercise 2.35: Redefine count-leaves from Section 2.2.2
;as an accumulation:

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (count-leaves1 t)
  (accumulate (lambda (x y) (+ x y)) 0 (map (lambda (x) (if (integer? x) 1 (count-leaves1 x))) t))) ;sequence that ur doing stuff to is a map???
;mapping countleaves should output 1 if single, and go again if pair

(count-leaves1 '((1 2) (3 5) 4))
;want to find the total numbers inside deep list

;if int then change to 1, else run on sublist