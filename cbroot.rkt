(define (cubeRt x)
  (define (square sq)
    (* sq sq))
  (define (good-enough? guess)
    (if (< (- (abs (* (square guess) guess)) x) 0.00001) ;square * guess gives the cube of the guess, abs to ensure neg doesn't screw it over
        guess
        (good-enough? (correct-guess x guess))))
  (define (correct-guess x y) ; x = 3rd power of what it should be, y = guess
    (/ (+ (/ x (square y)) (* 2 y)) 3))
  (good-enough? x)) ; leo do math aiya

(cubeRt 27.0) ;USE FLOATING POINT LOL
   