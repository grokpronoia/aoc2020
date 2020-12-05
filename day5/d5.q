/read txt data
i:read0 `5.txt
i:{ssr[x;"\\";""]}'[11 _ i]

/build the table to query
tt:([]a:i;fb:{7#x}'[raze each{x}''[i]];lr:{-3#x}'[raze each{x}''[i]])

/row by row
/this could be functionalized - add cnt for indexing x and dividing the cuts
n:til 128
n1:raze "i"${$[x[0]="F";"i"$1#64 cut n;"i"$-1#64 cut n]}'[tt[;`fb]]
n2:raze "i"${$[x[1]="F";"i"$1#32 cut y;"i"$-1#32 cut y]}'[tt[;`fb];n1]
n3:raze "i"${$[x[2]="F";"i"$1#16 cut y;"i"$-1#16 cut y]}'[tt[;`fb];n2]
n4:raze "i"${$[x[3]="F";"i"$1#8 cut y;"i"$-1#8 cut y]}'[tt[;`fb];n3]
n5:raze "i"${$[x[4]="F";"i"$1#4 cut y;"i"$-1#4 cut y]}'[tt[;`fb];n4]
n6:raze "i"${$[x[5]="F";"i"$1#2 cut y;"i"$-1#2 cut y]}'[tt[;`fb];n5]
n7:raze "i"${$[x[6]="F";"i"$1#1 cut y;"i"$-1#1 cut y]}'[tt[;`fb];n6]

/col by col
/could be functionalized same as above
nn:til 8
lr1:raze "i"${$[x[0]="L";"i"$1#4 cut nn;"i"$-1#4 cut nn]}'[tt[;`lr]]
lr2:raze "i"${$[x[1]="L";"i"$1#2 cut y;"i"$-1#2 cut y]}'[tt[;`lr];lr1]
lr3:raze "i"${$[x[2]="L";"i"$1#1 cut y;"i"$-1#1 cut y]}'[tt[;`lr];lr2]

/multiply each row by 8
n8:{8*x}'[n7]
/add in the cols and take the max value
max {x+y}'[n8;lr3]

/Part 2
r:n7
c:lr3

/where there are missing seats
rr:where(value count each group asc n7)<8
/where those seats aren't equal to min or max rows
g:rr where raze{raze(enlist "j"$min n7)<x}'[rr]
/what seats are avail in the row
cc:where (raze deltas asc c where rr[1]=raze r)>1
/what's the seat ID
(rr[1]*8)+(cc)
