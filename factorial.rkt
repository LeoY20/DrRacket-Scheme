(define (factorial n)
  (if (equal? n 0)
      add one here because the final iteration still multiplies by the exit clause
      1 is only option
      we add one here to take care of the case where 0! is imputted
      going to 0 covers for this case lol
      (+ n 1)
      by putting n outside, you ensure that the first recursive procedure is kept open
      thus, you can use original n
      it's kind of like a rabbit hole, where it will go down until you hit the exit clause
      (* n (factorial (- n 1)))))

(factorial 3)


  
    