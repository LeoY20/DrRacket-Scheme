; input list, find number of odd numbers in list, returns int
(define (odds numArray)
  ;identify if integer or list
  ;INTENDED TO AUTOMATICALLY FAIL ON FIRST ATTEMPT
  (if (integer? numArray)
      ; if odd true, then output 1, else, 0. this is intended to match map
      (if (odd? numArray) 1 0)
      ; using apply here to add up all 1s and 0s
      (apply + (map odds numArray))))

; apparently adding an empty list gives 0 huh
(odds '())

  

      
      