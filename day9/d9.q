i:read0 `9.txt
ii:"J"$i
ct:{-1#26#x}

step:{-1"Take 5";
  p::distinct sum each (25#ii) cross (25#ii);
  n::ct ii;
  if[not ("J"$raze string n) in p;0N!n];
  if[("J"$raze string n) in p;ii::1 _ ii;step[]]
 }
/\ts step[]

ans::"J"$raze string n
step2:{-1"Tally XMAS";
 if[ans in pp::sum each (,\)ii;pp where pp in ans;cc::(,\)ii;0N!{(first asc cc x)+(last asc cc x)}["J"$raze string where pp in ans]];
 if[not ans in pp::sum each (,\)ii;-1"Subtracting 1 from ii";ii::1 _ ii;step2[]];
 }
/\ts step2[]
