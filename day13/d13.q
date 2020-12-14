i:read0 `:13.txt
t:"J"$i 0
b:`$"," vs i 1
bb:b where {$[not x in `x;1b;0b]}'[b]
b:"J"$string bb
tt:([]time:til t*2)
update b37:`D from `tt where 0=time mod 37
update b41:`D from `tt where 0=time mod 41
update b587:`D from `tt where 0=time mod 587
update b13:`D from `tt where 0=time mod 13
update b19:`D from `tt where 0=time mod 19
update b23:`D from `tt where 0=time mod 23
update b29:`D from `tt where 0=time mod 29
update b733:`D from `tt where 0=time mod 733
update b17:`D from `tt where 0=time mod 17

select from tt where time within 1005516 1005536
