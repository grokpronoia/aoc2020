/Part 10.1
\ts (*) over count each value group deltas asc "J"$read0 `10.txt

/Part 10.2
/Recursion is incorrect! Need another level...
ai::0,asc ii,(3+max ii)
all {$[x<=3;1b;0b]}'[key group deltas ai]

/ai::0 1 4 5 6 7 10 11 12 15 16 19 22
/ai::asc 28 33 18 42 31 14 46 20 48 47 24 23 49 45 19 38 39 11 1 32 25 35 8 17 7 9 4 2 34 10 3

countA:count ai
itC::2
iC::2
tF::1
tA::2
tC::1
ii::0

tt:{-1"Trying combos";
  indexCut:iC cut ai;
  loseLast:-1 _ raze 1#indexCut;
  takeFirst:tF#raze 1#indexCut;
  if[itC=(countA-1);-1"**TOTAL COUNT**";0N!tC;:-1"ENDING CYCLE";];
  if[(iC=(countA-2))or(0=(count (takeFirst,raze 1 _ indexCut)));-1"**MOVING TO NEXT ITEM IN LIST**";-1"**ii**";0N!ii::1+ii;-1"**iitC**";0N!itC::1+itC;-1"**iC**";0N!iC::itC;-1"**tF**";0N!tF::1+tF;-1"**tA**";0N!tA::1+tA;tt[]];
  if[(count loseLast)<=2;-1"Nothing else to take"];
  if[3<=(count loseLast);-1"**UPDATING loseLast**";takeFirst,:tA _ loseLast];
  -1"**EVALUATE THIS ROW**";
  0N!takeFirst,raze 1 _ indexCut;
  0N!deltas takeFirst,raze 1 _ indexCut;
  if[all {$[x<=3;1b;0b]}'[deltas takeFirst,raze 1 _ indexCut];-1"**UPDATING COUNT**";tC::tC+1;sH,::enlist(takeFirst,raze 1 _ indexCut)];
  if[(iC<(countA-2))or(0<(count (takeFirst,raze 1 _ indexCut)));-1"**INCREMENT iC**";0N!iC::1+iC;tt[]] 
 }
\

/10.2 - Solution from mkst
/https://github.com/mkst/aoc/blob/master/2020/10.q
prd {1+sum til x} each count each "3" vs raze string d:deltas asc "J"$read0 `:10.txt

