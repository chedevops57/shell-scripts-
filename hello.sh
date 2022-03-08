#!/bin/bash
echo hello world this is chenna
# this is just a primary shell script
#echo our shell is $BASH
#echo our shell version is $BASH_VERSION
#echo our home directory is $HOME
#echo our working directory is $PWD
#name= chenna
#echo the name is $name

#cal=calendar
#echo $cal



# taking input from the user
#echo "enter the names you want"
#read name1 name2 name3
#echo " entered name are :$name1 ,$name2,$name3"




#   using the flags -p and -s (silent)
#read -p 'username: ' user_var
#read -sp 'password: ' pass_var
#echo "username: $user_var"
#echo "password : $pass_var"


#-------------------------------------------------------------------


# storing multiple inputs in an array    -a represents the array data structure here
#echo "enter names: "
#read -a names
#echo "Names: ${names[0]}, ${names[1]}"
# here the -a flag gives you the array data structure


echo "Enter name: "
read 
echo "Name : $REPLY"

# passing an arguement to a arguement
echo $1 $2 $3 '>echo $1 $2 $3'


#passing arguments in the form of  array
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]} ${args[3]}
echo $@ #all args displayed
echo $# #number of args
#-------------------------------------------------------------------

# using if statement in script 

#if[condition]
#then 
#    statement
#fi

count=10
if [ $count -eq 10 ]
then
    echo " the condition is satisfied"
fi
#-----------------------------------------------------

# if else statements

echo " give a random number for comparision "
read count
if [ $count -gt 10 ]
then
    echo " the number is greater than 10 "
elif [ $count -lt 10 ]
then
    echo " the number is less tham 10"
else
    echo " the number is equal to 10"

fi

#----------------------------------------------------------------------------

# file test operations
# for file search use flag -f
echo -e " Enter the name of the file :\c  "
read file_name

if [ -e $file_name ]
then
        echo " $file_name found "
else
        echo " $file_name not found "
fi


# for directory search use flag -d

echo -e " Enter the name of the directory :\c  "
read dir_name

if [ -d $file_name ]
then
        echo " $file_name found "
else
        echo " $file_name not found "
fi


#other flags -b for block special file -c for character special 
# -s  checks the file is empty or not

echo -e " Enter the name of the directory :\c  "
read file_name

if [ -s $file_name ]
then
        echo "$file_name is not empty"
else
        echo "$file_name is  empty"
fi

# -r -w -x flags are used for permissions allowed on the file 




# append some text to the existing files

echo -e " Enter the name of the directory :\c  "
read file_name

if [ -f $file_name ]
then
    if [ -w $file_name ]
    then
        echo " type some text to append...to quit press ctrl+d."
        cat >> $file_name
    else
        echo " the file does not have write permissions"
    fi 
else
    echo "$file_name does not exists"
fi

#------------------------------------------------------------------------

# and operator with if conditional statement

echo -e "Enter the age please : "
read age
if [ "$age" -gt 18 ] && [ "$age" -lt 30]
then
    echo "you are eligible for the trip"
    else
    echo "you are not eligible for the trip"
fi

# also can use the -a flag

echo -e "Enter the age please :\c "
read age
if [ "$age" -gt 18 -a "$age" -lt 30 ]
then
    echo "you are eligible for the trip"
else
    echo "you are not eligible for the trip"
fi
# also u can use double brackets with &&
echo -e "Enter the age please :\c "
read age
if [[ "$age" -gt 18 && "$age" -lt 30 ]]
then
    echo "you are eligible for the trip"
else
    echo "you are not eligible for the trip"
fi
#-----------------------------------------------------------------

# or operator
echo -e "Enter the age please :\c "
read age
if [ "$age" -lt 18 ] || [ "$age" -gt 50 ]
then
    echo "you are not eligible for the trip"
else
    echo "you are  eligible for the trip"
fi



## or operator -o flag
echo -e "Enter the age please :\c "
read age
if [ "$age" -lt 18 -o "$age" -gt 50 ]
then
    echo "you are not eligible for the trip"
else
    echo "you are  eligible for the trip"
fi

# or operator with double brackets
echo -e "Enter the age please :\c "
read age
if [[ "$age" -lt 18  ||  "$age" -gt 50 ]]
then
    echo "you are not eligible for the trip"
else
    echo "you are  eligible for the trip"
fi
#-----------------------------------------------------------------
# arthematic operations

#! /bin/bash
echo " ...hi we are going to do some math ..."
echo -e " enter the number to add:  "
read num1
read num2
echo $(( num1 + num2 )) is the sum
echo $(( num1 - num2 )) is the difference
echo $(( num1 / num2 )) is the division
echo $(( num1 * num2 )) is the multiplication
echo $(( num1 % num2 )) is the absolute
#-----------------------------------------------------------------

# arthematic operations

#! /bin/bash
echo " ...hi we are going to do some math ..."
echo -e " enter the number to add:  "
read num1
read num2
echo $(expr $num1 + $num2 ) is the sum
echo $(expr $num1 - $num2 ) is the difference
echo $(expr $num1 / $num2 ) is the division
echo $(expr $num1 \* $num2 ) is the multiplication
echo $(expr $num1 % $num2 ) is the absolute


# arthematic operations on decimals 
# floating point math operations in bash | bc command

#! /bin/bash
echo " ...hi we are going to do some math ..."
echo -e " enter the number to add:  "
read num1
read num2
echo sum is
echo "$num1+$num2" | bc
echo
echo diff is
echo "$num1-$num2" | bc
echo
echo mul is
echo "$num1*$num2" | bc
echo
echo div is
echo "scale=2;$num1/$num2" | bc
echo
echo abs is
echo "$num1%$num2" | bc
echo
echo the sqrt of $num1 is
echo "scale=3;sqrt($num1)" | bc -l
echo
echo the $num1 th power of $num2 is
echo "scale=3;$num2^$num1" | bc -l

#------------------------------------------------------------------------------
# case statements 

#! /bin/bash

case expression in
pattern1 )
    statements ;;
pattern2 )
    statements ;;
...
esac

#! /bin/bash

vehicle=$1

case $vehicle in
        "car" )
                echo "rent for the $vehicle is 100 dollars" ;;
        "van" )
                echo "rent for the $vehicle is 400 dollars " ;;
        "truck" )
                echo "rent for the $vehicle is 1000 dollars " ;;
        * )
                echo "sorry the $vehicle  you entered is not available" ;;
esac



# the case statement example

#! /bin/bash

echo -e "Enter some character : \c"
read value

case $value in
        [a-z] )
                echo "user entered $value a to z" ;;
        [A-Z] )
                echo "user entered $value A to Z " ;;
        [0-9] )
                echo "user entered $value 0 to 9 " ;;
        ? )
                echo "user entered $value special character" ;;
        * )
                echo " user entered $value which is unknown to me"
esac
#----------------------------------------------------------------------------------

# USING ARRAY VARIABLES

#! /bin/bash
os=('ubuntu' 'windows' 'kali')
echo " the elements in the array $os are :"
echo "${os[@]}"
echo " the 0th element in the array is :"
echo "${os[0]}"
echo " the number of elements in  the array is :"
echo "${!os[@]}"
echo "the length of the array is :"
echo " ${#os[@]}"

os[21]='mac'#adds mac at 20th position
os[5]='centos'#adds centos at 4th position in the array
echo "the updated array elements are : "
echo "${os[@]}"
echo "now i am going to delete a element at 2nd position"
unset os[1] # removes the 2nd element in the array
echo "${os[@]}"

#--------------------------------------------------------------------------

# USING WHILE LOOP

#! /bin/bash
# syntax
while[ condition]
do
    command1
    command2
    command3
done

#! /bin/bash
n=1
while [ $n -le  10 ]
do
    echo "$n chenna is a good boy "
    n=$((n+1))
    sleep 2
done


# using while loop for reading files

#! /bin/bash
n=1
while read p
do
    echo $p
done 



#! /bin/bash
# while with ifs


while IFS= read -r line
do
        echo $line
done < /etc/host.conf

#-------------------------------------------------------------------------------

# USING INTILL LOOPS
# IN THE UNTILL LOOP THE COMMANDS ARE EXECUTED UNTILL THE CONDITION IS FALSE
#! /bin/bash
#syntax
until [ condition ]
do
    command
    command
    command
done



# USING UNTIL LOOps
#! /bin/bash
#syntax
n=1
until [ $n -gt 20 ]
do
    echo $n
    echo " shell scrpting is not that tough its pretty easy actually"
    n=$((n+1))

done
#-----------------------------------------------------------

# using for loops
#! /bin/bash
#syntax

for VARIABLE in 1 2 3 4 5 .. n
do 
    command
    command
    command
    command
    command
done

#OR----------------------------------------------------------

for VARIABLE in file1 file2 file3
do 
    command1
    command2
    command3
done

#or-------------------------------------------------------------

for OUTPUT in $(Linux-Or-Command-Here)
do  
    command on $OUTPUT
    command on $OUTPUT 
    command on $OUTPUT 
done

#or--------------------------------
for (( EXP1; EXP2; EXP3 ))
do 
    command1
    command2
    command3
    command4
done

#----------------------------
# using for loops
#! /bin/bash
#syntax
echo $BASH_VERSION
for (( i=0; i<10; i++ ))
do
   echo $i
  echo " bash scripting will help you alot in future"
done

#-------------------------------------
# using for loops
#! /bin/bash
#syntax

for i in {1..20..3}
do
    echo $i
   echo " shell scripting is easy "
    echo ${BASH_VERSION}
done
#--------------------------------
# using for loops to execute commands
#! /bin/bash
#syntax

for command in ls pwd date
do
    echo "--------------------------$command------------------------"
   $command
done
#-------------------------------------------
# using for loops to display all directories present
#! /bin/bash
#syntax

for item in *
do
    if [ -d $item ]
    then
        echo $item
    fi 
done

#----------------------
# using for loops to display all files present
#! /bin/bash
#syntax

for item in *
do
    if [ -f $item ]
    then
        echo $item
    fi 
done
#--------------------------------

# using select loop 
#! /bin/bash
#syntax

select varName in list 
do 
    command
    command
    command
    command
done

#---------------------
# using select loop 
#! /bin/bash
#syntax

select Name in chenna kesava ram yash 
do 
    echo "$Name selected"
done
#-----------------------------------
# using select loop with case statement
#! /bin/bash
#syntax

select Name in chenna kesava ram yash 
do 
    case $name in 
    chenna)
        echo "chenna is specialist in coding"
        ;;
    kesava)
        echo "kesava is specialist in packaging"
        ;;
    ram)
        echo " ram is specialist in damage control"
        ;;
    yash)
        echo " yash is specialist in managing"
        ;;
    *)
    echo "error please enter a value from above"
    esac
done



#---------------------------------------------------
# USING THE BREAK STATEMENT TO BREAK IN THE MIDDLE OF A LOOP
#!/bin/bash

for ((i=1 ; i<=10 ; i++))
do
        if [ $i -eq 5 ]
        then
                break
        fi
  echo $i ;
done

#--------------------------------------------------
# using continue statement
for ((i=1 ; i<=10 ; i++))
do
        if [ $i -eq 3 -o $i -eq 6 ]
        then
                continue
        fi
  echo $i ;
done


#-------------------------------------------------
# FUNCTIONS

#!/bin/bash

function name() {
    commands
}

name() {
    commands
}

#------------
# hello world function
#!/bin/bash

function Hello() {
    echo "hello World"
}
quit (){
    exit
}

Hello
quit
echo "food is awesome"


#-------------------------------
# passing arguments in functions

#! /bin/bash
function print() {
    echo $1 $2 $3
}
quit (){
    exit
}

print hello chenna hai
print world
print again # here we called the print funtion 3 times
quit
echo "food is awesome"


#------------------------------
# global variable vs local variabe in functions

#!/bin/bash
function print(){
    name=$1
    echo " my name is $name"
}

name= "tom"
echo " my name is $name : before"
print chenna
echo " my name is $name : after"

echo " now you know hoe the local variables work"


# global variable vs local variabe in functions

#!/bin/bash
function print(){
    local name=$1 # we are localising the variable by local key word
    echo " my name is $name"
}

name= "tom"
echo " my name is $name : before"
print chenna
echo " my name is $name : after"

echo " now you know hoe the local variables work"


# FUNCTION EXAMPLE
# CHECKING WHETHER A FILE EXIST OR NOT USING FUNCTIONS

#!/bin/bash
usuage(){
    echo "YOU NEED To PROVIDE AN ARGUMENT : "
    echo "usuage : $0 file_name"
}
is_file_exists() {
    local file="$1"
    [[ -f "$file" ]] && return 0 || return 1
}
[[ $# -eq 0 ]] && usuage
if ( is_file_exists "$1")
then
    echo "file found"
else
    echo " fle not found"
fi




#------------------------------------------------------

#read only variable / function

#!/bin/bash
var=31
readonly var
var=50
echo "var => $var"



hello(){
    echo "hello world"
}

readonly -f hello

hello(){
    echo "hello world again"
}

#----------------------------------------------------------
# signals and traps
#!/bin/bash
trap "echo exit signal is detected  " SIGINT
echo "pid is $$"
while (( count < 10 )) # for more man 7 signal
do              # you cannnot trap SIGKILL and SIGSTOP
    sleep 10
    (( count ++ ))
    echo $count
done
exit 0

