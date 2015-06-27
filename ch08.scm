#|

(define (two–firsts sent)
  (se (first (first sent))
      (first (last sent))))

; (two–firsts '(awais syed))
;'(a s)

(define (three–firsts sent)
  (se (first (first sent))
      (first (first (bf sent)))
      (first (last sent))))

(define (first–letters sent)
  (every first sent))

(every last '(while my guitar gently weeps))
'(e y r y s)
(every – '(4 5 7 8 9))

(define (plural noun)
  (if (equal? (last noun) 'y)
      (word (bl noun) 'ies)
      (word noun 's)))

(every plural '(beatle turtle holly kink zombie))
'(beatles turtles hollies kinks zombies)


(define (double letter) (word letter letter))
(define (square x)
  (* x x))
(every square 547)
'(25 16 49)

(define (sent–of–first–two wd)
  (se (first wd) (first (bf wd))))

> (every sent–of–first–two '(the inner light))
'(t h i n l i)
(every sent–of–first–two '(tell me what you see))
'(t e m e w h y o s e)

(define (g wd)
    (se (word 'with wd) 'you))

(every g '(in out))
'(within you without you)

(keep even? '(1 2 3 4 5))
'(2 4)
(define (ends–e? word) (equal? (last word) 'e))
(keep ends–e? '(please put the salami above the blue elephant))
'(please the above the blue)

(keep number? '(1 after 909))
(1 909)
(keep number? 'zonk23hey9)
239
(define (vowel? letter) (member? letter '(a e i o u)))
(keep vowel? 'piggies)
;'iie

(define (real–word? wd)
  (not (member? wd '(a the an in of and for to with))))
(keep real–word? '(lucy in the sky with diamonds))

'(lucy sky diamonds)
(every first (keep real–word? '(lucy in the sky with diamonds)))
'(l s d)
(accumulate + '(6 3 4 –5 7 8 9))
(accumulate word '(a c l u))
'aclu
(accumulate max '(128 32 134 136))
136
(accumulate + 781)
16

(accumulate sentence 'colin)

'(c o l i n)
(define (add–numbers sent)
  (accumulate + (keep number? sent)))
(add–numbers '(4 calling birds 3 french hens 2 turtle doves))
9
(add–numbers '(1 for the money 2 for the show 3 to get ready
                   and 4 to go))
10

|#