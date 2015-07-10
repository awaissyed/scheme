#|
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

#|
8.13 [11.3] Write a procedure phone–unspell that takes a spelled version of a phone number, 
such as POPCORN, and returns the real phone number, in this case7672676. 
You will need to write a helper procedure that uses an 8- way cond expression to
 translate a single letter into a digit.
|#

(define (phone-unspell wd)
  (accumulate word (every number-to-letter wd)))

(define (number-to-letter wd)
  (cond ((member? wd 'abc )   '2)
        ((member? wd 'def )   '3)
        ((member? wd 'ghi )   '4)
        ((member? wd 'jkl )   '5)
        ((member? wd 'mno )   '6)
        ((member? wd 'pqrs )   '7)
        ((member? wd 'tuv )   '8)
        ((member? wd 'wxyz)   '9)
        (else 0)))
#|
phone-unspell 'popcorn)
7672676
> (phone-unspell 'awais)
29247
|#

(define (g b)
  (every b '(blue jay way)))
|#
#|
------------------------------------------------------------------------------------------
|#


(define (square x)
  (* x x))


(every - '(4 5 7 8 9)) 
(every square 547)

(keep even? '(1 2 3 4 5))
(define (ends–e? word) (equal? (last word) 'e))
(keep ends–e? '(please put the salami above the blue elephant))



(accumulate + (keep number? '(1 after 909)))
(define (real–word? wd)
  (not (member? wd '(a the an in of and for to with))))

(every first (count (keep real–word? '(lucy in the sky with diamonds))))

(define (hyphenate word1 word2)
(word word1 '- word2))

(accumulate hyphenate '(ob la di ob la da))

(define (always–one arg)
  1)

(define (count sent)
  (accumulate + (every always–one sent)))
(count '(the continuing story of bungalow bill))


(define (acronym phrase)
  (accumulate word (every first (keep real–word? phrase))))

(acronym '(reduced instruction set computer))

(acronym '(structure and interpretation of computer programs))
(define (double letter) (word letter letter))
                        
(every double 'girl)

(keep even? '(1 2 3 4 5))

(se (if (even? 1) 1 '())
      (if (even? 2) 2 '())
      (if (even? 3) 3 '())
      (if (even? 4) 4 '())
      (if (even? 5) 5 '()))

((repeated bf 3) '(she came in through the bathroom window))





 ((repeated square 2) 3)
(define (double sent)
  (se sent sent))



((repeated double 3) '(banana))

(define (any–numbers? sent)
  (not (empty? (keep number? sent))))
(define (spell–digit digit)
  (item (+ 1 digit)
        '(zero one two three four five six seven eight nine)))



(every spell–digit 1971)


(define (beatle–number n)
  (if (or (< n 1) (> n 4))
      '()
      (item n '(john paul george ringo))))

  
(beatle–number 3)
  
  (beatle–number 5)
  
  (every beatle–number '(2 8 4 0 1))
  
(se (beatle–number 2) (beatle–number 8) (beatle–number 4)
    (beatle–number 0) (beatle–number 1))


((repeated bf 3) 987654)
(define (vowel? wd)
  (member? wd 'aeiou))

#|
8.1 What does Scheme return as the value of each of the following expressions? Figure it out for yourself before you
try it on the computer.
|#
(every last '(algebra purple spaghetti tomato gnu))

(keep number? '(one two three four))

(accumulate * '(6 7 13 0 9 42 17))

(member? 'h (keep vowel? '(t h r o a t)))

(every square (keep even? '(87 4 7 12 0 5)))

(accumulate word (keep vowel? (every first '(and i love her))))
((repeated square 0) 25)


(every (repeated bl 2) '(good day sunshine))

#|
8.3 Describe each of the following functions in English. Make sure to include a description of the domai
n and range of each function. Be as precise as possible; for example,
 "the argument must be a function of one numeric argument" is better than "the argument must be a function."

(define (f a)
  (keep even? a))
takes number or collection of numbers and returns even

(define (g b)
  (every b '(blue jay way)))
receive a function as input and will apply to '(blue jay way)


(define (h c d)
  (c (c d)))

c is a funcion that take one argument. d is domain of c

(define (i e)
  (/ (accumulate + e) (count e)))

accumulate
tkes a sentence an a prodecure . applies procedure first 2 elements and result with 3rd emelemt and so on


repeated
takes an function and a number, applies function according to number given.



(repeated sqrt 3)
i will calculate sqrt 3 times

(repeated first 2)
it apply first function 2 times


(repeated (repeated bf 3) 2)
it will apply bf 3 times and will do again 2 times


8.4 Write a procedure choose–beatles that takes a predicate function as its argument and
 returns a sentence of just those Beatles (John, Paul, George, and Ringo) that satisfy the predicate. For example:
Page 121
(define (ends–vowel? wd) (vowel? (last wd)))
(define (even–count? wd) (even? (count wd)))
> (choose–beatles ends–vowel?)
(GEORGE RINGO)
> (choose–beatles even–count?)
(JOHN PAUL GEORGE)

|#

(define (ends-vowel? wd)
  (vowel? (last wd)))

(define (even-count? wd) (even? (count wd)))

(define (vowel? wd) (member? wd '(a e i o u)))

(define (choose-beatles func-tion)
  (keep func-tion '(John Paul George Ringo)))

(choose-beatles ends-vowel?)

(choose-beatles even-count?)
#|
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

(define (transform-beatles fu-nc)
  (se (every fu-nc '(John Paul George Ringo))))

(transform-beatles amazify)
(transform-beatles bf)
(transform-beatles bl)
(transform-beatles last)


#|
8.6 When you're talking to someone over a noisy radio connection, you sometimes have to spell out a word in order to get
 the other person to understand it. But names of letters aren't that easy to understand either, so there's a standard code
 in which each letter is represented by a particular word that starts with the letter. For example, instead of "B" you say "bravo."
Write a procedure words that takes a word as its argument and returns a sentence of the names of the letters in the word:
> (words 'cab)
(CHARLIE ALPHA BRAVO)
(You may make up your own names for the letters or look up the standard ones if you want.) Hint: Start by writing a helper
 procedure that figures out the name for a single letter.
|#

              
(define (radio-word letter)
  (cond ((equal? letter 'a) 'alpha)
        ((equal? letter 'b) 'bravo)
        ((equal? letter 'c) 'charlie)
        ((equal? letter 'd) 'delta)
        ((equal? letter 'e) 'echo)
        ((equal? letter 'f) 'foxtrot)
        ((equal? letter 'g) 'golf)
        ((equal? letter 'h) 'hotel)
        ((equal? letter 'i) 'india)
        ((equal? letter 'j) 'juliet)
        ((equal? letter 'k) 'kilo)
        ((equal? letter 'l) 'lima)
        ((equal? letter 'm) 'mike)
        ((equal? letter 'n) 'november)
        ((equal? letter 'o) 'oscar)
        ((equal? letter 'p) 'papa)
        ((equal? letter 'q) 'quebec)
        ((equal? letter 'r) 'romeo)
        ((equal? letter 's) 'sierra)
        ((equal? letter 't) 'tango)
        ((equal? letter 'u) 'uniform)
        ((equal? letter 'v) 'victor)
        ((equal? letter 'w) 'whisky)
        ((equal? letter 'x) 'x-ray)
        ((equal? letter 'y) 'yankee)
       
        (else 'zebra)))

(define (phone wd)
  (se( every radio-word wd)))


(phone 'abc)
(phone 'pakistan)
#|
8.7 [14.5]* Write a procedure letter–count that takes a sentence as its argument and returns the total number of letters in the sentence:
> (letter–count '(fixing a hole))
11
|#
(define (letter-count senten-ce)
   (accumulate + (every count senten-ce)))

(letter-count '(fixing a hole))
(letter-count '(i am busy))
#|
8.8 [12.5] Write an exaggerate procedure which exaggerates sentences: > (exaggerate '(i ate 3 potstickers))
(I ATE 6 POTSTICKERS)
> (exaggerate '(the chow fun is good here))
(THE CHOW FUN IS GREAT HERE)
It should double all the numbers in the sentence, and it should 
replace "good" with "great," "bad'' with "terrible," and anything else you can think of.


 |#
(define (exaggerate exa)
  (every double exa))


(define (double y)
  (if (number? y) (* y 2)
      (superlative y)))
(define (superlative y)
  (cond ((equal? y 'good)      'great   )
        ((equal? y 'bad)       'terrible)
        ((equal? y 'nice)      'fantastic)
        (else y)))
  
(exaggerate '(i ate 3 potstickers))

(exaggerate '(the chow fun is good here))

(exaggerate '(i ate 6 postickers and the chow fun is good here))

(exaggerate '(the chow fun is bad here))
#|
8.9 What procedure can you use as the first argument to every 
so that for any sentence used as the second argument, every returns that sentence?

word and sentence
|#
(every sentence '(this is a every sentence))
(every word '(this is a every sentence))

#|
What procedure can you use as the first argument to keep so that for any sentence
 used as the second argument, keep returns that sentence?

word and sentence
|#
(keep sentence '(this is a keep sentence))
(keep word '(this is a keep sentence))
#|
What procedure can you use as the first argument to accumulate so that for any sentence 
used as the second argument, accumulate returns that sentence?

sentence
|#
(accumulate sentence '(this is a accumulate sentence))

#|
8.10 Write a predicate true–for–all? that takes two arguments, a predicate procedure and a sentence. 
It should return #t if the predicate argument returns true for every word in the sentence.
> (true–for–all? even? '(2 4 6 8))
#T
> (true–for–all? even? '(2 6 3 4))
#F
|#

(define (true-for-all? pre sent)
  (= (count sent) (count (keep pre sent))))

(true-for-all? even? '(2 4 6))

(true-for-all? even? '(2 4 6 3))
#|
8.11 [12.6] Write a GPA procedure. It should take a sentence of grades as its argument and return the corresponding grade point average:
> (gpa '(A A+ B+ B))
3.67
Hint: write a helper procedure base–grade that takes a grade as argument and returns 0, 1, 2, 3, or 4, 
and another helper procedure grade–modifier that returns–.33, 0, or .33, depending on whether the grade has a minus, a plus, or neither.
|#
#|
(define (gpa se)
  ( / (accumulate + (every base-grade se))
      (count se)))
  
(define (split-grade grade)
  (se (+ (base-grade grade) (grade-modifier grade))))



(define (base-grade wd)
  (cond ((equal? wd 'A)  4)
        ((equal? wd 'A+)  4.33)
        ((equal? wd 'B)  3)
        ((equal? wd 'B+)  3.33)
        ((equal? wd 'C)  2)
        ((equal? wd 'C+)  2.33)
        ((equal? wd 'D)  1)
        ((equal? wd 'D+)  1.33)
        ((equal? wd 'E)  0)
        (else 0)))

  
(define (grade-modifier modifier)
  (cond ((equal? modifier '- )  -.33 )
        ((equal? modifier '+ )   .33 )
         (else 0)))

|#


(define (gpa se)
  ( / (+ (accumulate + (every base-grade se )) (accumulate + (every grade-modifier se)))
      (count se)))
  




(define (base-grade wd)
  (cond ((equal? (first wd) 'A)  4)        
        ((equal? (first wd) 'B)  3)       
        ((equal? (first wd) 'C)  2)      
        ((equal? (first wd) 'D)  1)
        ((equal? (first wd) 'E)  0)
        (else 0)))

  
(define (grade-modifier wd)
  (cond ((equal? (bf wd) '- )  -.33 )
        ((equal? (bf wd) '+ )   .33 )
         (else 0)))


(gpa '(A A+ B+ B))

#|
8.12 [11.2] When you teach a class, people will get distracted if you say "um" too many times. 
Write a count–ums that counts the number of times "um" appears in a sentence:
> (count–ums
  '(today um we are going to um talk about functional um programming))
3

|#

(define (um? wd)
  (member? wd '(um)))

(define (count-ums sent)
  (count  (keep um? sent)))

(count-ums '(today um we are going to um talk about functional um programming))

#|
8.13 [11.3] Write a procedure phone–unspell that takes a spelled version of a phone number, such as POPCORN, 
and returns the real phone number, in this case7672676. You will need to write a helper procedure that uses an
 8- way cond expression to translate a single letter into a digit.
|#



(define (number-to-letter wd)
  (cond ((member? wd 'abc )   '2)
        ((member? wd 'def )   '3)
        ((member? wd 'ghi )   '4)
        ((member? wd 'jkl )   '5)
        ((member? wd 'mno )   '6)
        ((member? wd 'pqrs )   '7)
        ((member? wd 'tuv )   '8)
        ((member? wd 'wxyz)   '9)
        (else 0)))
(define (phone-unspell wd)
  (accumulate word (every number-to-letter wd)))

(phone-unspell 'popcorn)
#|
8.14 Write the procedure subword that takes three arguments: a word, a starting position number,
 and an ending position number. It should return the subword containing only the letters between the specified positions:
> (subword 'polythene 5 8)
THEN
|#

(define (subword wd start end)
  ((repeated bl (- (count wd) end))
    ((repeated bf (- start 1)) wd)))


(subword 'ispakistanjw 3 10)
(subword 'polythene 5 8)

