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
              
                      