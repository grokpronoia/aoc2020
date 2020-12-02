i:read0 `2.txt
tt:select from t:([]a:i) where a like "[0-9]*"
update a:" " vs'{ssr[x;":";""]}'[tt[;`a]] from `tt;

-1"1 - Where character count is greater than or equal to n1 and less than or equal to n2.";
update n:"I"$" " vs'{ssr[x;"-";" "]}'[tt[;`a][;0]], c:`$tt[;`a][;1], p:{`$'x}'[string {ssr[x;"\\";""]}'[tt[;`a][;2]]] from `tt;
tt:select n1:tt[;`n;0],n2:tt[;`n;1],c,p from tt;
gp:{count each group x}'[tt[;`p]]
tn:{x[y]}'[gp;tt[;`c]]
count where {$[(x<=y)and(y<=z);1b;0b]}'[tt[;`n1];tn;tt[;`n2]]

-1"2 - where character is in position n1 or n2, but not both n1 and n2.";
cx:enlist each tt[;`c]
fn:{-1#x#y}'[tt[;`n1];tt[;`p]]
sn:{-1#x#y}'[tt[;`n2];tt[;`p]]
count where {$[((x~y)and(not x~z))or((not x~y)and(x~z));1b;0b]}'[cx;fn;sn]
