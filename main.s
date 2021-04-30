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

#t0 and t1 are used as the conditional varibales
li $t0,9                 #t0 is the break condition intialized with 9 because we have 9 elements
li $t1,0                 #t1 is the counter loaded with the intial integer 0       
la $t2,arr

#Function to take input from the user
input:
beq $t0,$t1,row          #if t0 and t1 are equal go to row
li $v0,5          		 #System call for taking the integer input from the user
syscall
sw $v0,0($t2)            #Storing the input to t2
addi $t2,$t2,4           #Increament the t2 by 4
addi $t1,$t1,1           #Increament the t1 by 1
j input                  #Jump to input

row:
li $t1,1                 #Loading 1 to the registor t1
li $t2,4                 #Loading 4 to the registor t2
la $s0,arr               #Loading arr string to registor s0 

#Function for calculating the row sum
loop1:
beq $t1,$t2,col          #Breaking the loop when t1 and t2 are equal
li $t0, 0                #Loading the 0 to t0 as well it hold sum which is zero initially
lw $t3,0($s0)            #Loading the value stored in s0 to t3 or we can say loading first element of each row
add $t0,$t0,$t3          #Adding t3 to t0
addi $s0, $s0, 4         #Adding 4 to s0
lw $t3,0($s0)            #Loading the value stored in s0 to t3 or we can say loading second element of each row
add $t0,$t0,$t3          #Adding t3 to t0
addi $s0, $s0, 4         #Adding 4 to s0
lw $t3,0($s0)            #Loading the value stored in s0 to t3 or we can say loading second element of each row
add $t0,$t0,$t3          #Adding t3 to t0
addi $s0, $s0, 4         #Adding 4 to s0
li $v0,1                 #Display the integer
move  $a0,$t1            #Loading the value
syscall
sw $t0,sum               #Store the content in t3 into the variable sum
li $v0,4                 #System call for the display of the string
la $a0,str2              #Loading the str2 in the registor a0
syscall
li $v0,1                 #Display the integer
move  $a0,$t0            #Loading the value
syscall
li $v0,4                 #System call for the display of the string
la $a0,str3              #Loading the string
syscall
addi $t1,$t1,1           #Adding 1 to t1
j loop1                  #Jump to loop1

col:
li $t1,0                 #Loading 1 to the registor t1
li $t2,3                 #Loading 3 to the registor t2
li $t4,0                 #Loading 0 to the registor t4 

#Function for calculating the column sum
loop2:
beq $t1,$t2,exit         #Breaking the loop when t1 and t2 are equal
la $s0, arr              #Loading arr to the s0 register
add $s0, $s0, $t4        #Adding the t4 to s0
li $t0, 0                #Loading the 0 to t0 as well it hold sum which is zero initially
lw $t3,0($s0)            #Loading the value stored in s0 to t3 or we can say loading first element of each column
add $t0,$t0,$t3          #Adding t3 to t0
addi $s0, $s0, 12        #Adding 12 to s0
lw $t3,0($s0)            #Loading the value stored in s0 to t3 or we can say loading second element of each column
add $t0,$t0,$t3          #Adding t3 to t0
addi $s0, $s0, 12        #Adding 12 to s0
lw $t3,0($s0)            #Loading the value stored in s0 to t3 or we can say loading third element of each column
add $t0,$t0,$t3          #Adding t3 to t0
addi $s0,$s0, 12         #Adding 12 to s0
addi $t1,$t1,1           #Adding 1 to t1
li $v0,1                 #Display the integer
move  $a0,$t1            #Loading the value
syscall
sw $t0,sum               #Store the content in t3 into the variable sum
li $v0,4                 #System call for the display of the string
la $a0,str4 
syscall
li $v0,1                 #Display the integer
move  $a0,$t0            #Loading the value
syscall
li $v0,4                 #System call for the display of the string
la $a0,str3              #Loading the address of str3 in register a0
syscall 
addi $t4,$t4, 4          #Adding 4 to t4
j loop2                  #Jump to loop2

#Exit
exit:  
li $v0,10                #Loading 10 in v0 which is the system call to terminate the program
syscall
.end main