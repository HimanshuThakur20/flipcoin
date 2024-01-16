
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



# UC4

function triplet (){

declare -A arr

echo "enter upto how many iterations you want to do for doublets:"
read itr

for ((i=0;i<$itr;i++));
do
        flip1=$((RANDOM%2))
        flip2=$((RANDOM%2))
	flip3=$((RANDOM%2))

case "$flip1$flip2$flip3" in

        000)
        triplet="TTT"
        ;;
        001)
        triplet="TTH"
        ;;
        010)
        triplet="THT"
        ;;
	100)
        triplet="HTT"
        ;;
        011)
        triplet="THH"
        ;;
	101)
        triplet="HTH"
        ;;
        110)
        triplet="HHT"
        ;;
        111)
        triplet="HHH"
        ;;

        *)
        echo "invalid input"
        ;;
esac

((arr[$triplet]++))

done

for combination in HHH HHT HTH THH HTT THT TTH TTT;
do
        percentage=$(( (arr["$combination"] * 100) / itr))
         echo "$combination: $percentage%"

done
}



#UC5

function winningCombination(){

echo "enter upto how many iterations you want to do for doublets:"
read num_iterations

declare -A counts_singlet counts_doublet counts_triplet

for ((i = 0; i < num_iterations; i++)); do

    toss1=$((RANDOM % 2))
    toss2=$((RANDOM % 2))
    toss3=$((RANDOM % 2))

    singlet=""
    doublet=""
    triplet=""

    case $toss1 in
        0) singlet+="H";;
        1) singlet+="T";;
    esac

    case $toss2 in
        0) doublet+="H";;
        1) doublet+="T";;
    esac

    case $toss3 in
        0) doublet+="H"; triplet+="H";;
        1) doublet+="T"; triplet+="T";;
    esac


    ((counts_singlet[$singlet]++))
    ((counts_doublet[$doublet]++))
    ((counts_triplet[$triplet]++))
done


find_winning_combination() {
    local -n counts=$1
    local winning_combination
    local max_count=0

    for combination in "${!counts[@]}"; do
        count=${counts[$combination]}
        if ((count > max_count)); then
            max_count=$count
            winning_combination=$combination
        fi
    done

    echo "$winning_combination"
}

winning_singlet=$(find_winning_combination counts_singlet)
winning_doublet=$(find_winning_combination counts_doublet)
winning_triplet=$(find_winning_combination counts_triplet)

echo "Winning Singlet Combination: $winning_singlet"
echo "Winning Doublet Combination: $winning_doublet"
echo "Winning Triplet Combination: $winning_triplet"

}

echo "give choice for 1-Flip, 2-cehck singlet, 3-doublets, 4-triplets, 5-winning compositions"
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

	4)
	triplet
	;;

	5)
	winningCombination
	;;

	*)
	echo "invalid input"
	;;
esac
