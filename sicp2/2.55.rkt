#lang sicp

(car ''abracadabra)

; ''abracadabra is the same as (quote (quote bracadabra))
; as quote is a special form, it is evaluated before expressions and in left to right order
; so ''abracadabra is the same as '(quote abracadabra) or more understandable
; (list 'quote 'abracadabra)
