(define (largerSq n1 n2 n3)
  (cond ((and (> n1 n3) (> n2 n3)) (+ (* n1 n1) (* n2 n2))) ; check that n1 n2 greater than n3
        ((and (> n1 n2) (> n3 n2)) (+ (* n1 n1) (* n3 n3))) ; check for n1, n3 against 2 for largest
        (else (+ (* n2 n2) (* n3 n3))))) ; doesn't matter because everything else is a repeat checked above, last one musts be this. combinatorics!

(largerSq 1 2 3)

(largerSq 3 2 1)

(largerSq 2 3 1)