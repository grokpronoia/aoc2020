i:read0 `7.txt
ii:{-1 _ x}'[i]
ii:{ssr[x;" contain ";", "]}'[ii]
bi:{ssr[x;" bags";""]}'[ii]
bis:{ssr[x;" bag";""]}'[bi]
ji:{ssr[x;", ";","]}'[bis]
di:{ssr[x;" ";"_"]}'[ji]
noa:{ssr[x;"no_other";""]}'[di]
a:","vs'noa

/joined the above
a:","vs'{ssr[x;"no_other";""]}'[{ssr[x;" ";"_"]}'[{ssr[x;", ";","]}'[{ssr[x;" bag";""]}'[{ssr[x;" bags";""]}'[{ssr[x;" contain ";", "]}'[{-1 _ x}'[i]]]]]]]

sb:`${1#x}'[a]
sbib:`${x}''[{2 _ x}''[{1 _ x}'[a]]]

cnt:count where {`shiny_gold in x}'[sbib]
wb:sb where {`shiny_gold in x}'[sbib]

step:{pcnt::count distinct wb;
  wb,:raze{sb where x[y] in/: sbib}'[wb;0];
  if[(count distinct wb)=pcnt;show count distinct wb];
  if[not(count distinct wb)=pcnt;step[]]
 }
\ts step[]

t:([]col:sb;bb:sbib;cnt:"J"${1#x}''[{1 _ x}'[a]])
sg:select from t where raze(col in `shiny_gold)
b:exec bb from sg
ct:exec cnt from sg
tc:ct

sg:raze{[x;y]x#select from t where raze(col in y)}'[ct;b]
b:raze raze{exec bb from x}'[sg]
b:b where {$[not x in `;1b;0b]}'[b]
ct:raze raze{exec cnt from x}'[sg]
ct:ct where {$[not x in 0N;1b;0b]}'[ct]
show sum raze tc,:raze ct
/if[0=count b;show sum raze tc,:raze cc]
/if[not 0=count bb;tc,:raze cc;step2[]]
