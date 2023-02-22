;queues

;q -> ftpair | r-pair
;       |        |
;    | a |  | ->| n | / |
;only point to front and end but not to middle

(define (make-queue)
  (let ((front-ptr '()) ;essentially this functions as 2 variables, that will probably get constructed into a list
        (rear-ptr '())) ;ft ptr points to first part of list, rear ptr points to last value in list

    (define (set-front-ptr! pair)
      (set! front-ptr pair)) ;works bc let, you are redefining let
    
    (define (set-rear-ptr! pair)
      (set! rear-ptr pair)) ;works bc let, you are redefining a let
    
    ; empty-queue? is written to align with the way front-ptr
    ; and rear-ptr were given, above
    (define (empty-queue?)
      (and (null? front-ptr) (null? rear-ptr)))

    ; peek returns the datum at the front of the queue
    ; peek returns #f if the queue is empty
    (define (peek)
      (cond ((empty-queue?) (display "Empty queue.  :-( skill dif"))
            (else (car front-ptr))))

    ; insert-queue! plays out differently depending on whether the queue
    ; is currently empty or not
    (define (insert-queue! datum)
      (let ((new-node (cons datum '()))) ;new-node is a 1 element list with datum as only element
        (cond ((empty-queue?) (set-front-ptr! new-node) ;queue is empty, set ft pointer to new node, set rear ptr to new node bc only one node
                              (set-rear-ptr! new-node)) 
              (else (set-cdr! rear-ptr new-node) ;connecting to rear pointer, bc it's a pair w/ empty list, now it's broken, reattached to new one. MUST DO SETCDR for this
                    (set-rear-ptr! new-node))))) ;no need to do cons because it's just one thing, ur shifting arrow to now point toward the beginning of new-node, not the old car which isn't the end


    ; delete-queue! has three possibilties:
    ; * empty queue
    ; * one element in queue
    ; * more than one element in queue
    (define (delete-queue!)
      (cond ((empty-queue?) (error "Empty queue.  :-("))
            (else 
                    ; store the datum at the head of the queue
                  (let ((return-value (peek)))
                    ; update the front pointer
                    (set-front-ptr! (cdr front-ptr))
                    ; If there was only one thing in the queue, then the
                    ; rear-ptr will need to be set to nil
                    (if (null? front-ptr) (set-rear-ptr '())
                    ; Now return the element of the queue (or #f)
                        (return-value front-ptr))))))

    (define (show)
      (display front-ptr)) ;show displays the front pointer

    (define (dispatch message)
      (cond ((eq? message 'insert-queue!) insert-queue!)
            ((eq? message 'delete-queue!) delete-queue!)
            ((eq? message 'peek) peek)
            ((eq? message 'empty?) empty-queue?)
            ((eq? message 'show) show)))
    dispatch)) ;you want to return the dispatch procedure, not call it

(define a (make-queue))
((a 'insert-queue!) 3)
((a 'show))
((a 'insert-queue!) 4)
((a 'insert-queue!) 10)
((a 'show))
