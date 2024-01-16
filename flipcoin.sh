flip=$((RANDOM%2))

if [ $flip -eq '1' ]
then
        echo "It is a Head"
else
        echo "It is a Tail"
fi
