(define (before-in-list? lyst arg1 arg2)
  (let ((listlength (length lyst))) ;length is a compound expression in skem, is alredy there, double parentheses around let vars because of stuff
    (define (list-iter lyst iterator arg)
      (cond ((> iterator listlength) #f) ;not in list
            ((equal? (list-ref lyst iterator) arg) (+ 1 iterator))
            (else list-iter lyst (+ 1 iterator) arg)))
    (cond ((< (list-iter lyst 0 arg1) (list-iter lyst 0 arg2)) #t)
          (else #f))))

(before-in-list? '(1 2 3) 3 1)