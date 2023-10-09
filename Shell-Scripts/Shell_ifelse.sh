#Script must take multiple users as input
#Username should start with alphabet
#generate random password with complexity
#user must change the password on first log in

#!/bin/bash
USERS=$@
if [ $# -gt 0 ]; then
    for USERNAME in $USERS; do
        if [[ $USERNAME =~ ^[a-zA-Z]+$ ]]; then
            EXUSER=$(cat /etc/passwd | grep -w $USERNAME | cut -d ":" -f1)
            if [ "$USERNAME" = "$EXUSER" ]; then
                echo "User already Exists"
            else
                SPEC= $(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
                PASSWORD=INDIA@${RANDOM}${SPEC}
                echo "$USERNAME Sucessfully created"
                useradd -m $USERNAME
                echo "${USERNAME}:${PASSWOED}" | chpasswd
                passwd -e ${USERNAME}
                echo "USERNAME is ${USERNAME} Password is ${PASSWORD}"
            fi
        else
            echo "Invalid Input"
        fi
    done
else
    echo "Provide some input as you gave given $# parameters"
fi
