;inorder
;takes in bst as input, returns data in ascending order
;bst abstraction
(define (make-bintree datum left right)
  (lambda (msg)
    (cond ((= msg 0) datum)
          ((= msg 1) left)
          ((= msg 2) right))))

(define (datum bintree) (bintree 0))
(define (left bintree) (bintree 1))
(define (right bintree) (bintree 2))

(define tet 'toasterhead)  ; tet = the empty tree
(define (empty-tree? tree) 
  (eq? tree tet))
(define (leaf? bintree)
  (and (not (empty-tree? bintree))
       (empty-tree? (left bintree))
       (empty-tree? (right bintree))))


(define bst
  (make-bintree 15
     (make-bintree 6
        (make-bintree 2 tet tet)
        tet)
     (make-bintree 22
        (make-bintree 17
           (make-bintree 16 tet tet)
           (make-bintree 19 tet tet))
        (make-bintree 24 tet tet))))

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

;(repeater 0 '(1 3 2 4 5 8 9))

;(reverse (sort '(1 3 2 4 5 3 8 9) '()))

(define (inorder bintree)
  (define (helper bintree1)
    (cond ((empty-tree? bintree1) '()) ;empty list
          (else (append (list (datum bintree1))
                        (helper (left bintree1))
                        (helper (right bintree1))))))
  (repeater 0 (helper bintree)))

(inorder bst)
