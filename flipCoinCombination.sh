echo "Enter the number of Flips: " 
read no_of_flips
declare -A singlet_frequency=( 

                            [H]=0
                            [T]=0

                              )
for(( flip = 1; flip <= no_of_flips; flip++ ))
do
    echo -n "flip $flip "
    (( toss = RANDOM % 2 ))
    case $toss in 
        0)
            echo "Heads"
            (( singlet_frequency[H]++ ))
            ;;
        1)
            echo "Tails"
            (( singlet_frequency[T]++ ))
    esac
done

for combination in ${!singlet_frequency[@]}
do
    percentage=$(( ${singlet_frequency[$combination]}  * 100 / no_of_flips ))
    singlet_frequency[$combination]=$percentage
    echo "Percentage of $combination is ${singlet_frequency[$combination]}%"   
done
