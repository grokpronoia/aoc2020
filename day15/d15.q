i:6,4,12,1,20,0,16
di:(`u#1+til(count i))!i

/Part 15.1
step:{
  if[1=(count where ("J"$raze string -1#value di)=di);di[1+-1#key di]:0];
  if[1<(count where ("J"$raze string -1#value di)=di);di[1+-1#key di]:((last -2#where ("J"$raze string -1#value di)=di)-(first -2#where ("J"$raze string -1#value di)=di))];
  if[20=count di;:0N!value di];
  if[count di<20;.z.s step]
 }

/Part 15.1 - a better way
last(2020>count@){x,neg(-).-2#where x=last x}/i

