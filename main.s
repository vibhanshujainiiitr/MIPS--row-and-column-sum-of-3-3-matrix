#Computer Architecture Assignment
#Team Members: Thanai Sahu & Vibhanshu Jain
#Problem Statement: Write a program in C to find sum of rows and columns of a 3 * 3 Matrix

.data
str1: .asciiz "Enter the elements in the order given in example.txt : \n"                #string to display for better user interaction
str2: .asciiz " Row Sum :"          
str3: .asciiz "\n"  
str4: .asciiz " Column Sum :"
sum: .word 0
arr: .word 1 2 3 4 5 6 7 8 9 
.text
main:

#Code 

li $v0,4           		 #System call for the display of the string
la $a0,str1        		 #Load the address of the string into register $a0
syscall

li $t0,9
li $t1,0
la $t2,arr

#Function to take input from the user
input:
beq $t0,$t1,row
li $v0,5          		 #System call for taking the integer input from the user
syscall
sw $v0,0($t2)
addi $t2,$t2,4
addi $t1,$t1,1
j input

row:
li $t1,1
li $t2,4
la $s0,arr  

#Function for calculating the row sum
loop1:
beq $t1,$t2,col
li $t0, 0 
lw $t3,0($s0)
add $t0,$t0,$t3
addi $s0, $s0, 4  
lw $t3,0($s0)
add $t0,$t0,$t3
addi $s0, $s0, 4  
lw $t3,0($s0)
add $t0,$t0,$t3
addi $s0, $s0, 4 
li $v0,1                   #Display the integer
move  $a0,$t1              #Loading the value
syscall
sw $t0,sum                 #Store the content in t3 into the variable sum
li $v0,4                   #System call for the display of the string
la $a0,str3                #Loading the string
la $a0,str2                
syscall
li $v0,1                   #Display the integer
move  $a0,$t0              #Loading the value
syscall
li $v0,4                   #System call for the display of the string
la $a0,str3                #Loading the string
syscall
addi $t1,$t1,1
j loop1

col:
li $t1,0
li $t2,3
li $t4,0  

#Function for calculating the column sum
loop2:
beq $t1,$t2,exit
la $s0, arr
add $s0, $s0, $t4
li $t0, 0                  
lw $t3,0($s0)
add $t0,$t0,$t3
addi $s0, $s0, 12  
lw $t3,0($s0)
add $t0,$t0,$t3
addi $s0, $s0, 12  
lw $t3,0($s0)
add $t0,$t0,$t3
addi $s0, $s0, 12 
addi $t1,$t1,1
li $v0,1                   #Display the integer
move  $a0,$t1              #Loading the value
syscall
sw $t0,sum                 #Store the content in t3 into the variable sum
li $v0,4                   #System call for the display of the string
la $a0,str4 
syscall
li $v0,1                   #Display the integer
move  $a0,$t0              #Loading the value
syscall
li $v0,4                   #System call for the display of the string
la $a0,str3 
syscall
addi $t4,$t4, 4
j loop2

#Exit
exit:  
li $v0,10
syscall
.end mai