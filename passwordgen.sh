#!/bin/bash

echo -e "\e[32mWelcome to Password generator\e[0m"
echo -e "\e[32mPlease enter a random number\e[0m"

read num
password=" "
alpha=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")
random_gen () {
        for i in $(seq 1 $num)
        do
        rand="$(($RANDOM % 26))"

        if [[ $(($rand % 2)) == 0 ]]; then
                password=$password"${alpha[$rand]}""$rand"

        else
                password=$password"${alpha[$rand]}"
        fi
        done
}
random_gen
echo -e "\e[31mHere's Your password - $password\e[0m"
