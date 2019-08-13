#!/bin/bash
user_id=$1
service_id=$2
output="/home/dl-plateform/data/${user_id}/${service_id}/output"
echo>"${output}/log"
curl -H "Content-Type:application/json" -H "Data_Type:msg" -X POST --data '{"user_id":"'${user_id}'","service_id":"'${service_id}'"}'  10.18.127.2:8081/inference&
echo "curl completed"
#tail -f "${output}/log"
#tail -f "${output}/log"|sed '/finished/q'
declare -i i=1
declare -i j=10
declare -i count=0
declare -i flag=0
echo "begin while"
while :
do 
   head -${j} ${output}/log | tail -n +${i}
   count=$[$(head -${j} ${output}/log | tail -n +${i} | grep -c "")]
   flag=$[$(head -${j} ${output}/log | tail -n +${i} | grep 'finished' -c)]
   #echo "flag is "$flag
   if [ $flag -gt 0 ] 
   then
     break
   fi
   #echo "i is", $i, "j is" ,$j
   i+=$count
   j+=$count
done
echo 'over'
