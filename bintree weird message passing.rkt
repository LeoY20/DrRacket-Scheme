(define (make-bintree key value left right)
  (define (get-key) key)
  (define (get-value) value)
  (define (get-left) left)
  (define (get-right) right)
  (define (set-left! tree) (set! left tree))
  (define (set-right! tree) (set! right tree))
  (define (set-value! v) (set! value v))
  (define (dispatch m)
    (cond ((eq? m 'k) get-key)
          ((eq? m 'v) get-value)
          ((eq? m 'l) get-left)
          ((eq? m 'r) get-right)
          ((eq? m 'sl!) set-left!)
          ((eq? m 'sr!) set-right!)
          ((eq? m 'sv!) set-value!)))
  dispatch) ;message passing, outputs dispatch as a function at end, will need double parentheses
;no matter what you put in, will output a tree

(define tet 'gloriosky) ;tet = the empty tree
(define bst (make-bintree 10 'cow tet tet))
(define (empty-tree? t) (eq? t tet))

;1. selectors
(define (key t)
  ((t 'k))) ;must use double because even if you message pass in, it outputs the procedure, and you need to call it to get the value out

(define (value t)
  ((t 'v)))

(define (left t)
  ((t 'l)))

(define (right t)
  ((t 'r)))

(key bst)
(left bst)

;2 mutators
(define (set-left! k v t)
  ((t 'sl!) (make-bintree k v tet tet))) ;tet tet to show that they are empty trees, to make the node, key and value but no node, need to make new bintree lol

(define (set-right! k v t)
  ((t 'sr!) (make-bintree k v tet tet)))

(define (set-value v t)
  ((t 'sv!) v)) ;don't need to do subtree bc it's just the value

(set-left! 2 10 bst)

(left bst)

(define (insert! k v bst)
  (cond ((< k (key bst))
         (cond ((empty-tree? (left bst)) (set-left! k v bst)) ;if it's empty, you want to set the left to the inputted bst
               (else (insert! k v (left bst))))) ;recursive call to go into subtree
        ((> k (key bst))
         (cond ((empty-tree? (right bst)) (set-right! k v bst))
               (else (inert! k v (right bst))))) ;recursive call to go into right subtree

        (else (set-value! v bst)))) ;value of existing node (which is literally just blank) is now the bst, so now bst is filled

;4.
(define bst (make-bintree 10 'cow tet tet))

(insert! 4 'fish bst)
(insert! 17 'arugula bst)
(insert! 13 'pepsi (right bst))

;5. write function inorder returning list of all key-val pairs in binsearch tree
(define (inorder t)
  (cond ((empty-tree? t) '()) ;condition checking for empty tree
        (else (append (inorder (left t)) ;appends a recursive call to the left, a cons of the key and value of the tree's node, and then a recursive call to the right side
                      (list (cons (key t) (value t)))
                      (inorder (right t))))))

(inorder bst)

         
        


        
  