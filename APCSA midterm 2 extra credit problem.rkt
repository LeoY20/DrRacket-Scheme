(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (keep pred? lyst)
  (accumulate (lambda (x y) (append (if (pred? x) (list x) '()) y)) '() lyst))

(keep even? '(1 2 3 4 5))