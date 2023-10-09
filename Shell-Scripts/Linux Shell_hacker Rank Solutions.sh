#!/bin/bash
#Display the 2nd and 7th character from each line of text.
cut -c 2,7   #c is charcter

# Display a range of characters starting at the 2nd position of a string and ending at the 7th position (both positions included)
cut -c 2-7

#Given a tab delimited file with several columns (tsv format) print the first three fields.
cut -f 1-3  #f is field

#Print the characters from thirteenth position to the end.
cut -c 13-

# For each input sentence, identify and display its fourth word. Assume that the space (' ') is the only delimiter between words. 
cut -d " " -f 4

#The output should contain N lines. For each input sentence, identify and display its first three words. Assume that the space (' ') is the only delimiter between words.
cut -d " " -f 1-3

#Output the first 20 lines of the given text file. 
head -20

#Output the first 20 characters of the text file
head -c 20

#Display the lines (from line number 12 to 22, both inclusive) for the input file. 
head -22 | tail -11

#Output the text with all parentheses () replaced with box brackets []. 
tr "()" "[]"

#In a given fragment of text, delete all the lowercase characters a - z.
tr -d "a-z"

#Replace all sequences of multiple spaces with just one space.
tr -s ' '

#Output the text file with the lines reordered in reverse lexicographical order. 
sort -r

#Output the text file with the lines reordered in reverse lexicographical order. 
sort -n

sort -n -r #descending order

lines (2 sloc)  218 Bytes

#Rearrange the rows of the table in descending order of the values for the average temperature in January (i.e, the mean temperature value provided in the second column) in a tab seperated file. 
sort -k2 -n -r -t$'\t'

#command to eliminate consecutive repetitions of a line when a text file is piped through it.Given a text file, remove the consecutive repetitions of any line.>>
uniq

#Given a text file, count the number of times each line repeats itself. Only consider consecutive repetitions. Display the space separated count and line, respectively. There shouldn't be any leading or trailing spaces. Please note that the uniq -c command by itself will generate the output in a different format than the one expected here. 
uniq -c | cut -c7- 

#compare consecutive lines in a case insensitive manner. So, if a line X is followed by case variants, the output should count all of them as the same (but display only the form X in the second column).
uniq -i -c | cut -c7-

#Given a text file, display only those lines which are not followed or preceded by identical replications. 
uniq -u

# Replace the newlines in the input file with semicolons
paste -d";" -s

# Restructure the file in such a way, that every group of three consecutive rows are folded into one, and separated by tab. 
paste - - -

#Restructure the file so that three consecutive rows are folded into one line and are separated by semicolons. 
paste -d ";" - - -

# Given a list of countries, each on a new line, your task is to read them into an array. Then slice the array and display only the elements lying between positions 3 and 7, both inclusive. Indexing starts from from 0.
arr=($(cat))
echo ${arr[@]:3:5}

# You are given a list of countries, each on a new line. Your task is to read them into an array and then filter out (remove) all the names containing the letter 'a' or 'A'.
arr=($(cat))
echo ${arr[@]/*[aA]*/}

#Given a list of countries, each on a new line, your task is to read them into an array. Then, concatenate the array with itself (twice) - so that you have a total of three repetitions of the original array - and then display the entire concatenated array, with a space between each of the countries' names
arr=($(cat))
arr=("${arr[@]}" "${arr[@]}" "${arr[@]}")
echo ${arr[@]}

# Given a list of countries, each on a new line, your task is to read them into an array and then display the element indexed at . Note that indexing starts from 0.
arr=($(cat))
echo ${arr[3]}

#Given a list of countries, each on a new line, your task is to read them into an array and then display the count of elements in that array.
arr=($(cat))
echo ${#arr[@]}

#You are given a list of countries, each on a new line. Your task is to read them into an array and then transform them in the following way:The first capital letter (if present) in each element of the array should be replaced with a dot ('.'). Then, display the entire array with a space between each country's names.
arr=($(cat))
echo ${arr[@]/[A-Z]/.}

#There are N integers in an array A. All but one integer occur in pairs. Your task is to find the number that occurs only once
read
arr=($(cat)) 
echo "${arr[@]}" | tr ' ' '\n' |sort | uniq -u | tr '\n' ' '

#looping and Skipping
#!/bin/bash
for i in {1..99..2}
do
    echo $i    
done
#awk 
awk 'END{ if((NR%2)) print p ";" }!(NR%2){ print p ";" $0 }{ p = $0 }'

grep -w "the"

grep -iw "the"  #case insensitive

# Only display those lines that do NOT contain the word 'that'. The relative ordering of the lines should be the same as it was in the input file.

grep -iv "that"

#We retain only those lines which have at least one of the following words: 
# the 
# that 
# then 
# those
grep -iwe "the\|that\|then\|those"

#Consecutively repeated digits
grep '\([0-9]\) *\1'

#sed command
sed -e 's/the /this /1'
sed -e 's/thy /your /gI'
sed -e 's/thy/{&}/gI'
#Given  lines of credit card numbers, mask the first  digits of each credit card number with an asterisk (i.e., *) and print the masked card number on a new line. Each credit card number consists of four space-separated groups of four digits. For example, the
# credit card number 1234 5678 9101 1234 would be masked and printed as **** **** **** 1234.
sed -r 's/[0-9]{4}[ ]/**** /g'

sed -E 's/([0-9]{4}) ([0-9]{4}) ([0-9]{4}) ([0-9]{4})/\4 \3 \2 \1 /g'

#For each student, if one or more of the three scores is missing, display:
awk '{ if(length($4) == 0) print "Not all scores are available for " $1 }'

#pass or fail
awk '{ print $1 ($2 < 50 || $3 < 50 || $4 < 50 ? " : Fail" : " : Pass") }'
awk '{ total=$2+$3+$4; avg=total/3; print $0 " : " (avg > 50 ? avg > 60 ? avg > 80 ? "A" : "B" : "C" : "FAIL"); }'

#Given a list of countries, each on a new line, your task is to read them into an array and then display the entire array, with a space between each of the countries' names.
while read line
do
    arr=(${arr[@]} $line)
done

echo ${arr[@]}