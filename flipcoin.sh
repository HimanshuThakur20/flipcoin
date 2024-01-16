
function flip(){
flip=$((RANDOM%2))

if [ $flip -eq '1' ]
then
        echo "It is a Head"
else
        echo "It is a Tail"
fi
}


#UC2

function checksinglet(){

echo "How many times you want to iterate"
read n

declare -a arr
count=0
for i in n ;
do
	flip=$((RANDOM%2))
	temp=$flip
	arr[$i]=$temp
	if [ $temp -eq 1 ]
	then
		((count++))
	fi
done

percentHead=$(($count*100/$n))
percent='100'
percentageTail=$((percent-percentageHead))
echo "Percentage of heads is $percentHead and percentage of tail is $percentageTail"
}


#UC3

function doublet (){
declare -A arr

echo "enter upto how many iterations you want to do for doublets:"
read itr

for ((i=0;i<$itr;i++));
do
	flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))

case "$flip1$flip2" in

	00)
	doublet="TT"
	;;
	01)
	doublet="TH"
	;;
	10)
	doublet="HT"
	;;
	11)
	doublet="HH"
	;;
	*)
	echo "invalid input"
	;;
esac

((arr[$doublet]++))

done


for combination in HH HT TH TT;
do
	percentage=$(( (arr["$combination"] * 100) / itr))
	 echo "$combination: $percentage%"

done
}


echo "give choice for 1-Flip, 2-cehck singlet, 3-doublets"
read choice

case $choice  in 
	1)
	flip
	;;

	2)
	checksinglet
	;;

	3)
	doublet
	;;

	*)
	echo "invalid input"
	;;
esac
