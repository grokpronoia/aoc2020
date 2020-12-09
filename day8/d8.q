\c 2000 2000
i:read0 `8.txt
ii:{ssr[x;"+";""]}'[i]
ni:" "vs'ii
t:([]a:`$ni[;0];b:ni[;1])
update c:string i from `t

acc::0
nn::0
ui::(count t)+1000

/Part 8.1
step:{if[-7h=type nn;a::{select from t where i=x}[nn]];
 if[7h=type nn;a::{select from t where i="J"$raze x}[nn]];
  old::"J"$raze 1#a[;`c];
  0N!new::"J"$raze 1#a[;`b];
  if[old in ui;show acc;show "Stop!"];
  if[a[;`a]~raze `acc;acc::acc+("J"$raze a[;`b])];
  if[(a[;`a]~raze `nop)or(a[;`a]~raze `acc);nn::nn+1];
  if[a[;`a]~raze `jmp;nn::nn+new];
  if[not old in ui;ui::ui, old;step[]]
 }

/Part 8.2
/Kept getting 'stack errors on recursive function calls
/Need to get more q'bie with recursion - use .z.s and over (/)
/The solution was in `jmp - rJ

ni::exec i from t where a in `nop
la:"J"$raze exec c from last t
acc::0
nn::0
ui::(count t)+1
fn:first ni

rN:{if[(0=nn)and(`nop in aa::exec a from t where i=fn);acc::0;ui::(count t)+1;-1"**FIRST UPDATE**";0N!fn::first ni;-1"**BEFORE UPDATE**";0N!select from t where i=fn;update a:`jmp from `t where i=fn;-1"**AFTER UPDATE**";0N!select from t where i=fn;tS[]];
 }

/Had to slice up the list and run in batches of 11 - 12 items at a time otherwise hit 'stack errors
/How to code to avoid this in the future?
ji::81 _ exec i from t where a in `jmp
la:"J"$raze exec c from last t
acc::0
nn::0
ui::(count t)+1
fj:first ji

rJ:{if[(0=nn)and(`jmp in aa::exec a from t where i=fj);acc::0;ui::(count t)+1;-1"**FIRST UPDATE**";0N!fj::first ji;-1"**BEFORE UPDATE**";0N!select from t where i=fj;update a:`nop from `t where i=fj;-1"**AFTER UPDATE**";0N!select from t where i=fj;tS[]];
 }

tS:{if[-7h=type nn;a:{select from t where i=x}[nn]];
  if[7h=type nn;a:{select from t where i="J"$raze x}[nn]];

  0N!old:"J"$raze 1#a[;`c];
  0N!new:"J"$raze 1#a[;`b];

  if[old in la;-1"**FOUND AN ANSWER**";show acc; '"ANSWER!"];
  if[0=(count ni); '"no more nop"];
  if[old in ui;-1"**RESTARTING CYCLE**";0N!count ui;0N!ji::1 _ ji;0N!nn::0;0N!old;0N!ui;-1"**REVERTING UPDATES**";update a:aa from `t where i=fj;0N!select from t where i=fj;rJ[]];
  if[a[;`a]~raze `acc;acc::acc+("J"$raze a[;`b])];
  if[(a[;`a]~raze `nop)or(a[;`a]~raze `acc);nn::nn+1];
  if[a[;`a]~raze `jmp;nn::nn+new];
  if[(not old in ui)or(old in la);ui::ui,old;tS[]];
 }
