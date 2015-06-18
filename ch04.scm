(define (square x)
  (* x x))
#|(define (awais x)
  (+ x x))



(define (f a b)
  (+ (* 3 a) b))

(define (average first_number second_number)
  (/ (+ first_number second_number)
     2))

(define (hypotenuse a b)
  (sqrt (+ (square a) (square b))))
(hypotenuse 5 12)

(define (sum–of–squares x y)
  (+ (square x)
(square y)))
|#
(define (f x y) (–  x y))
;4.4 exercise


; (define (sphere-volume r)
;   (* (/ 4 3) 3.141592654)
;   (* r r r))

; Problem: Contains two separate expressions.

; Solution:
(define (sphere-volume r)
  (* (* r r r)
     (* (/ 4 3) 3.141592654)))

; Procedure:
; (define (next x)
;   (x + 1))

; Problem: wrong way of writing.

; Solution:
(define (next x)
  (+ x 1))


; Procedure:
; (define (square)
;   (* x x))

; Problem: no argument for defined procedure

; Solution:
(define (square x)
  (* x x))


; Procedure:
(define (triangle-area triangle)
  (* 0.5 base height))

; Problem: incorrectf arguments.

; Solution:
(define (triangle-area base height)
  (* 0.5 base height))

; Procedure:
;(define (sum-of-squares (square x) (square y))
;  (+ (square x) (square y)))

; Problem: calling of procedure in place of argument

; Solution:
(define (sum-of-squares x y)
  (+ (square x) (square y)))

; Write a procedure to convert a temperature from Fahrenheit to Celsius, and another
; to convert in the other direction. F = (9/5)C + 32 and C = (5/9)(F − 32).

(define (f-to-c temp)
  (+ (* (/ 9 5) temp) 32))

(define (c-to-f temp)
  (* (/ 5 9) (- temp 32)))


;Define a procedure fourth that computes the fourth power of its argument. Do
; this two ways, first using the multiplication function, and then using square and not
; (directly) using multiplication.

(define (fourth-1 x)
  (* x x x x))

(define (fourth-2 x)
  (square (square x)))

;4.7 Write a procedure that computes the absolute value of its argument by finding the
; square root of the square of the argument.

(define (absolute x)
  (sqrt (* x x)))


;4.8“Scientific notation” is a way to represent very small or very large numbers by
; combining a medium-sized number with a power of 10. For example, 5 × 10^7 represents
; the number 50000000, while 3.26 × 10^−9 represents 0.00000000326 in scientific notation.
; Write a procedure scientific that takes two arguments, a number and an exponent
; of 10, and returns the corresponding value:

(define (scientific number exponent)
+  (* number (expt 10 exponent)))

;4.9 Define a procedure discount that takes two arguments: an item’s initial price and
; a percentage discount. It should return the new price:
;
; > (discount 10 5)
; 9.50
;
; > (discount 29.90 50)
; 14.95

(define (discount initial percentage)
  (* initial (/ (- 100 percentage) 100)))

; 4.10.write a procedure to compute the tip you should leave at a restaurant. It should
; take the total bill as its argument and return the amount of the tip. It should tip by 15%,
; but it should know to round up so that the total amount of money you leave (tip plus
; original bill) is a whole number of dollars. (Use the ceiling procedure to round up.)



(define (tip price)
  (ceiling (discount price 85)))




