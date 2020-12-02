i:read0 `$"1.txt"
tt:select from t:([]a:"J"${-1_x}'[i]) where not null a

/1.1 - find the 2 numbers in list that equal 2020
-1"Solution 1.1...";
cs1:{wn:raze{x+exec a from tt}'[tt[;`a]];
  wnn:{x+exec a from tt}'[tt[;`a]];
  n:wn?2020;
  n1:floor n%(count tt);
  mn:wnn n1;
  n2:(raze mn)?2020;
  show enlist ans:(exec a from tt where i=n1)*(exec a from tt where i=n2)
 }
\ts cs1[]

/combinging all of the above in 2 lines
-1"Combined Solution 1.1...";
cs11:{wn::raze{x+exec a from tt}'[tt[;`a]];
  show enlist ans:(exec a from tt where i=(floor (wn?2020)%(count tt)))*(exec a from tt where i=(raze{x+exec a from tt}'[tt[;`a]](floor (wn?2020)%(count tt)))?2020)
 }
\ts cs11[]

/1.1 - another way
-1"Let's do it another way 1.1...";
\ts show(*) over ((*) over "j"$(1#a where {$[2020 in x;1b;0b]}'[sum each a::(cross/)(tt[;`a];tt[`a])]))

/1.2 - find the 3 numbers in list that equal 2020
-1"Solution 1.2...";
\ts show(*) over ((*) over "j"$(1#a where {$[2020 in x;1b;0b]}'[sum each a::(cross/)(tt[;`a];tt[`a];tt[;`a])]))
