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



exercise 
8.4 Write a procedure choose–beatles that takes a predicate function as 
its argument and returns a sentence of just those Beatles (John, Paul, George, and Ringo)
 that satisfy the predicate. For example:
Page 121
(define (ends–vowel? wd) (vowel? (last wd)))
(define (even–count? wd) (even? (count wd)))
> (choose–beatles ends–vowel?)
(GEORGE RINGO)
> (choose–beatles even–count?)
(JOHN PAUL GEORGE)
|#
(define (ends-vowel? wd) (vowel? (last wd)))
(define (even-count? wd) (even? (count wd)))

(define (vowel? wd) (member? wd '(a e i o u)))

(define (choose-beatles pre-define)
  (keep pre-define '(John Paul George Ringo)))
#|

(choose-beatles ends-vowel?)
'(George Ringo)
(choose-beatles even-count?)
'(John Paul George)
8.5 Write a procedure transform–beatles that takes a procedure as an argument, 
applies it to each of the Beatles, and returns the results in a sentence:
(define (amazify name)
  (word 'the–amazing–name))
> (transform–beatles amazify)
(THE–AMAZING–JOHN THE–AMAZING–PAUL THE–AMAZING–GEORGE
THE–AMAZING–RINGO)
> (transform–beatles butfirst)
(OHN AUL EORGE INGO)
|#
(define (amazify name)
    (word 'the-amazing-name))


(define (transform-beatles function)
  (se (every function '(John Paul George Ringo))))
#|
(transform-beatles amazify)
'(the-amazing-name the-amazing-name the-amazing-name the-amazing-name)
(transform-beatles butfirst)
'(ohn aul eorge ingo)

8.7 [14.5]* Write a procedure letter–count that takes a sentence as its 
argument and returns the total number of letters in the sentence:
> (letter–count '(fixing a hole))
11

|#


(define (letter-count se)
  (accumulate + (every count se)))
#|
(letter-count '(fixing a hole))
11
letter-count '( how are we doing with the project))
27


8.6 When you're talking to someone over a noisy radio connection, 
you sometimes have to spell out a word in order to get the other 
person to understand it. But names of letters aren't that easy to 
understand either, so there's a standard code in which each letter is
 represented by a particular word that starts with the letter. For example, 
instead of "B" you say "bravo."
Write a procedure words that takes a word as its argument and returns a sentence 
of the names of the letters in the word:
> (words 'cab)
(CHARLIE ALPHA BRAVO)
(You may make up your own names for the letters or look up the standard ones if you want.) 
Hint: Start by writing a helper procedure that figures out the name for a single letter.
|#
(define (radio-word l)
  (cond ((equal? l 'a) 'alpha)
        ((equal? l 'b) 'bravo)
        ((equal? l 'c) 'charlie)
        ((equal? l 'd) 'delta)
        ((equal? l 'e) 'echo)
        ((equal? l 'f) 'foxtrot)
        ((equal? l 'g) 'golf)
        ((equal? l 'h) 'hotel)
        ((equal? l 'i) 'india)
        ((equal? l 'j) 'juliet)
        ((equal? l 'k) 'kilo)
        ((equal? l 'l) 'lima)
        ((equal? l 'm) 'mike)
        ((equal? l 'n) 'november)
        ((equal? l 'o) 'oscar)
        ((equal? l 'p) 'papa)
        ((equal? l 'q) 'quebec)
        ((equal? l 'r) 'romeo)
        ((equal? l 's) 'sierra)
        ((equal? l 't) 'tango)
        ((equal? l 'u) 'uniform)
        ((equal? l 'v) 'victor)
        ((equal? l 'w) 'whisky)
        ((equal? l 'x) 'x-ray)
        ((equal? l 'y) 'yankee)
       
        (else 'zebra)))

(define (phonetic wd)
  (se (every radio-word wd)))
#|
(phonetic 'how)
'(hotel oscar whisky)
|#

#| 8.8 [12.5] Write an exaggerate procedure which exaggerates sentences: > (exaggerate '(i ate 3 potstickers))
(I ATE 6 POTSTICKERS)
> (exaggerate '(the chow fun is good here))
(THE CHOW FUN IS GREAT HERE)
It should double all the numbers in the sentence, and it should replace "good" with "great," "bad'' with "terrible," and anything else you can think of.
|#

(define (exaggerate se)
  (every double-num se))

(define (double-num wd)
  (if (number? wd)
      (* 2 wd)
      (superlative wd)))

(define (superlative wd) 
  (cond ((equal? wd 'good)      'great   )
        ((equal? wd 'bad)       'terrible)
        ((equal? wd 'nice)      'fantastic)
        (else wd)))
#|
8.11 [12.6] Write a GPA procedure. It should take a sentence of grades as its argument and return the corresponding grade point average:
> (gpa '(A A+ B+ B))
3.67
Hint: write a helper procedure base–grade that takes a grade as argument and returns 0, 1, 2, 3, or 4, and another helper procedure
grade–modifier that returns–.33, 0, or .33, depending on whether the grade has a minus, a plus, or neither.
|#

(define (gpa se)
  ( / (accumulate + (every base-grade se))
      (count se)))
  
(define (split-grade grade)
  (+    grade-from-letter   (first grade)
        
        grade-from-modifier))



(define (base-grade wd)
  (cond ((equal? wd 'A)  4)
        ((equal? wd 'B)  3)
        ((equal? wd 'C)  2)
        ((equal? wd 'D)  1)
        ((equal? wd 'E)  0)
        (else 0)))

  
(define (grade-modifier modifier)
  (cond ((equal? modifier '- )  -.33 )
        ((equal? modifier '+ )   .33 )
         (else 0)))
  
 #| 
  8.9 What procedure can you use as the first argument to every so that for any sentence used 
as the second argument, every returns that sentence?
What procedure can you use as the first argument to 
keep so that for any sentence used as the second 
argument, keep returns that sentence?
What procedure can you use as the first 
argument to accumulate so that for any sentence used as the second argument,
accumulate returns that sentence?


a (every word '(awais is here))

'(awais is here)   
 
b (keep sentence '(awais ar her))

c (accumulate sentence '(awais was here))
'(awais was here)



 
   
8.10 Write a predicate true–for–all? that takes two arguments, a predicate procedure a
nd a sentence. It should return #t
if the predicate argument returns true for every word in the sentence.   
   
  


   
(every last '(algebra purple spaghetti tomato gnu))

   
 (define (square x)
   (* x x))
'(a e i o u)
> (every square (keep even? '(87 4 7 12 0 5)))
'(16 144 0)
> (every first '(and i love her))
'(a i l h)
> (keep vowel? (every first '(and i love her)))
'(a i)

> (keep vowel? (every first '(and i love her)))
'(a i)
> (accumulate word (keep vowel? (every first '(and i love her))))
'ai
> (accumulate se (keep vowel? (every first '(and i love her))))
'(a i)
> ((repeated square 0) 25)
25
 

(define (f a)
  ((keep even? a)))

When you teach a class, people will get distracted if you say "um" too many times. Write a count–ums that 
counts the number of times "um" appears in a sentence:
|#

;(define (count sent)
 ; (accumulate + (every always–one sent)))
#|
8.2 Fill in the blanks in the following Scheme interactions:
> (__________ vowel? 'birthday)
IA
answer.
keep vowel? 'birthday)
'ia
Page 120
> (________ first '(golden slumbers))
(G S)
answer.
(every first '(golden slumbers))
'(g s)
> (________ '(golden slumbers))
GOLDEN
answer
(first '(golden slumber))
'golden
> (________ ________ '(little child))
(E D)
answer
(every last '(little child))
'(e d)
> (________ ________ (________ ________ '(little child)))
ED
(accumulate word (every last '(little child)))
'ed
> (________ + '(2 3 4 5))
(2 3 4 5)
no known.
> (________ + '(2 3 4 5))
14
(accumulate + '(2 3 4 5))
14

need to discuss 8.3
|#
#|
8.12 [11.2] When you teach a class, people will get distracted if you say "um" too many times. Write a count–ums that counts the number of times "um" appears in a sentence:
> (count–ums
  '(today um we are going to um talk about functional um programming))
3
|#

(define (always–one arg)
  1)

(define (count sent)
  (accumulate + (every always–one sent)))

(define (um? wd)
  (member? wd '(um)))

(define (count-ums sent)
  (count  (keep um? sent)))
#|
anwer
(count-ums '(i um waiting um ))
2


|#

  
  
  
  
  
  











