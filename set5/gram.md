expr -> expr call
expr -> expr property
expr -> IDENTIFIER
expr -> NUMBER

call -> "(" ")"
call -> "(" arguments ")"

property -> "." IDENTIFIER

arguments -> expr
arguments -> expr "," arguments