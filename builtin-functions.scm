(load "programming/scheme/functions.scm")
(functions)
#|
Function: +
Argument: 4
Argument: 6

The result is: 10

Function: first
Argument: '(imran awais)
Bad parentheses
Argument: 'imran

The result is: '

Function: first
Argument: (imran awais)

The result is: imran

Function: member?
Argument: 'awais
Argument: (awais and imran are ok)

The result is: #F

Function: member?
Argument: awais
Argument: (awais andimran)

The result is: #t

Function: bf
Argument: (awais imran)

The result is: (imran)

Function: bf
Argument: 'awais

The result is: awais

Function: bf
Argument: awais

The result is: wais

Function: bf
Argument: a

The result is: 

Function: count
Argument: 7654

The result is: 4

Function: number-of-arguments
Argument: equal?

The result is: 2

Function: if
Argument: 5
Argument: <
Argument: 6
Argument(s) not in domain.
Function: number-of arguments
You typed more than one thing!  Try again.
Function: number-of-arguments
Argument: accumulate
Argument(s) not in domain.
Function: number-of-arguments
Argument: every

The result is: 2

Function: appearances
Argument: a
Argument: taxman

The result is: 2

Function: item
Argument: taxmax
Argument: taxmax imran
You typed more than one argument!  Try again.
Argument: item
Argument(s) not in domain.
Function: item
Argument: a
Argument: taxmax
Argument(s) not in domain.
Function: mumber-of-argument
Sorry, that's not a function.
Function: item
Argument: e
Argument: item
Argument(s) not in domain.
Function: number-of-arguments
Argument: item

The result is: 2

Function: keep
Argument: a
Argument: taxmax
Argument(s) not in domain.
Function: every
Argument: vowel?
Argument: taxmax
Argument(s) not in domain.
Function: keep
Argument: vowel?
Argument: taxmax

The result is: aa

Function: not
Argument: asd
Argument(s) not in domain.
Function: number-of-arguments
Argument: not

The result is: 1

Function: not
Argument: 12
Argument(s) not in domain.
Function: not
Argument: every
Argument(s) not in domain.
Function: not
Argument: member?
Argument(s) not in domain.
Function: number-of-arguments
Argument: number-of-arguments

The result is: 1

Function: standard-deviation
Sorry, that's not a function.
Function: log
Argument: 1

The result is: 0

Function: log
Argument: 2

The result is: 0.6931471805599453

Function: floor
Argument: 1

The result is: 1

Function: floor
Argument: 1.7

The result is: 1.0

Function: floor
Argument: 2.1

The result is: 2.0

Function: expt
Argument: 2
Argument: 1

The result is: 2

Function: expt
Argument: 2
Argument: -2

The result is: 1/4

Function: expt
Argument: 2
Argument: 7

The result is: 128

Function: number-of-arguments
Argument: expt

The result is: 2


|#