i:read0 `$"1.txt"
t:([]a:"J"${-1_x}'[i])
tt:select from t where not null a

/1.1 - find the 2 numbers in list that equal 2020
st:.z.T
wn:raze{x+exec a from tt}'[tt[;`a]]
wnn:{x+exec a from tt}'[tt[;`a]]
n:wn?2020
n1:floor n%(count tt)
mn:wnn n1
n2:(raze mn)?2020
ans:(exec a from tt where i=n1)*(exec a from tt where i=n2)
rtt:.z.T-st
rtt

/1.1 - another way
\ts show(*) over ((*) over "j"$(1#a where {$[2020 in x;1b;0b]}'[sum each a::(cross/)(tt[;`a];tt[`a])]))

/1.2 - find the 3 numbers in list that equal 2020
\ts show(*) over ((*) over "j"$(1#a where {$[2020 in x;1b;0b]}'[sum each a::(cross/)(tt[;`a];tt[`a];tt[;`a])]))
