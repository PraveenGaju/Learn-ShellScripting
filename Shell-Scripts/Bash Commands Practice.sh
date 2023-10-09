#Looping withh numbers
#!/bin/bash
for i in {1..50}
do
echo "$i"
done

#World of numbers
#!/bin/bash
read X
read Y
echo $((X+Y))
echo $((X-Y))
echo $((X*Y))
echo $((X/Y))

#Comparing Numbers
#!/bin/bash
#!/bin/bash
read X
read Y
if (( $X > $Y ))
then
    echo "X is greater than Y"
fi

if (( $X == $Y))
then
    echo "X is equal to Y"
fi

if(( $X < $Y))
then
    echo "X is less than Y"
fi

#Conditional
read w
if [[($w == 'y') || ($w == 'Y')]]
then
     echo "YES"
     elif [[($w == 'n') || ($w == 'N')]]
     then
     echo "NO"
fi

#more on Coditionals
#!/bin/bash
read x
read y
read z
if (( ($x == $y) && ($y == $z) ))
then
echo "EQUILATERAL"
elif (( ($x == $y) || ($y == $z) || ($x == $z) ))
then
echo "ISOSCELES"
else
echo "SCALENE"
fi

#Arithmetic Operations
read x
printf "%.3f\n" `echo "$x" | bc -l` #bc is bash calculator

#Compute the average
#!/bin/bash
read num
ctr=$num
sum=0
while [ $ctr -gt 0 ]
do
   read x
   sum=$((sum + x))
   ctr=$((ctr - 1))     
done
printf "%.3f\n" `echo "$sum/$num" | bc -l`

#recursive tree
# d - depth
# l = length
# r = row
# c = column

declare -A a

f() {
    local d=$1 l=$2 r=$3 c=$4
    [[ $d -eq 0 ]] && return
    for ((i=l; i; i--)); do
        a[$((r-i)).$c]=1
    done
    ((r -= l))
    for ((i=l; i; i--)); do
        a[$((r-i)).$((c-i))]=1
        a[$((r-i)).$((c+i))]=1
    done
    f $((d-1)) $((l/2)) $((r-l)) $((c-l))
    f $((d-1)) $((l/2)) $((r-l)) $((c+l))
}
read n
f $n 16 63 49
for ((i=0; i<63; i++)); do
    for ((j=0; j<100; j++)); do
        if [[ ${a[$i.$j]} ]]; then
            printf 1
        else
            printf _
        fi
    done
    echo
done