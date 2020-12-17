i:read0 `:16.txt
/Part 16.1
oi:"J"$" "vs'{ssr[x;"-";" "]}'[raze "," vs'{ssr[x;" or ";","]}'[1 _ '(raze each -1#'":"vs'20#i)]]
nt:"J"$raze"," vs'25 _ i
sum nt where{$[any x within/: oi;1b;0b]}'[nt]=0


dis:nt where{$[any x within/: oi;1b;0b]}'[nt]=0
ent:"J"$"," vs'25 _ i
de:not dis in/:ent
ri:ent where {$[all x;1b;0b]}'[de]

