
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

echo "give choice for 1-Flip, 2-cehck singlet"
read choice

case $choice  in 
	1)
	flip
	;;

	2)
	checksinglet
	;;

	*)
	echo "invalid input"
	;;
esac
