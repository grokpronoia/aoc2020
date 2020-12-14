i:read0 `8.txt
ii:{ssr[x;"+";""]}'[i]
ni:" "vs'ii
t:([]a:`$ni[;0];b:ni[;1])
update c:string i from `t

acc::0
nn::0
ui::(count t)+1000

-1"Part 8.1";
step:{if[-7h=type nn;a::{select from t where i=x}[nn]];
 if[7h=type nn;a::{select from t where i="J"$raze x}[nn]];
  old::"J"$raze 1#a[;`c];
  0N!new::"J"$raze 1#a[;`b];
  if[old in ui;show acc;acc::0;nn::0;ui::(count t)+1;:show "STOP"];
  if[a[;`a]~raze `acc;acc::acc+("J"$raze a[;`b])];
  if[(a[;`a]~raze `nop)or(a[;`a]~raze `acc);nn::nn+1];
  if[a[;`a]~raze `jmp;nn::nn+new];
  if[not old in ui;ui::ui, old;step[]]
 }
\t step[]

r:.z.T
code:read0`:8.txt;
reset:{vis::count[code]#0;acc::0};
cpu:{[pc]vis[pc]:1;$["nop"~op:3#i:code[pc];pc+1;"acc"~op;[acc+::get"0",4_i;pc+1];pc+get"0",4_i]};
reset`;{not vis x}cpu/0;
acc
r:.z.T-r

-1"Part 8.2";
/Kept getting 'stack errors on recursive function calls
/How to code to avoid this in the future?

/ji::exec i from t where a in `jmp
ji::81 _ exec i from t where a in `jmp
fj:first ji
ni::exec i from t where a in `nop
fn:first ni
la:"J"$raze exec c from last t

rJ:{if[(0=nn)and(`jmp in aa::exec a from t where i=fj);acc::0;ui::(count t)+1;-1"**FIRST UPDATE**";0N!fj::first ji;-1"**BEFORE UPDATE**";0N!select from t where i=fj;update a:`nop from `t where i=fj;-1"**AFTER UPDATE**";0N!select from t where i=fj;tS[]];
 }

rN:{if[(0=nn)and(`nop in aa::exec a from t where i=fn);acc::0;ui::(count t)+1;-1"**FIRST UPDATE**";0N!fn::first ni;-1"**BEFORE UPDATE**";0N!select from t where i=fn;update a:`jmp from `t where i=fn;-1"**AFTER UPDATE**";0N!select from t where i=fn;tS[]];
 }

tS:{if[-7h=type nn;a:{select from t where i=x}[nn]];
  if[7h=type nn;a:{select from t where i="J"$raze x}[nn]];
  0N!old:"J"$raze 1#a[;`c];
  0N!new:"J"$raze 1#a[;`b];
  if[old in la;-1"**FOUND AN ANSWER**";:show acc];
  if[0=(count ni); '"no more nop"];
  if[old in ui;-1"**RESTARTING CYCLE**";0N!count ui;0N!ji::1 _ ji;0N!nn::0;0N!old;0N!ui;-1"**REVERTING UPDATES**";update a:aa from `t where i=fj;0N!select from t where i=fj;rJ[]];
  if[a[;`a]~raze `acc;acc::acc+("J"$raze a[;`b])];
  if[(a[;`a]~raze `nop)or(a[;`a]~raze `acc);nn::nn+1];
  if[a[;`a]~raze `jmp;nn::nn+new];
  if[(not old in ui)or(old in la);ui::ui,old;tS[]];
 }
