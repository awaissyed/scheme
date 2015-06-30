#|
(define (f x)                        ;; wrong!
  (* x 3)
)


Exercise 4

4.1
|#

(define (ho–hum x y)
  (+ x (* 2 y)))
#|
it will  replace y with 12 and x qith 8. myltiply 12 with 2 =24, then add 24+8=32.
(ho–hum 8 12)
32
|#

(define (exponent num expo)
  (* num (expt 10 expo)))
