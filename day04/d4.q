/reading & formatting
i:read0 `4.txt
si:30 _ i 9
fi:10 _ i
ei:(enlist si), fi
spi:-1 _ {ssr[x;"\\";""]}'[ei]

/
/4.1 - splayed
gs:" "vs'spi
rgs:raze gs
trgs:{$[""~x;x::"xyz";x]}'[rgs]
str:"," sv trgs
vtr:",xyz," vs str
vstr:","vs'vtr
kv:":"vs''vstr
k:raze each{`$1#x}''[kv]
v:raze each{-1#x}''[kv]
count where {$[8=count x;1b;(7=count x)and(not any `cid in/: x);1b;0b]}'[k]
\

/4.1 - joined
vpp:{kv::":"vs''(","vs'",xyz,"vs "," sv {$[""~x;x::"xyz";x]}'[raze " "vs'-1 _ {ssr[x;"\\";""]}'[(enlist si), 10 _ i]]);
  k::raze each{`$1#x}''[kv];
  v:raze each{-1#x}''[kv];
  show count where {$[8=count x;1b;(7=count x)and(not any `cid in/: x);1b;0b]}'[k]
 }
\ts vpp[]

/4.2 - all valid
fkv:kv where {$[8=count x;1b;(7=count x)and(not any `cid in/: x);1b;0b]}'[k]
kk:raze each{`$1#x}''[fkv]
vv:raze each{-1#x}''[fkv]
z:{$[(x in `byr)and(4=count y)and(1920<=("J"$y))and(("J"$y)<=2002);1b;(x in `iyr)and(4=count y)and(2010<=("J"$y))and(("J"$y)<=2020);1b;(x in `eyr)and(4=count y)and(2020<=("J"$y))and(("J"$y)<=2030);1b;(x in `hgt)and(y like "*cm")and(150<=("J"$3#y))and(("J"$3#y)<=193);1b;(x in `hgt)and(y like "*in")and(59<=("J"$2#y))and(("J"$2#y)<=76);1b;(x in `hcl)and(7=count y)and(y like "#[0-9|a-f][0-9|a-f][0-9|a-f][0-9|a-f][0-9|a-f][0-9|a-f]");1b;(x in `ecl)and((`$y) in `amb`blu`brn`gry`grn`hzl`oth);1b;(x in `pid)and(9=count y);1b;(x in `cid)and(not null (`$y));1b;0b]}''[kk;vv]
show count where {all x}'[z]
