(define (odds numArray)
  ; first cond clause tests int and odd, if false, goes down
  ; if true, gives 1
  ; intended to fail with a list
  (cond ((and (integer? numArray) (odd? numArray)) 1)
        ((and (integer? numArray) (even? numArray)) 0)
        (else (apply + (map odds numArray)))))

; going to list, if it's blank, will output 0 because of addition thing
(odds '())