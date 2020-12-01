i:read0 `$"1.txt"
t:([]a:"J"${-1_x}'[i])
tt:select from t where not null a

wn:raze{x+exec a from tt}'[tt[;`a]]
wnn:{x+exec a from tt}'[tt[;`a]]
n:wn?2020
n1:floor n%(count tt)
mn:wnn n1
n2:(raze mn)?2020
0N!ans:(exec a from tt where i=n1)*(exec a from tt where i=n2);
