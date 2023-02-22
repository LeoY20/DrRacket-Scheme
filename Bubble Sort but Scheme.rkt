(define compVal 0)
(define (sort lyst output) ;STUPID BUBBLE SORT WHY DID I DO THIS
  (cond ((and (null? output) (< (car lyst) (cadr lyst))) (set! compVal (cadr lyst)) ;first value of output anyway
                                                         (sort (cdr lyst) (append (list (cadr lyst) (car lyst)) output))) ;first one, put first 2 in sorted
        ((and (null? output) (> (car lyst) (cadr lyst))) (set! compVal (car lyst)) ;first value of output anyway
                                                         (sort (cdr lyst) (append (list (car lyst) (cadr lyst)) output)))
        ((= (length lyst) 1) output) ;final exit clause cuz I am evaluating based on cadr here
        ((= (length lyst) 2) (sort (cdr lyst) (append (list (cadr lyst)) output))) ;need to use cadr because my program is dumb and stupid and this is the only way it doesn't die
        ((or (< compVal (cadr lyst)) (= compVal (cadr lyst))) (set! compVal (cadr lyst))
                                                              (sort (cdr lyst) (append (list (cadr lyst)) output)))
        (else (set! compVal (car output))
              (set-car! output (cadr lyst)) ;changing to correct sorted value in case where it's not already sorted
              (sort (cdr lyst) (append (list compVal) output))))) ;adding other value

(define (repeater counter output1)
  (cond ((= counter (length output1)) (reverse output1))
        ((= counter 0) (repeater (+ counter 1) (sort output1 '())))
        (else (repeater (+ counter 1) (sort (reverse output1) '())))))

