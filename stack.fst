module Stack
	open IO
	open List

type stack 'a =
	| Empty : stack 'a
	| NEmpty : top:'a -> bottom: stack 'a -> stack 'a

val size: stack 'a -> Tot nat
let rec size s = match s with
	| Empty -> 0
	| NEmpty t b -> 1 + size b

exception EmptyStack
val pop: s:stack 'a{size s > 0} -> 'a
let pop s = match s with
	| Empty -> raise EmptyStack
	| NEmpty t b -> t

val push: 'a -> stack 'a -> stack 'a
let push e s = match s with
	| Empty -> NEmpty e s
	| NEmpty t b -> NEmpty e (NEmpty t b)

let empty = Empty
