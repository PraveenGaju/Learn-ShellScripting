echo hello world

#color syntax
#echo -e "\e[COLm Message \e[0m"
# echo -e -> enable colors from echo command
# \e[COLm -> enable a particular color

# Colors  codes
# Red       31
# Green     32
# Yellow    33
# Blue      34
# Magenta   35
# Cyan      36

# \e[0m -> Zero code is going to reset the color, Meaning if we enable color for sure we need to disable it, otherwise the color will continue on screen.

echo "\e[31m Hello world in Red Color \e[0m"