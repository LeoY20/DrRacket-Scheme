; very rudimentary solution: first, continue like this, but have the testing for exponent run recursively on a HELPER PROCEDURE
; then output the value here lol and we'll figure it out

(define (toBinary number) ; main, will be the one compounding the results together
  (cond ((and (integer? number) (or (equal? number 1) (equal? number 0))) number) ; covers cases below 2
        (else (apply + (append (list(toBinary (- number (expt 2 (2exp number 0))))) (list(expt 10 (2exp number 0)))))))); you have to put list here in order to make append work because no likey when no double list cuz it's supposed to combine two lists together
; this doesn't get in the way of the first one, because that one will output list in the case where it is greater than 2 (the starting num), but it will auto output the digits alone when you have like (toBinary 1)
       
        


; helper procedure
(define (2exp toBinNum loopCount)
  (cond ((> 0 (- toBinNum (expt 2 loopCount))) (- loopCount 1)) ; basically takes the last largest one that worked, also no equals sign or else it gets wonky, it will return 1 before because 0 is accepted value for bypassing limit, so yeah.
        (else (2exp toBinNum (+ loopCount 1)))))

(toBinary 0)    ; returns 0
(toBinary 1)    ; returns 1
(toBinary 13)   ; returns 1101
(toBinary 64)   ; returns 1000000
(toBinary 91)   ; returns 1011011




      
        