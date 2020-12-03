i:read0 `s.txt
ni:14 _ -1 _ {ssr[x;"\\cf2 ";""]}'[i]
nii:{ssr[x;"\\";""]}'[ni]
n0:{ssr[x;"#";"X"]}'[nii]
n1:{ssr[x;".";"O"]}'[n0]
n2:{`$x}''[n1]

/This is UGLY and needs to be rewritten
/How to put matrices side by side instead of top to bottom?
t:([]a:n2)
t:update aa:{[a;b;c;d;e;f]a,b,c,d,e,f}'[a;a;a;a;a;a] from t
t:update fa:{x,y}'[aa;aa] from t
t:update ffa:{x,y}'[fa;fa] from t
t:update ffaa:{x,y}'[ffa;ffa] from t
t:update xfaa:{x,y}'[ffaa;ffaa] from t
n3:t[;`xfaa]

-1"Part 1";
step:{fc:{3 _ x}'[n3];
  fc::1 _ fc;
  count fc;
  nn,:1#fc 0;
  if[` in nn;show count fc];
  if[1~count fc;gnn:count each group nn;tree::last value gnn];
  if[not 1~count fc;n3::fc;step[]]
 }
step[]
-1"Total trees";
show tree

-1"Part 2";
/How to not call t[;`xfaa] everytime we want fresh data?
/How to write as a single function?

n11:t[;`xfaa]
s11:{fc11:{1 _ x}'[n11];
  fc11::1 _ fc11;
  nn11,:1#fc11 0;
  if[` in nn11;show count fc11];
  if[1~count fc11;gnn11:count each group nn11;tree11::last value gnn11];
  if[not 1~count fc11;n11::fc11;s11[]]
 }

n51:t[;`xfaa]
s51:{fc51:{5 _ x}'[n51];
  fc51::1 _ fc51;
  count fc51;
  nn51,:1#fc51 0;
  if[` in nn51;show count fc51];
  if[1~count fc51;gnn51:count each group nn51;tree51::last value gnn51];
  if[not 1~count fc51;n51::fc51;s51[]]
 }

n71:t[;`xfaa]
s71:{fc71:{7 _ x}'[n71];
  fc71::1 _ fc71;
  count fc71;
  nn71,:1#fc71 0;
  if[` in nn71;show count fc71];
  if[1~count fc71;gnn71:count each group nn71;tree71::last value gnn71];
  if[not 1~count fc71;n71::fc71;s71[]]
 }

n12:t[;`xfaa]
s12:{fc12:{1 _ x}'[n12];
  fc12::2 _ fc12;
  count fc12;
  nn12,:1#fc12 0;
  if[` in nn12;show count fc12];
  if[1~count fc12;gnn12:count each group nn12;tree12::last value gnn12];
  if[not 1~count fc12;n12::fc12;s12[]]
 }

mT:{s11[];s51[];s71[];s12[];}
\ts mT[]

-1"Total trees";
show tree*tree11*tree51*tree71*tree12
