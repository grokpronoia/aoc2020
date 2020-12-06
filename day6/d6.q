/Part 1 - splayed
i:read0 `6.txt
ii:12 _ -1 _ i
si:{ssr[x;"\\";""]}'[ii]
gs:" "vs'si
rgs:raze gs
trgs:{$[""~x;x::"123";x]}'[rgs]
str:"," sv trgs
vtr:",123," vs str
vstr:","vs'vtr
rstr:raze each vstr
sum{count distinct x}'[rstr]
/Part 2 - splayed
cvstr:count each vstr
sum{count where(count each group x)=y}'[rstr;cvstr]
-1"Part 1 - function.";
p1:{0N!sum{count distinct x}'[raze each ","vs'",123," vs "," sv {$[""~x;x::"123";x]}'[raze " "vs'{ssr[x;"\\";""]}'[12 _ -1 _ i]]]
 }
\ts p1[]
-1"Part 2 - function.";
p2:{0N!sum{count where(count each group x)=y}'[[raze each ","vs'",123," vs "," sv {$[""~x;x::"123";x]}'[raze " "vs'{ssr[x;"\\";""]}'[12 _ -1 _ i]]];count each ","vs'",123," vs "," sv {$[""~x;x::"123";x]}'[raze " "vs'{ssr[x;"\\";""]}'[12 _ -1 _ i]]]
 }
\ts p2[]
