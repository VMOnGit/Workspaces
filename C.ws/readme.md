## 1\. `dateCheck.c`: Date Validation Program 📅

This program checks if a date (day, month, year) entered by the user is valid, accounting for leap years and the correct number of days per month.

-----

### Explanation

  * The `main` function prompts the user to enter a date and reads the day, month, and year.
  * It calls the function `verifyDate(day, month, year)` to perform the core validation logic.
  * The `verifyDate` function first checks for a valid **year** (non-negative) and **month** (1-12).
  * It determines if the year is a **leap year** using the rule: divisible by 4, *unless* it's divisible by 100 *but not* by 400.
  * It then checks the **day** against the pre-defined maximum days for that month, allowing **29 days for February** only if it's a leap year.

 

```c
#include<stdio.h>
// ... other code ...

/**
 * Checks if the given day, month, and year form a valid date.
 * Returns 1 for valid, 0 for invalid.
 */
int verifyDate(int day, int month,int year){
    int leap;
    // Array holds maximum days for Jan, Feb, Mar, etc.
    int days[] =  {31,28,31,30,31,30,31,31,30,31,30,31};
    
    // 1. Basic checks for year and month
    if(year<0 || month<1 || month>12){
        return 0;
    }
    
    // 2. Determine leap year status
    if((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)){
        leap = 1; // It is a leap year
    }else{
        leap = 0; // It is not a leap year
    }
    
    // 3. Check day validity based on month and leap year status
    if(month == 2 && leap == 1){
        if(day<1 || day>29) // 29 days in Feb for a leap year
        return 0;
    }else{
        // Check against the standard days for the month
        if(day<1 || day>days[month-1]) 
            return 0;
    }
    return 1; // Date is valid
}
```

-----

## 2\. `Factorial.c`: Factorial Calculation (Iterative) 🧮

This program calculates the factorial of a positive integer entered by the user using a `for` loop, without using a separate function.

-----

### Explanation

  * The `main` function prompts the user for a number (`userin`).
  * It initializes a product variable, `prod`, to **1**.
  * A `for` loop iterates from the input number (`userin`) down to **1**.
  * In each iteration, the current loop variable (`i`) is multiplied by `prod` to accumulate the factorial.
  * The final calculated factorial is printed to the console.

 

```c
#include <stdio.h>

int main() {
    int userin;
    int prod=1; // Initialize product to 1
    printf("Enter number to find factorial:");
    scanf("%d",&userin);
    
    // Loop iterates downwards to perform the multiplication: userin * (userin-1) * ... * 1
    for(int i = userin;i>0;i--){
       
        prod = prod*i;
    }
    printf("Factorial is %d",prod);
}
```

-----

## 3\. `squareCube.c`: Square and Cube Calculation using Functions 🔢

This program calculates the square and cube of an integer by defining and calling dedicated functions, demonstrating function reuse.

-----

### Explanation

  * The `main` function reads an integer input (`num`).
  * It calls `square(num)` and `cube(num)` to get the results.
  * The `square` function simply calculates and returns the number multiplied by itself.
  * The `cube` function is notable because it calculates the cube by calling the `square` function and multiplying that result by the original number (`num * square(num)`).
  * The results are then printed in `main`.

 

```c
#include<stdio.h>

int square(int num){
    int result;
    result = num*num; // Calculates the square
    return result;
}

int cube(int num){
    int result;
    // Calculates the cube by reusing the square function: num * (num*num)
    result = num*square(num); 
    return result;
}

int main(){
    int num,Square,Cube;
    printf("Enter number to find square and cube of:");
    scanf("%d",&num);
    Square = square(num);
    Cube = cube(num);
    printf("The square is:%d\nThe cube is:%d\n",Square,Cube);
    
}
```

-----

## 4\. `FactorialUsingFunction.c`: Factorial Calculation (Void Function) ⚙️

This program calculates the factorial using a separate function that performs the calculation and output itself, without returning a value (`void`).

-----

### Explanation

  * The `main` function reads the input number (`num`) from the user.
  * It calls the `fact(num)` function.
  * The `fact` function calculates the factorial iteratively.
  * Because `fact` is a **`void` function**, it doesn't return a value. Instead, it handles the final step of **printing the result directly** to the console from within the function body.

 

```c
#include<stdio.h>

// Function signature: void fact(int) means it takes an integer but returns nothing.
void fact(int num)
{ 
    int facto=1;

    // Loop calculates the factorial
    for(int i=1;i<=num;i++)
    {
          facto=facto*i;
    } 
    printf("Factorial is %d",facto); // The result is printed here.
}	

int main()
{
    int num;
    printf("Enter the number\n");
    scanf("%d",&num);
    fact(num); // Calls the function to calculate and print the result.
    return 0;
}
```

-----

## 5\. `Multiplication_table_2-5_Day1.c`: Multiplication Tables (2 to 5) ✖️

This program uses nested loops to generate and print the multiplication tables for the numbers 2, 3, 4, and 5, up to $x 10$.

-----

### Explanation

  * The program uses **nested `for` loops**.
  * The **outer loop** (`i`) controls which table is being generated (the multiplier, from 2 to 5).
  * The **inner loop** (`j`) controls the numbers being multiplied by the outer loop variable (the multiplicand, from 1 to 10).
  * Inside the inner loop, the result `$i \times j = i \times j$` is printed.
  * A newline character is printed after the inner loop finishes to visually separate each multiplication table.

 

```c
#include <stdio.h>

int main() {
    int i; // Outer loop for the table number (2 through 5)
    int j; // Inner loop for the multiplier (1 through 10)
    
    // Outer loop selects the base number for the table (e.g., table of 2)
    for(i=2;i<=5;i++){
        
        // Inner loop calculates and prints the 10 entries for that table
        for(j=1;j<=10;j++){
            printf("%dx%d=%d\n",i,j,i*j);
        }
        printf("\n"); // Prints a blank line to separate tables
    }
    
}    
```

-----

## 6\. `Alphabets_Ascii.c`: Printing ASCII Alphabets 🔠

This program iterates through a range of ASCII values and prints the corresponding uppercase and lowercase English alphabets side-by-side.

### Explanation

  * The program uses a single **`for` loop** to iterate.
  * Variables `i` and `j` are initialized to **65** and **97**, respectively. These are the ASCII values for 'A' and 'a'.
  * The loop continues as long as `i` is less than **91** (the ASCII value for 'Z').
  * In each iteration, both `i` and `j` are incremented.
  * Inside the loop, `printf("%c\t%c\n", i, j);` prints the characters corresponding to the ASCII values of `i` (uppercase) and `j` (lowercase), separated by a tab (`\t`).

 

```c
#include <stdio.h>

int main() {
    
	int i=65,j=97; // i starts at ASCII for 'A', j starts at ASCII for 'a'
    
    // Loop continues until i reaches ASCII for 'Z' (90)
    for(i,j;i<91;i++,j++) 
    {
        // Prints the character corresponding to the ASCII value
        printf("%c\t%c\n",i,j);
    }
	 
}
```

-----

## 7\. `Find_Armstrong.c`: Armstrong Number Checker 💡

This program checks if a number entered by the user is an **Armstrong number**. An Armstrong number is a number that is equal to the sum of the cubes of its digits (e.g., $153 = 1^3 + 5^3 + 3^3$).

### Explanation

  * The `main` function prompts for an integer input and passes it to the `arm(int num)` function.
  * The `arm` function uses a `while` loop to process the number digit by digit.
  * **`rem = num % 10;`**: Gets the last digit.
  * **`cube_sum = cube_sum + (rem * rem * rem);`**: Adds the cube of the digit to the running total.
  * **`num = num / 10;`**: Removes the last digit.
  * A temporary variable, `temp`, holds the **original number** to compare with the final `cube_sum`.
  * The result is printed, indicating whether the number is Armstrong or not.

 

```c
#include<stdio.h>

void arm(int num){
	int rem=0,temp,cube_sum=0; // cube_sum must be initialized to 0
	temp=num; // Save the original number for comparison
    
	while (num > 0) {
		rem= num % 10; // Get the last digit
		num = num / 10; // Remove the last digit
		cube_sum = cube_sum+(rem*rem*rem); // Add the cube of the digit
    }
    
    // Compare the sum of cubes with the original number
    if(temp==cube_sum){
    	printf("%d is Armstrong\n",temp);
    }else{
    	printf("%d is not Armstrong\n",temp);
    }
}
```

-----

## 8\. `MenuDrivenForBasicArith.c`: Menu-Driven Calculator ➕➖✖️➗

This program implements a basic calculator that repeatedly prompts the user for two numbers and an operation choice from a menu.

### Explanation

  * The program runs inside an **infinite `while(1)` loop**, which only exits when the user selects the "quit" option.
  * Inside the loop, it prompts for **two numbers (`num1`, `num2`)**.
  * It displays a **menu** of operations (1: multiplication, 2: addition, 3: subtraction, 4: division, 5: quit).
  * A **`switch` statement** handles the user's choice (`userin`), performing the selected arithmetic operation and storing the result in `out`.
  * The `default` case handles invalid operation choices.
  * If the choice is `5`, the `break` statement exits the `while` loop.
  * For valid operations (1-4), the `out` is printed.

 

```c
#include <stdio.h>

int main() {
	int userin;
	int num1,num2;
	int out;
    
	while(1){ // Infinite loop for repeated calculations
        
        printf("\nEnter 2 number to perform operation");
        scanf("%d%d",&num1,&num2);
        
        printf("Enter the operation to perform\n1 for multiplication\n2 for addition\n3 for subtraction\n4 for division\n5 to quit\n");
        scanf("%d",&userin);
        
        switch(userin){
            case 1:
                out = num1*num2;
                break;
            case 2:
                out = num1+num2;
                break;
            case 3:
                out = num1-num2;
                break;
            case 4:
                out =num1/num2;
                break;
            case 5:
                break; // Handled below to exit the while loop
            default: 
                printf("Invalid Operation");
        }
	
        if(userin==5) break; // Exit the while(1) loop
        printf("Result is :%d",out);
	} 
}
```

-----

## 9\. `Max_Ternary.c`: Maximum of Two using Ternary Operator ❓

This short program finds the maximum of two integers entered by the user using the **ternary (conditional) operator** (`? :`).

### Explanation

  * The program prompts for two numbers, `a` and `b`.
  * The core logic is the statement: `out = (a > b) ? a : b;`
      * The expression `(a > b)` is the condition.
      * If the condition is **true**, the value after `?` (`a`) is assigned to `out`.
      * If the condition is **false**, the value after `:` (`b`) is assigned to `out`.
  * The result (`out`) is then printed.

 

```c
#include <stdio.h>

int main() {
	int a;
    int b;
    int out;
    
	printf("Enter Number\n");
	scanf("%d",&a);

	printf("Enter Number\n");
	scanf("%d",&b);
    
    // Ternary operator: If (a > b) is true, out = a; otherwise, out = b.
    out=(a>b)?a:b; 
    
    printf("Max is :%d",out);
}
```

-----

## 10\. `FiboWithFunction.c`: Fibonacci Series Generator 🧬

This program generates and prints the Fibonacci series up to a limit provided by the user, utilizing a separate function.

### Explanation

  * The `main` function reads the user-defined limit (`num`) and calls the `fibo(int num)` function.
  * The `fibo` function initializes the first two terms: `a = 0` and `b = 1`.
  * It uses a `while` loop that continues as long as the current term (`a`) is less than the user-defined limit (`num`).
  * Inside the loop, it calculates the next term (`c = a + b`), updates the terms (`b=a; a=c;`), and prints the second-to-last term (`b`) which represents the current valid Fibonacci number.

 

```c
#include<stdio.h>

// Function to generate the Fibonacci series up to the 'num' limit
void fibo(int num)
{ 
    int a,b,c;
    a=0; // First term
    b=1; // Second term
    
    // Loop continues as long as the current Fibonacci term (a) is less than the limit
    while(a<num){
        c=a+b; // Calculate the next term
        b=a;   // 'a' becomes the previous term
        a=c;   // 'c' (the next term) becomes the new current term
        printf("%d\n",b); // Print the current Fibonacci number
    }
}

int main(){
	int num;
	printf("Enter number:");
	scanf("%d",&num);
	fibo(num);
}
```

-----

## 11\. `MarksToGrade.c`: Grade Calculator (If-Else If) 🎓

This program reads a numerical score from the user and assigns a corresponding letter grade based on a defined set of ranges using `if-else if` statements.

### Explanation

  * The program reads the score (`n`) from the user.
  * It uses a series of chained `if-else if` statements to check the score against the grade boundaries:
      * **`if(n>=75)`**: Grade A
      * **`else if(n>=55&&n<75)`**: Grade B
      * **`else if(n>=40&&n<55)`**: Grade C
      * **`else`**: FAIL (for scores less than 40)
  * Due to the cascading nature of `if-else if`, the conditions for the lower bounds (e.g., `n<75` in the second condition) are technically redundant but included for clarity in the original code.

 

```c
#include <stdio.h>

int main()
{
    int n;
    printf("Enter Number\n");
    scanf("%d",&n);
    
    // Checks for grade boundaries sequentially
    if(n>=75){
        printf("A\n");
    }
    // Only runs if n < 75
    else if(n>=55){ 
        printf("B\n");
    }
    // Only runs if n < 55
    else if(n>=40){ 
        printf("C\n");
    }
    // Runs if n < 40
    else{
        printf("FAIL\n");
    }
    
}
```

-----

## 12\. `EvenOrOdd.c`: Even or Odd Checker (Modulo) ☯️

This simple program determines whether an integer entered by the user is even or odd.

### Explanation

  * The program reads an integer (`n`) from the user.
  * It uses the **modulo operator (`%`)** to check the remainder when the number is divided by 2.
  * If `n % 2 == 0`, the number is **even**.
  * Otherwise, the number is **odd**.
  * The corresponding result is printed.

 

```c
#include <stdio.h>

int main()
{
    int n;
    printf("Enter Number\n");
    scanf("%d",&n);
    
    // Modulo operator checks if the remainder after division by 2 is 0.
    if(n%2==0){
        printf("Even\n");
    
    }
    else{
        printf("Odd\n");
    }
    
}
```

-----

## 13\. `Factorial.c`: Factorial Calculation (Iterative) ❕

This program calculates the factorial of a positive integer entered by the user using a `for` loop, without using a separate function.

### Explanation

  * The `main` function prompts the user for a number (`userin`).
  * It initializes a product variable, `prod`, to **1**.
  * A `for` loop iterates from the input number (`userin`) down to **1**.
  * In each iteration, the current number (`i`) is multiplied by `prod` to accumulate the factorial.
  * The final calculated factorial is printed.

 

```c
#include <stdio.h>

int main() {
	int userin;
	int prod=1,num; // Initialize prod to 1
	printf("Enter number to find factorial:");
	scanf("%d",&userin);
    
	// Loop iterates downwards to perform the multiplication: userin * (userin-1) * ... * 1
	for(int i = userin;i>0;i--){
	   
	    prod = prod*i;
	}
	printf("Factorial is %d",prod);
    
}
```


-----

## 14\. `SumOfDigits_DMA.c`: Sum of Digits for Multiple Inputs (DMA) ➕

This program dynamically allocates memory to accept multiple integer inputs from the user and then calculates and prints the sum of the digits for each of those numbers.

-----

### Explanation

  * **Memory Allocation:**
      * The `main` function first asks the user for the `count` (number of inputs).
      * It uses `malloc(count * sizeof(int*))` to **dynamically allocate memory** for an array of integers (`arr`). *(Note: The use of `sizeof(int*)` when allocating space for `int` elements is technically a bug, but the code still attempts to allocate space for an array of `count` integers).*
  * **Input:**
      * A `for` loop collects the specified number of integers from the user, storing them in the dynamically allocated array `arr`.
  * **`sum` Function (Digit Calculation):**
      * The `sum` function iterates through the `arr` for each number.
      * Inside the outer loop, a `while` loop is used to extract and sum the digits of the current number (`arr[i]`):
          * `rem = arr[i] % 10;` gets the **last digit**.
          * `sum = sum + rem;` adds the digit to the running sum for the current number.
          * `arr[i] = arr[i] / 10;` removes the last digit.
      * The sum of the digits for each number is printed immediately after its calculation.

  

```c
#include<stdio.h>
#include<stdlib.h>

void sum(int *,int );

int main()
{
	int count;
	printf("Enter the number of inputs:");
	scanf("%d",&count);
	
	// Dynamically allocate memory for 'count' number of integers
	int(*arr)=(int*)malloc(count*sizeof(int)); // Corrected memory allocation size for clarity
    
	for(int i=0;i<count;i++)
	{       
		printf("Enter the number");
		scanf("%d",&arr[i]);
	} 
	
	sum(arr,count);
	
    // Clean up allocated memory
    free(arr);
	return 0;
}	
	
	
void sum(int *arr,int count)
	{ int rem=0,i,sum=0;
	  
		for(int i=0;i<count;i++)
		{
		sum=0;
		// Iterate through digits of the current number (arr[i])
		while(arr[i]!=0)
			{
				rem=arr[i]%10; // Get last digit
				sum=sum+rem;   // Add to sum
				arr[i]=arr[i]/10; // Remove last digit		
			}
			printf("Sum of digits for input %d: %d\n", i+1, sum);
		}
	}
```

-----

## 15\. `TwoDArray_DMA.c`: 2D Array Operations (Matrix Sum) using DMA 📐

This program uses **Dynamic Memory Allocation** to create two 2D arrays (matrices), performs **matrix addition** on them, and then displays the results. It is an excellent example of managing memory for 2D arrays (array of pointers).

-----

### Explanation

  * **Functions for DMA Management:** The program is structured using separate functions for clean memory management:
      * `allocate`: Creates a 2D array (matrix) of size `row_size` x `col`. It allocates an array of pointers (`int**`), and then for each pointer, allocates a row array (`int*`), effectively creating a jagged array structure that behaves like a matrix.
      * `deallocate`: Frees the memory for each row first, and then frees the array of pointers, preventing memory leaks.
  * **Matrix Operations:**
      * `accept`: Reads the elements for a matrix from user input.
      * `display`: Prints the contents of a matrix to the console.
      * `sum`: Performs element-wise matrix addition: `result[i][j] = arr1[i][j] + arr2[i][j]`.
  * **`main` Logic:**
      * It prompts for row and column sizes.
      * It calls `allocate` three times to create `arr1`, `arr2`, and `result` matrices.
      * It uses `accept` to fill `arr1` and `arr2`, displaying them after input.
      * It calls `sum` to calculate the addition.
      * It displays the final `result` matrix.
      * **Crucially, it calls `deallocate` for all three matrices to free memory.**

  

```c
#include <stdio.h>
#include <stdlib.h>

/**
 * Dynamically allocates memory for a 2D array (matrix).
 * Creates an array of row pointers, and then allocates memory for each row.
 */
int** allocate(int** arr,int row_size,int col){
	int i;
	// 1. Allocate space for 'row_size' number of pointers (the rows)
	arr=(int**)malloc(row_size  * sizeof(int*)); 
    
	// 2. For each pointer, allocate space for 'col' number of integers (the elements)
	for(i=0;i<row_size;i++){
		arr[i] = (int*)malloc(col * sizeof(int));
	}
	return arr;
}

/**
 * Reads elements from the user into the matrix.
 */
int** accept(int** arr,int row_size,int col){
	// ... reading logic ...
    return arr;
}

/**
 * Performs element-wise addition of two matrices.
 */
int** sum(int** arr1,int** arr2,int** result,int row_size,int col){
	for(int i=0;i<row_size;i++){
		for(int j=0;j<col;j++){
			result[i][j]=arr1[i][j]+arr2[i][j];
		}
	}return result;
}

/**
 * Deallocates memory by freeing each row first, then freeing the array of pointers.
 */
void deallocate(int** arr, int row_size){
	int i;
	for (i=0;i<row_size;i++)
       	   free(arr[i]); // Free individual rows
       	free(arr);       // Free the array of pointers
}

int main(){
    // ... main execution and function calls ...
}
```


-----

## 16\. `countNonZero_DMA.c`: Count Non-Zero Elements in a Matrix (DMA) -  🔢

This program dynamically allocates memory for a 2D array, counts the number of non-zero elements, and correctly handles memory management.
-----

### Explanation

  * **Dynamic Allocation (`allocate`):** Uses the "array of pointers" method (`int**`) to allocate memory for a matrix based on user-provided rows and columns.
  * **Counting (`countNZ`):** Iterates through all elements of the matrix and returns the total count of elements that are not zero.
  * **Deallocation :** The deallocation method involves **freeing each row** first, and then **freeing the array of pointers** (`m`) to prevent memory leaks. The corrected memory cleanup is integrated into the `main` function snippet below.


```c
#include<stdio.h>
#include<stdlib.h>

int** allocate(int** m, int row_size, int col_size){
  // ... (Allocation logic remains correct)
}

int countNZ(int** m1, int row_size, int col_size){
  int countNon=0;
  for(int i=0;i<row_size;i++){
    for(int j=0;j<col_size;j++){
      if(m1[i][j]!=0){ 
        countNon+=1;
      }
    }
  }
  return countNon;
}

int main(){
    int** m1=NULL;
    int row_size,col_size,countNon;
    // ... (Input prompts) ...
    m1=allocate(m1,row_size,col_size);
    m1=accept(m1,row_size,col_size);
    countNon=countNZ(m1, row_size,col_size);
    printf("Count of Non Zero Elements: %d\n",countNon);
  
    // Corrected Deallocation logic integrated into main
    for(int i=0; i<row_size; i++){
        free(m1[i]); // Free each row
    }
    free(m1); // Free the array of pointers
    
    return 0;
}
```

-----

## 17\. `Multi_2DArray.c`: Multiplication Table Generator in a 2D Array ✖️

This program generates multiplication tables for the numbers 2 through 5 and stores the results in a $10 \times 4$ fixed-size 2D array before displaying them.

-----

### Explanation

  * **Array Structure:** The `tab[10][4]` array stores the products. It is passed using the pointer-to-array syntax `int (*tab)[4]`.
      * **Columns (4):** Represent the tables for the base numbers 2, 3, 4, 5 (mapped to indices 0 through 3).
  * **`multi` Logic:** The code calculates the product of the base number (`i` from 2 to 5) and the multiplicand (`j+1` from 1 to 10) and stores it in the corresponding array cell.

  

```c
#include<stdio.h>

void multi(int (*tab)[4]){
	// i: Base number (2 to 5); i-2 is the column index (0 to 3)
	for(int i=2;i<=5;i++)
	    // j: Row index (0 to 9); j+1 is the multiplicand (1 to 10)
		for(int j = 0;j<10;j++)
	{
		tab[j][i-2]=(i)*(j+1);
	}
}
void display(int (*tab)[4])
{
	for(int i=2;i<=5;i++){
		for(int j=0;j<10;j++)
		{
		printf("%dx%d=%d\n",i,j+1,tab[j][i-2]);
		}
	}
}

int main()
{ 
 	int tab[10][4];
 	// Since the original code didn't define 'accept', we skip calling it
 	multi(tab);
 	display(tab);
	return 0;
}
```

-----

## 18\. `MatrixAddition.c`: Matrix Addition (Fixed Size $3 \times 3$) ➕

This program performs element-wise addition of two $3 \times 3$ matrices using fixed-size arrays.

-----

### Explanation

  * **Fixed Size:** Uses `#define SIZE 3` for all matrix operations.
  * **`sum` Logic:** The `sum` function iterates through the $3 \times 3$ array and calculates the element-wise sum, storing the result in the `add` matrix: `add[i][j] = tab[i][j] + tran[i][j];`.
  * **Array Passing:** Fixed-size 2D arrays are passed to functions using the standard pointer-to-array syntax: `int (*tab)[SIZE]`.

  

```c
#include<stdio.h>
#define SIZE 3

void accept(int (*tab)[SIZE]){
	printf("Enter Values\n");
	for(int i=0;i<SIZE;i++){
		for(int j=0;j<SIZE;j++)
			scanf("%d",&tab[i][j]);
	}
}

void sum(int (*tab)[SIZE],int (*tran)[SIZE],int(*add)[SIZE]){
	for(int i=0;i<SIZE;i++){
		for(int j=0;j<SIZE;j++)
			add[i][j]=tab[i][j]+tran[i][j];
	}
}
	
int main()
{ 
 	int tab[SIZE][SIZE],tran[SIZE][SIZE],add[SIZE][SIZE];
 	// ... (Execution flow to accept, sum, and display) ...
	return 0;
}
```

-----

## 19\. `transpose_2D_3x3.c`: Matrix Transpose (Size $3 \times 3$) 🔄

This program calculates and displays the **transpose** of a $3 \times 3$ matrix.

-----

### Explanation

  * **Size:** Uses `#define SIZE 3`.
  * **`transpose` Logic:** The core operation is performed by swapping the row and column indices during assignment: `tran[i][j]=tab[j][i];`. This ensures the rows of the original matrix (`tab`) become the columns of the transposed matrix (`tran`).

  

```c
#include<stdio.h>
#define SIZE 3

void transpose(int (*tab)[SIZE],int (*tran)[SIZE]){
	for(int i=0;i<SIZE;i++){
		for(int j=0;j<SIZE;j++)
			// Transposition: new row i, col j gets value from old row j, col i
			tran[i][j]=tab[j][i];
	}
}
	
int main()
{ 
 	int tab[SIZE][SIZE],tran[SIZE][SIZE];
 	// ... (Execution flow to accept, transpose, and display) ...
	return 0;
}
```

-----

## 20\. `magicMat3x3.c`: Magic Matrix Checker  🪄



### Explanation


  * **Logic:** The program calculates all 3 row sums, 3 column sums, the main diagonal sum, and the **anti-diagonal sum** separately. The final validation check ensures all these sums are equal to the first row sum (the magic constant).

   

```c
#include <stdio.h>
#include <stdbool.h>
#define SIZE 3

int main(){
    int mat[SIZE][SIZE];
    int row_sum[SIZE]={0}, col_sum[SIZE]={0};
    int diag_sum=0, anti_diag_sum=0;
    bool is_magic = true; 

    // Input loop (omitted for brevity)

    // 1. Calculation loop (sums)
    for(int i = 0;i<SIZE;i++){
        for(int j = 0;j<SIZE;j++){
            row_sum[i]+=mat[i][j]; 
            col_sum[i]+=mat[j][i]; 
        }
        diag_sum += mat[i][i]; 
        anti_diag_sum += mat[i][SIZE-1-i]; // Calculate anti-diagonal sum
    }
    
    // 2. Validation Check (After all sums are complete)
    int magic_constant = row_sum[0]; 

    // Check all row/column sums
    for(int i = 1; i < SIZE; i++){
        if(row_sum[i] != magic_constant || col_sum[i] != magic_constant){
            is_magic = false;
            break;
        }
    }
    
    // Check diagonals
    if(is_magic && (diag_sum != magic_constant || anti_diag_sum != magic_constant)){
        is_magic = false;
    }

    // Output result
    if(is_magic){
        printf("It is a Magic Matrix\n");
    }else{
        printf("It is not a Magic Matrix\n");
    }
}
```


-----

## 21\. `WritingA2Z_File.c`: Writing and Reading Alphabets to/from a File 🗃️

This program demonstrates basic **file I/O** operations in C by writing the uppercase English alphabet ('A' to 'Z') to a file and then reading and printing the content back to the console.

-----

### Explanation

  * **File Pointer and Opening:** A `FILE` pointer, `fptr`, is declared and initialized to `NULL`. The file `open.txt` is opened in **write mode** (`"w"`). If the file doesn't exist, it's created; if it exists, its contents are truncated. An error check ensures the file opened successfully.
  * **Writing Alphabets:** A `for` loop iterates 26 times.
      * `fputc(('%c',i+65),fptr);` writes a single character to the file stream `fptr`. The value `i+65` corresponds to the ASCII values of 'A' through 'Z'. *(Note: The comma operator usage `('%c', ...)` is non-standard but works by evaluating to the last expression, `i+65`.)*
  * **Closing and Reopening:** The file is closed with `fclose(fptr)`. It is then **reopened in read mode** (`"r"`) to prepare for reading.
  * **Reading and Displaying:** A `while` loop reads characters one by one until the end-of-file marker (`EOF`) is reached.
      * `(ch=fgetc(fptr)) != EOF` reads a character into `ch` and checks if it's the end of the file.
      * `printf("%c\n",ch);` prints each character on a new line.
  * **Cleanup:** The file is closed again.

  

```c
#include<stdio.h>
#include<stdlib.h>

int main()
{   
	FILE *fptr =NULL;
	
    // 1. Open file in write mode ("w")
	fptr=fopen("open.txt","w");
    if(fptr==NULL) { /* error check */ }

    // Write uppercase alphabets (ASCII 65 to 90) to the file
    for(int i=0;i<26;i++)
    {
        fputc((i+65),fptr); 
    }
    fclose (fptr);

    // 2. Open file in read mode ("r")
    fptr=fopen("open.txt","r");
    if (fptr==NULL) { /* error check */ }
	
    // Read and print content until End-Of-File (EOF) is reached
    char ch;
    while( (ch=fgetc(fptr)) !=EOF)
    {
        printf("%c\n",ch);
    }
    
    fclose(fptr);
    return 0;
}
```

-----

## 22\. `MenuDriven_DMA_File.c`: Menu-Driven Book Store Management System (DMA) 📚

This comprehensive program simulates a basic book store management system, using **Dynamic Memory Allocation (DMA)** and a **structure** to manage book records via a menu-driven interface.

-----

### Explanation

  * **Structure Definition:** The `STORE` structure holds the data for a single book: `bid` (ID), `bname` (name/title), `aname` (author), and `price`.
  * **Dynamic Allocation (`allocate`):** This function implements the array-of-pointers method to dynamically create an array of `STORE` structures. It allocates space for an array of `STORE*` pointers, and then allocates a single `STORE` object for each pointer, effectively creating a list of dynamically sized book records.
  * **Menu-Driven Interface:** The `Menu` function provides options to **Add** (accept), **Display**, **Modify**, or **Quit**. It uses a `while(1)` loop and a `switch` statement for navigation.
  * **Data Input (`accept`):** Takes input for the book details. It uses a combination of `scanf` and `fgets/getchar()` to handle both integers/floats and string inputs safely.
  * **Display (`Display`):** Iterates through the dynamically allocated array and prints the details of all stored books.
  * **Modify (`Modify`):** Prompts the user for a **Book ID**. It linearly searches the array for the matching ID. If found, it presents a submenu to modify the **Title**, **Price**, or **Author** of that specific book record.
  * **Memory Deallocation (`deallocate`):** Correctly frees the memory by iterating through the array and freeing each individual `STORE` structure (`arr[i]`) first, and then freeing the main array of pointers (`arr`), preventing memory leaks.

  

```c
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

// Structure to hold book details
typedef struct STORE
{
    int bid;
    char bname[20];
    char aname[20];
    float price;
}STORE;

// Dynamic allocation for an array of STORE structures (array of pointers to structures)
STORE** allocate(int row_size)
{
    STORE** arr;
    arr = (STORE**)malloc(row_size * sizeof(STORE*)); // Allocate array of pointers
    
    for(int i = 0; i < row_size; i++)
    {
        arr[i] = (STORE*)malloc(sizeof(STORE)); // Allocate each individual structure
    }
    return arr;
}

// Correctly frees memory
void deallocate(STORE **arr, int row_size)
{
    for(int i = 0; i < row_size; i++)
    {
        free(arr[i]); // Free individual structures
    }
    free(arr); // Free the array of pointers
}

void Menu(STORE **store_array_ptr, int row_size)
{
    // ... Menu logic using switch case for Add, Display, Modify, Quit ...
}

void Modify(STORE **store_array_ptr, int row_size)
{
    // Logic to find book by ID (modIndex) and modify selected field
    int bide = -1;
    // ... search loop ...
    if (bide != -1)
    {
        // ... submenu to modify bname, price, or aname ...
    }
}

void accept(STORE **store_array_ptr, int size)
{
    // Logic to accept book details from user
    for(int i = 0; i < size; i++)
    {
        // Use scanf and fgets/strtok/getchar for safer input handling
        // ...
    }
}

int main()
{
    // ... allocation, call to Menu, and deallocation ...
}
```



-----

## 23\. `structBook.c`: Book Structure with GST Calculation 📚

This program defines a `Book` structure to hold details including price and a calculated price with GST. The provided implementation, however, contains several .

-----

### Explanation

  * **Structure Definition:** The `Book` structure holds `bid`, `bname`, `aname`, `price`, and `price_GST`.
  * **GST Calculation (`cal_price`):** This function correctly calculates the price including 5% GST: `price = price + (price * .05)`.
  

The following snippet shows the **intended logic** with corrected structure member names and array access using the pointer `e`.

```c
#include<stdio.h>
typedef struct Book
{
	int bid;
	char bname[20];
	char aname[20];
	float price;
	float price_GST;
}Book;

float cal_price(float price){	// Price with 5% GST
	return price = price+(price*.05);
}

void Display(Book *e, int size){	// Display Struct
	for(int i=0;i<size;i++){	
		
		printf("ID: %d, Name: %s, Price w/ GST: %.2f\n", 
            e[i].bid, e[i].bname, e[i].price_GST);
	}
}

void accept(Book *e, int size){	// Input for array of struct
	for(int i=0;i<size;i++){	
		printf("Enter ID, Name, and Price for Book %d: ",i+1);
		
	
		scanf("%d%s%f",&e[i].bid,e[i].bname,&e[i].price);
		// Automatically calculate GST price after input
		e[i].price_GST = cal_price(e[i].price); 
	}
}

int main(){
	Book e_arr[3]; // Array of 3 Book structures
	

	accept(e_arr,3); 
	Display(e_arr,3);
	return 0;
}
```

-----

## 24\. `studentStrt.c`: Student Management System (DMA and Topper) 🎓

This program demonstrates managing an array of `Student` structures using **Dynamic Memory Allocation (DMA)**, calculating averages, and identifying the class topper.

-----

### Explanation

  * **Structure Definition:** The `Stud` structure holds `roll_no`, `sname`, an array of 5 `marks`, and the calculated `average`.
  * **DMA Functions:**
      * **`allocate`:** Correctly uses the array-of-pointers method to allocate memory for 5 student records (`Stud** arr`). Each element points to a dynamically allocated `Stud` structure (`Stud*`).
      * **`deallocate`:** Correctly frees the memory by freeing each individual student structure first, then freeing the main array of pointers.
  * **Input and Display:**
      * **`accept`:** Reads roll number, name, and 5 marks for each student. (Note: The mix of `scanf` and `fgets/getchar` for string input is prone to issues but is used for the logic here).
      * **`Display`:** Prints the details, marks, and calculated average for all students.
  * **Average Calculation and Topper (`cal_average`):**
      * Iterates through the array of students.
      * For each student, an inner loop sums the 5 marks.
      * The average is calculated and stored in `arr[i]->average`.
      * Simultaneously, it tracks the `max_avg` and `max_index` to determine and print the **class topper**.

  

```c
#include<stdio.h>
#include<stdlib.h>

typedef struct Student
{
    int roll_no;
    char sname[20];
    int marks[5];
    float average;
} Stud;

Stud** allocate(int size)
{
    // Allocates an array of pointers to Stud structures
    Stud** arr = (Stud**)malloc(size * sizeof(Stud*));
    for(int i = 0; i < size; i++)
    {
        arr[i] = (Stud*)malloc(sizeof(Stud)); // Allocates space for each individual student
    }
    return arr;
}

void deallocate(Stud **arr, int size)
{
    for(int i = 0; i < size; i++)
    {
        free(arr[i]); // Free individual student structure
    }
    free(arr); // Free the array of pointers
}

float cal_average(Stud **arr, int size)
{
    float max_avg = 0.0;
    int max_index = -1;
    
    for (int i = 0; i < size; i++)
    {
        float sum = 0;
        for (int j = 0; j < 5; j++)
        {
            sum += arr[i]->marks[j];
        }
        arr[i]->average = sum / 5.0; // Calculate average

        // Logic to track the topper
        if (arr[i]->average > max_avg)
        {
            max_avg = arr[i]->average;
            max_index = i;
        }
    }
    if (max_index != -1) {
        printf("The topper is %s with an average of %.2f\n", arr[max_index]->sname, max_avg);
    }
    return max_avg;
}

int main()
{
    Stud **arr = NULL;
    int size = 5;

    arr = allocate(size);
    accept(arr, size);
    cal_average(arr, size);
    Display(arr, size);

    deallocate(arr, size); 
    return 0;
}
```

I'll explain the six new C code files, all of which deal with **one-dimensional arrays**. I'll continue the numbering from **25**.

-----

## 25\. `OneD_AlphabetArray.c`: Writing and Displaying Alphabets in a 1D Array 🔠

This program stores all uppercase English alphabets ('A' to 'Z') in a 1D character array and then prints them out.

-----

### Explanation

  * **Array Declaration:** A character array `tab[SIZE]` is declared, where `SIZE` is defined as 26.
  * **`table` Function (Initialization):** This function iterates 26 times. It uses the index `i` plus the ASCII value of 'A' (65) to assign the characters 'A' through 'Z' into the array `tab`.
  * **`display` Function:** This function iterates through the `tab` array and prints each character on a new line.
  * **Usage of Comma Operator:** The assignment `tab[i]=("%c",i+65);` uses the comma operator, which evaluates to the value of the last expression (`i+65`). When assigned to a `char` array, this integer ASCII value is correctly stored as a character.

  

```c
#include<stdio.h>
#define SIZE 26

void table(char*tab,int num)
{
	for(int i=0;i<26;i++)
	{
		// Store uppercase characters (A=65) using ASCII values
		tab[i]=(i+65); 
	}	
}
void display(char tab[])
{
	for(int i=0;i<SIZE;i++)
	{
		printf("%c\n",tab[i]);
	}
}

int main()
{ 
 	char tab[SIZE];
 	// ... function calls ...
 	return 0;
 }
```

-----

## 26\. `Multi_1D.c`: Multiplication Table in a 1D Array ✖️

This program takes a number from the user and calculates its multiplication table (up to 10), storing the results in a 1D integer array.

-----

### Explanation

  * **Input:** The `main` function prompts the user for the base number (`num`) for the multiplication table.
  * **`table` Function (Calculation):** This function takes the result array (`tab`) and the base number (`num`). It iterates 10 times (for $x1$ to $x10$).
      * The product is calculated as `(i+1) * num` and stored in `tab[i]`.
  * **`display` Function:** This function iterates through the `tab` array and prints the result in the standard format: `num x (i+1) = tab[i]`.

  

```c
#include<stdio.h>

void table(int*tab,int num)
{
	// Calculate products from x1 to x10
	for(int i=0;i<10;i++)
	{
		tab[i]=(i+1)*num;
	}	
}
void display(int tab[],int num)
{
	for(int i=0;i<10;i++)
	{
		// Print in the format: num x multiplicand = product
		printf("%dx%d=%d\n",num,i+1,tab[i]);
	}
}

int main()
{ 
 	int num,tab[10];
 	printf("Enter the number you wanna multiply:");
 	scanf("%d",&num);
 	// ... function calls ...
 	return 0;
 }
```

-----

## 27\. `PrimesInArray.c`: Prime Number Checker for Array Elements 💡

This program accepts 5 integers into an array, checks which ones are prime, and stores the prime numbers in a separate array for display.

-----

### Explanation

  * **Input (`accept`):** Takes 5 integer elements from the user into the array `arr`.
  * **Prime Check (`check`):** This is the core logic. It takes the input array (`arr`) and the result array (`prime`).
      * The outer loop iterates through each element of `arr`.
      * The inner loop iterates from $k=2$ up to the number being checked (`arr[i]`).
      * **Divisibility Test:** `if(arr[i]%k==0)`: If the number is perfectly divisible by any $k$ (other than 1 and itself), it is **not prime**.
      * A flag `j` is set to 1 if a divisor is found, and the inner loop breaks.
      * **Storage:** If `j` remains 0 (i.e., the number is prime), `prime[i]` is set to `arr[i]`. Otherwise, `prime[i]` is set to `0`.
  * **Display (`display`):** Prints only the elements in the `prime` array that are not `0`.

  

```c
#include<stdio.h>

void check(int *arr, int *prime)
{	
	
	for(int i=0;i<5;i++)
	{
	    int j=0; // Prime flag (0 = prime, 1 = not prime)
        
        // Loop from 2 up to the number to check for factors
	    for(int k=2;k<(arr[i]);k++)
	    {
		    if(arr[i]%k==0){
			    j=1; // Found a factor, not prime
			    break;
		    }
	    }
	    
		if(j==0)
		{
			prime[i] = arr[i]; // Store the prime number
		}
		else {
		     prime[i]=0; // Store 0 if not prime
		}
	}
}

void display(int prime[])
{
	for(int i=0;i<5;i++)
	{
		if(prime[i] != 0){
		printf("Prime numbers are %d\n",prime[i]);
	    }
	}
}
```

-----

## 28\. `RevOfArray.c`: Reversing a 1D Array 🔄

This program takes 10 integer inputs into an array, reverses the order of the elements, stores the reversed sequence in a second array, and prints the result.

-----

### Explanation

  * **Input:** The `main` function reads 10 integers into the array `arr`.
  * **`display` Function (Reversal and Output):**
      * Note: The function signature is misleadingly named `display` and has its arguments swapped compared to the typical use case, but the logic works. The arguments are treated as: `rev` (the input array `arr`) and `arr` (the output array `rev`).
      * **Reversal Logic:** The core operation is `rev[i]=arr[9-i];`. Since the arrays are indexed from 0 to 9:
          * When $i=0$, `rev[0] = arr[9]` (last element).
          * When $i=9$, `rev[9] = arr[0]` (first element).
      * This calculation correctly maps the elements from `arr` into `rev` in reverse order. The result is printed during the mapping process.

  

```c
#include<stdio.h>

void display(int *arr, int *rev) // Re-labeled arguments for clarity in explanation
{
    // The original code passed (arr, rev) but the function signature used (rev, arr).
    // The logic below reflects the actual reversal operation:
 	for(int i =0;i<10;i++)
 	{
 		// Reverse logic: element at index i gets the value from index (9-i)
 		rev[i]=arr[9-i]; 
 		printf("%d ",rev[i]);
 	}
 	
}

int main()
{ 
 	int rev[10];
 	int arr[10];
 	// ... input loop ...
 	display(arr,rev); // Passing arr (source) and rev (destination)
 	return 0;
 }
```

-----

## 29\. `Factorial_Array.c`: Calculating Factorials and Storing in an Array ❗

This program calculates the factorials of numbers 2 through 7 and stores these 6 results in a 1D integer array.

-----

### Explanation

  * **`fact` Function (Calculation):**
      * The outer loop iterates `i` from 2 to 7 (the numbers whose factorials are needed).
      * Inside, the inner loop calculates the factorial of `i` using a running product `n`.
      * **Storage:** The result `n` is stored in `tab[i-2]`. This maps the factorial of 2 to index 0, factorial of 3 to index 1, and so on, filling the `tab[6]` array.
  * **`display` Function:** Prints the 6 calculated factorial values.

  

```c
#include<stdio.h>

void fact(int*tab)
{	
	// Outer loop: Calculate factorial for numbers 2 through 7
	for(int i=2;i<=7;i++)
	{
		int n=1; // Holds the current factorial result
        
		// Inner loop: Standard factorial calculation (j! = j * (j-1) * ...)
		for(int j=i;j>0;j--){	
			n=n*j;
		}
		// Store result in the array: fact(2) -> tab[0], fact(3) -> tab[1], etc.
		tab[i-2]=n;
	}
}

void display(int tab[])
{
	for(int i=0;i<6;i++)
	{
		printf("facts are %d\n",tab[i]);
	}
}
```

-----

## 30\. `MaxMinOfArray.c`: Finding Maximum and Minimum in a 1D Array 📏

This program takes 10 integers and attempts to find the maximum and minimum values, storing them in a `maxmin[2]` array.

-----

### Explanation

  * **Input:** The `main` function reads 10 integers into the array `tab`.
  * **`maxMin` Logic:** The function uses **nested loops** to find the max/min.
      * This approach compares *every element* (`tab[i]`) with *every other element* (`tab[j]`).
      
      * **Logic** : Initialize `max` and `min` to the first element (`tab[0]`) and then iterate through the array once (a single `for` loop), comparing each element to the current `max` and `min`.
  * **Output:** The `display` function prints the max and min values.

  

The snippet below shows the code for finding the maximum and minimum elements.

```c
#include<stdio.h>

//  function to find Max and Min in a single pass
void maxMin(int*tab,int*maxmin)
{	
    // Initialize max and min to the first element
	int max = tab[0];
	int min = tab[0];
	
	for(int i=1;i<10;i++)
	{
		if(tab[i] > max){
			max = tab[i];
		}
		if(tab[i] < min){
			min = tab[i];
		}
	}
    
    // Store results
	maxmin[0]=max;
	maxmin[1]=min;
}

void display(int maxmin[])
{	
	printf("max and min are:");
	for(int i=0;i<2;i++)
	{
		printf("\t%d",maxmin[i]);
	}printf("\n");
}

int main()
{ 
 	// ... input loop and function calls ...
 	return 0;
 }
```

-----

## 31\. `countingAlpha.c`: Counting All Alphabet Occurrences 🔠

This program reads a sentence from the user and counts the frequency of every single uppercase and lowercase English alphabet.

-----

### Explanation

  * **Input Handling:** `fgets(str, 20, stdin)` reads the input sentence (up to 19 characters + null terminator) into the `str` array.
  * **Counters:** Two integer arrays, `upper_counts[26]` and `lower_counts[26]`, are initialized to zero. Index 0 corresponds to 'A'/'a', index 1 to 'B'/'b', and so on.
  * **Counting Logic:** The `while` loop iterates through the string.
      * **Uppercase:** If `str[i]` is between 'A' (ASCII 65) and 'Z' (ASCII 90), its index is calculated using **`current_char - 'A'`**. For example, 'C' - 'A' = 2, incrementing `upper_counts[2]`.
      * **Lowercase:** Similarly, the index for a lowercase character is calculated using **`current_char - 'a'`**.
  * **Output:** The final `for` loop iterates 26 times to print the count for all 26 uppercase and 26 lowercase letters, pairing them side-by-side.

  

```c
#include <stdio.h>

int main() {
    char str[20];
    int upper_counts[26] = {0};
    int lower_counts[26] = {0};
    // ... Input handling ...
    
    // Counting logic
    int i = 0;
    while (str[i] != '\0') {
        char current_char = str[i];
        if (current_char >= 'A' && current_char <= 'Z') {
            // Calculate index (0 for A, 1 for B, etc.)
            upper_counts[current_char - 'A']++;
        }
        else if (current_char >= 'a' && current_char <= 'z') {
            lower_counts[current_char - 'a']++;
        }
        i++;
    }
    
    // Output logic
    printf("Alphabet Occurrences:\n");
    for (i = 0; i < 26; i++) {
        // Print 'A'+i count and 'a'+i count
        printf("%c: %d\t%c: %d\n", 'A' + i, upper_counts[i],'a'+i,lower_counts[i]);
    }

    return 0;
}
```

-----

## 32\. `countSpaces.c`: Counting Spaces in a String ⬜

This is a simple program that reads a string from the user and counts the total number of space characters (`' '`) present.

-----

### Explanation

  * **Input:** The `main` function reads input using `fgets(str, 20, stdin)`.
  * **`countSpace` Logic:** This function iterates through the input string (`str`) until it hits the null terminator (`\0`).
      * An `if` condition checks if the current character `str[i]` is a space character (`' '`).
      * A counter (`count`) tracks the number of spaces found.
  * **Output:** The total number of spaces is printed.

  

```c
#include<stdio.h>

int countSpace(char *str)
{ 
  int count = 0;
  for(int i =0;str[i]!='\0';i++){
    if(str[i]==' '){ // Check for space character
      count++;
    }
  }
  printf("There are %d spaces\n",count);
}

int main()
{
  char str[20];
  fgets(str,20,stdin);
  countSpace(str);
  return 0;
}
```

-----

## 33\. `countVows.c`: Counting Vowel Occurrences 🎤

This program reads a string and counts the frequency of each individual vowel, considering both uppercase and lowercase.

-----

### Explanation

  * **Input:** The `main` function reads input using `fgets`.
  * **Counters:** An array `arr[10]` is used to store the counts for the 10 possible vowels:
      * Indices 0-4: Lowercase 'a', 'e', 'i', 'o', 'u'.
      * Indices 5-9: Uppercase 'A', 'E', 'I', 'O', 'U'.
  * **Counting Logic (`countSpace`):** The function iterates through the string. A long chain of `if-else if` statements checks the current character `c` against each of the 10 vowels and increments the corresponding counter in the `arr` array.
  * **Output:** The final `printf` statement prints the counts for each pair of uppercase/lowercase vowels (e.g., A/a, E/e, etc.).

  

```c
#include<stdio.h>

int countSpace(char *str)
{ 
  // arr[0-4] for a,e,i,o,u; arr[5-9] for A,E,I,O,U
  int arr[10]={0}; 
  
  for(int i =0;str[i]!='\0';i++){
    char c =str[i];
    // Check against all 10 possible vowel characters and increment the specific counter
    if(c=='A'){ arr[5]+=1; }
    else if(c=='E'){ arr[6]+=1; }
    // ... (rest of the checks for I, O, U, a, e, i, o, u) ...
    else if(c=='u'){ arr[4]+=1; }
  }
  
  // Print results: A/a, E/e, I/i, O/o, U/u
  printf("A\t%d\ta\t%d\nE\t%d\te\t%d\nI\t%d\ti\t%d\nO\t%d\to\t%d\nU\t%d\tu\t%d\n",
         arr[5],arr[0],arr[6],arr[1],arr[7],arr[2],arr[8],arr[3],arr[9],arr[4]);
}
```

-----

## 34\. `toggleStr.c`: Toggling Case of a String  🔡

This program attempts to read a string and toggle the case of all alphabetic characters (uppercase to lowercase, and vice versa). 

-----

### Explanation

  * **Input:** The `main` function reads a string using `fgets`.
  * **Logic (`countSpace`):** The function toggles the case by using ASCII values (65-90 for uppercase, 97-122 for lowercase).
      
      * **Logic:** The difference between an uppercase and lowercase letter is 32 (e.g., 'a' - 'A' = 32). The code intends to add 32 to an uppercase character's ASCII value to get lowercase, and subtract 32 from a lowercase character's ASCII value to get uppercase.
 
  

```c
#include<stdio.h>

// Corrected function to toggle the case of characters in a string
void toggleCase(char *str)
{ 
  for(int i = 0; str[i] != '\0'; i++){
    char c = str[i];
    
    // Check if Uppercase (ASCII 65 to 90)
    if(c >= 'A' && c <= 'Z'){
      // Convert to Lowercase: Add 32 to ASCII value
      str[i] = c + 32;
    } 
    // Check if Lowercase (ASCII 97 to 122)
    else if(c >= 'a' && c <= 'z'){
      // Convert to Uppercase: Subtract 32 from ASCII value
      str[i] = c - 32;
    }
    // Non-alphabetic characters (like spaces, digits) remain unchanged
  }
  printf("The toggled string is %s\n", str);
}

int main()
{
  char str[20];
  printf("Enter a string: ");
  fgets(str, 20, stdin);
  toggleCase(str); // Call the corrected function
  return 0;
}
```

-----

## 35\. `StringMenuDriven.c`: Menu-Driven String Operations 🛠️

This program provides a menu for the user to perform five common string operations without using standard C library string functions (like `strlen`, `strcpy`, etc.).

-----

### Explanation

  * **Main Menu:** The `main` function runs an infinite `while(1)` loop, prompting the user for a choice (1-6) and using a `switch` statement to call the relevant function. Choice 6 quits the program.
  * **Functions:**
      * **`len()`:** Calculates the **length** of a string by counting characters until `\0`. It prints `count-1` because `fgets` includes the newline character (`\n`) in the count.
      * **`cpy()`:** **Copies** the second input string (`str1`) into the first string (`str`) character by character.
      * **`cat()`:** **Concatenates** the second string (`str1`) onto the end of the first string (`str`). It first finds the end of `str` (index `i`), then copies `str1` starting from index `i`. It must handle the newline character (`\n`) added by `fgets` correctly to prevent it from appearing in the output.
      * **`rev()`:** **Reverses** a string. It finds the length of the string, iterates backward from the end (`i--`) and forward from the start (`j++`), copying characters from the source (`str`) to the result array (`rev`).
      * **`compare()`:** **Compares** two strings character by character. It stops when characters differ or both reach `\0`. If the difference `(str[i] - str1[i])` is 0 (meaning the loop ended at `\0` for both), the strings are identical; otherwise, they are different.

  

```c
#include<stdio.h>

int len()
{ 
  // Calculates length manually by counting up to '\0'
  char str[20];
  printf("Enter string to check length:\n");
  fgets(str,20,stdin);
  int count = 0;
  for(int i=0;str[i]!='\0';i++){
    count+=1;
  }
  printf("Length is %d\n",count-1); // Subtract 1 for the '\n' from fgets
  return count;
}

void cpy(){
  // Copies str1 into str
  char str[20];
  char str1[20];
  // ... Input handling ...
  int i = 0;
  while(str1[i]!='\0'){
    str[i]=str1[i];
    i++;
  }
  str[i] = '\0'; // Ensure the destination string is null-terminated
  printf("%s",str);
}

char cat(){
  // Concatenates str1 onto str
  char str[20];
  char str1[20];
  // ... Input handling ...
  int i = 0;
  // Find the position before the '\n' in str (end of the actual content)
  while (str[i] != '\n')
      i++;  
  
  // Copy characters from str1 (excluding its '\n') to str
  int j = 0;  
  while (str1[j] != '\n') {      
      str[i] = str1[j];        
      i++;
      j++;
    }
  str[i] = '\0'; // Terminate the resulting string
  printf("Concatenated string is %s\n",str);
}

char rev(){
  // Reverses a string
  char str[20];
  char rev[20];
  // ... Input handling ...
  int n,i = 0,j = 0;
  // Find the length/position of '\0' (i)
  while (str[i] != '\0')
      i++;  
 
  n=i; // Total length
  i--; // Start from the character before '\0' (which is usually '\n' from fgets)
  
  while (str[j] != '\0') {      
      rev[j] = str[i]; // Copy backward
      i--;
      j++;
    }
  rev[n] = '\0'; // Terminate the reversed string
  printf("The reversed string is:%s\n",rev);
  }
  
char compare(){
  // Compares two strings
  char str[20];
  char str1[20];
  // ... Input handling ...
   int i = 0;
    while (str[i] == str1[i]) {
        if (str[i] == '\0' && str1[i] == '\0') break;
        i++;
    }
    if((str[i] - str1[i])==0){
      printf("Identical\n");
    }else{
      printf("Different\n");
    }
}
```




-----

## 36\. `areaCir.c`: Area and Circumference Calculation (Pointers) ⭕

This program calculates the area and circumference of a circle given its radius, using pointers to return both results from a single function.

-----

### Explanation

  * **Constants:** The constant `PI` is defined as `3.14f` (a floating-point value).
  * **Input:** The `main` function takes the `radius` as an integer.
  * **Function Signature:** `void areaCir(int r, int *ar, int *cir)`: The function takes the radius by value and pointers to `area` and `circumference` variables.
  * **Calculation:** The function performs the standard calculations:
      * `*ar = PI * r * r;` (Area)
      * `*cir = 2 * PI * r;` (Circumference)
      * **Note:** Since `area` and `circumference` are declared as `int` in `main`, the floating-point results of the calculation are **truncated** when assigned back through the pointers.

  

```c
#include <stdio.h>
#define PI 3.14f

void areaCir(int r,int *ar,int *cir){
    // *ar and *cir are pointers used to write the results back to main
	*ar = PI*r*r;   // Calculates Area (truncated to int)
	*cir = 2*PI*r;  // Calculates Circumference (truncated to int)
}

int main(){
	int radius,area,cir;
	printf("Enter the Radius:");
	scanf("%d",&radius);
	areaCir(radius,&area,&cir);
	printf("The area is %d and the circumference is %d\n",area,cir);
}
```

-----

## 37\. `divrem.c`: Division and Remainder Calculation (Pointers) ➗

This program takes a dividend and a divisor, performs the division, and returns both the quotient and the remainder using pointers.

-----

### Explanation

  * **Function Signature:** `void divrem(int divident, int divisor, int *Rem, int *Quo)`: The function receives the two operands by value and pointers to the result variables.
  * **Calculation:**
      * `*Rem = divident % divisor;` calculates the **remainder** using the modulo operator.
      * `*Quo = divident / divisor;` calculates the **quotient** using integer division.
  * **Pointers:** The `main` function passes the addresses of `Rem` and `Quo` (`&Rem`, `&Quo`), allowing the `divrem` function to directly update these variables.

  

```c
#include <stdio.h>

void divrem(int divident ,int divisor,int *Rem,int *Quo)
{
    // Use the modulo operator to calculate and assign the remainder
	*Rem=divident%divisor;
    // Use integer division to calculate and assign the quotient
	*Quo=divident/divisor;
}

int main(){
	int divident,divisor;
	int Rem,Quo;
	printf("Enter the divident and divisor:");
	scanf("%d%d",&divident,&divisor);
	// Pass addresses (&Rem, &Quo) to receive the results
	divrem(divident,divisor,&Rem,&Quo);
	printf("The Quotient is %d and the Remainder is %d\n",Quo,Rem);
}
```

-----

## 38\. `evenOddSum.c`: Sum of Even and Odd Numbers up to a Limit (Pointers) ⚖️

This program calculates the total sum of even numbers and the total sum of odd numbers within a given limit, returning both sums via pointers.

-----

### Explanation

  * **Function Signature:** `void evenOdd(int limit, int *evenSum, int *Oddsum)`: The function takes the upper limit by value and pointers for the two resulting sums.
  * **Calculation:** The function uses a `for` loop to iterate from 0 up to (but not including) the `limit`.
      * **Check:** `if (i % 2 == 0)` determines if the current number `i` is even.
      * **Accumulation:** The even sum (`*evenSum`) or odd sum (`*Oddsum`) is accumulated accordingly.
  * **Initialization:** The function ensures that `*evenSum` and `*Oddsum` are explicitly initialized to 0, which is good practice.

  

```c
#include <stdio.h>

void evenOdd(int limit,int *evenSum,int *Oddsum){
	// Initialize the sums via pointers
	*evenSum=0;*Oddsum=0;
    
	for(int i = 0;i<limit;i++){
		if(i%2==0)
			*evenSum=*evenSum+i; // Accumulate even sum
		else
			*Oddsum=*Oddsum+i; // Accumulate odd sum
	}
}

int main(){
	int limit,evenSum,Oddsum;
	printf("Enter the limit:");
	scanf("%d",&limit);
	evenOdd(limit,&evenSum,&Oddsum);
	printf("The Even Sum is %d and the Odd Sum is %d\n",evenSum,Oddsum);
}
```

-----

## 39\. `squbePointer.c`: Square and Cube Calculation (Pointers)  cubed

This program calculates the square and cube of a single number, demonstrating how to use pointers to return two calculated results from one function.

-----

### Explanation

  * **Function Signature:** `void sqube(int num1, int *square, int *cube)`: Takes the input number by value and pointers to the result variables.
  * **Calculation:**
      * `*square = num1 * num1;` calculates and assigns the square.
      * `*cube = num1 * num1 * num1;` calculates and assigns the cube.
  * **Pointers:** The `main` function passes the addresses of its local variables `square` and `cube` (`&square`, `&cube`), allowing the `sqube` function to modify them directly.

  

```c
#include <stdio.h>

void sqube(int num1,int *square,int *cube){
    // Dereference the pointers to store the calculated values
	*square = num1*num1;
	*cube = num1*num1*num1;
}

int main(){
	int num1,square,cube;
	printf("Enter the number:");
	scanf("%d",&num1);
	// Pass the addresses (&square, &cube)
	sqube(num1,&square,&cube);
	printf("The square and cube are:%d,%d\n",square,cube);
	return 0;
}
```

-----

## 40\. `swapPointer.c`: Swapping Two Numbers (Bitwise XOR) 🔁

This program swaps the values of two integer variables using a separate function, employing the efficient **bitwise XOR operator** instead of a temporary variable.

-----

### Explanation

  * **Swap Method:** The `swap` function uses the mathematical properties of the **Bitwise XOR operator (`^`)** to swap the values of `*num1` and `*num2` without needing a third temporary variable.
    1.  `*num1 = (*num1) ^ (*num2);` // `*num1` now holds the sum (XOR) of the original values.
    2.  `*num2 = (*num1) ^ (*num2);` // `*num2` now holds the original value of `*num1`.
    3.  `*num1 = (*num1) ^ (*num2);` // `*num1` now holds the original value of `*num2`.
  * **Pointers:** The addresses of `num1` and `num2` are passed from `main`, ensuring the function modifies the original variables.

  

```c
#include <stdio.h>

void swap(int *num1,int *num2){
    // Swap using the Bitwise XOR (^) operator, avoiding a temporary variable
	*num1 = (*num1)^(*num2);
	*num2 = (*num1)^(*num2); // *num2 now holds the original value of *num1
	*num1 = (*num1)^(*num2); // *num1 now holds the original value of *num2
}

int main(){
	int num1,num2;
	printf("Enter 2 numbers:");
	scanf("%d %d",&num1, &num2);
	swap(&num1,&num2); // Pass addresses to modify the original variables
	printf("Swapped numbers are:%d,%d\n",num1,num2);
	return 0;
}
```

-----

## 41\. `MaxMinOf3.c`: Maximum and Minimum of Three Numbers (Pointers) 🥇

This program finds the maximum and minimum among three user-provided integers, returning both results using pointers.

-----

### Explanation

  * **Function Signature:** `void maxMin(int n1, int n2, int n3, int *max, int *min)`: Receives the three numbers by value and pointers for the max/min results.
  * **Logic:** The function uses cascaded `if-else if` statements to determine the maximum and the ternary operator (`? :`) to find the minimum between the two remaining numbers.
      * **If `n1` is Max:** `*min` is the lesser of `n2` and `n3`.
      * **If `n2` is Max:** `*min` is the lesser of `n1` and `n3`.
      * **If `n3` is Max:** `*min` is the lesser of `n1` and `n2`.
  * **Pointers:** `main` passes the addresses of `Max` and `Min`, allowing the function to write the results back.

  

```c
#include <stdio.h>

void maxMin(int n1,int n2,int n3,int*max,int*min){
	if(n1>n2&&n1>n3){
		*max = n1;
		*min = (n2>n3)?n3:n2; // If n2 > n3, min is n3, else n2
	 }else if(n2>n1&&n2>n3){
	 	*max = n2;
	 	*min = (n1>n3)?n3:n1; // If n1 > n3, min is n3, else n1
 	}else{ // n3 is max or they are equal
 		*max = n3;
 		*min = (n2>n1)?n1:n2; // If n2 > n1, min is n1, else n2
	}
}

int main(){
	int num1,num2,num3;
	int Max,Min;
	printf("Enter 3 numbers to find min and max");
	scanf("%d%d%d",&num1,&num2,&num3);
	maxMin(num1,num2,num3,&Max,&Min);
	printf("min is %d and max is %d\n",Min,Max);
	return 0;
}
```

-----

## 42\. `FactorialExponent.c`: Factorial and Exponent Calculation (Pointers) ⚡

This program calculates the factorial of a number and the exponent (power) of the same number, utilizing two separate functions that return their results via pointers.

-----

### Explanation

  * **Function Signatures:**
      * `void fact(int num, int *fac)`: Calculates factorial.
      * `void powe(int num, int exp, int *po)`: Calculates exponent (power).
  * **Factorial (`fact`):** Uses a `while` loop to iteratively multiply `*fac` by `num`, decrementing `num` until it reaches 0.
  * **Exponent (`powe`):** Uses a `for` loop that iterates `exp` times, multiplying `*po` by the base number `num` in each iteration.
  * **Initialization:** The `main` function initializes `fac` and `po` to 1 before passing their addresses to the functions, ensuring the multiplicative accumulation starts correctly.

  

```c
#include <stdio.h>

void fact(int num,int *fac)
{
	// Calculate factorial iteratively
	while(num>0){
		*fac=*fac*num;
		num=num-1;
	}
}

void powe(int num ,int exp ,int *po)
{
 	// Calculate num^exp iteratively
 	for(int i = 1;i<=exp;i++){
 		*po = num*(*po);
 	}
}

int main()
{
	int num,exp;
	int fac=1,po=1; // Initialize results to 1
	printf("Enter the Number for factorial and Exponent");
	scanf("%d %d",&num,&exp);
	fact(num,&fac);
	powe(num,exp,&po);
	printf("Factorial and Exponent is %d\t%d\n",fac,po);
	return 0;
}
```



-----

## 43\. `sumMacro.c`: Summation using a Simple Macro ➕

This program defines a simple macro to calculate the sum of two integers.

-----

### Explanation

  * **Macro Definition:** The `#define SUM(n1, n2) n1 + n2` macro performs simple addition. When the code is compiled, the preprocessor replaces every instance of `SUM(n1, n2)` with `n1 + n2`.
  * **Usage:** In `main`, `sum = SUM(n1, n2);` becomes `sum = n1 + n2;`.
  * **Note on Safety:** While simple, this macro doesn't use parentheses, which can lead to unexpected results if expressions are passed as arguments (e.g., `SUM(a+1, b)` becomes `a+1+b`). For safety, macros should typically enclose arguments and the entire definition in parentheses.

  

```c
#include <stdio.h>
#define SUM(n1,n2) n1+n2

int main(){
	int n1,n2,sum;
	printf("Enter 2 numbers to add:");
	scanf("%d%d",&n1,&n2);
	sum= SUM(n1,n2); // Replaced by: sum = n1 + n2;
	printf("The Sum is %d\n",sum);
	return 0;
}
```

-----

## 44\. `multiMac.c`: Multiplication using a Simple Macro ✖️

This program defines a simple macro to calculate the product of two integers.

-----

### Explanation

  * **Macro Definition:** The `#define MULTI(n1, n2) n1 * n2` macro performs multiplication. The preprocessor substitutes the macro call with the defined text.
  * **Usage:** In `main`, `sum = MULTI(n1, n2);` becomes `sum = n1 * n2;`.
  * **Note on Safety:** Like the summation macro, this one lacks parentheses. If called as `MULTI(a+1, b)`, it expands to `a+1*b`, which calculates multiplication first, potentially leading to incorrect arithmetic precedence.

  

```c
#include <stdio.h>
#define MULTI(n1,n2) n1*n2

int main(){
	int n1,n2,sum;
	printf("Enter 2 numbers to multiply:");
	scanf("%d%d",&n1,&n2);
	sum= MULTI(n1,n2); // Replaced by: sum = n1 * n2;
	printf("The Product is %d\n",sum);
	return 0;
}
```

-----

## 45\. `max2macro.c`: Finding the Maximum of Two Numbers 🥇

This program uses a macro that implements the **ternary (conditional) operator** to find the maximum of two numbers.

-----

### Explanation

  * **Macro Definition:** The `#define MAX(n1, n2) (n1 > n2) ? n1 : n2` macro uses the ternary operator to return `n1` if it's greater than `n2`, otherwise it returns `n2`.
  * **Usage:** `result = MAX(n1, n2);` is replaced by the conditional expression.
  * **Note on Safety:** The entire expression is enclosed in parentheses, which is good practice to prevent precedence issues when used in larger expressions.

  

```c
#include <stdio.h>
#define MAX(n1,n2) (n1>n2)?n1:n2

int main(){
	int n1,n2, result;
	printf("Enter 2 numbers to compare:");
	scanf("%d%d",&n1,&n2);
	result = MAX(n1,n2); // Replaced by: result = (n1 > n2) ? n1 : n2;
	printf("The Max is %d\n",result);
}
```

-----

This explanation focuses on the C code you provided, which defines a macro to find the maximum of three numbers.

-----

## 46\. `max3macro.c`: Finding the Maximum of Three Numbers 🏆

This program uses a preprocessor macro to efficiently find the largest of three user-input numbers using nested ternary operators.

-----

### Explanation

  * **Macro Definition (`MAX`):** The program uses a corrected macro to ensure accurate results. It uses nested ternary operators (`? :`) to perform a conditional comparison:
      * **Outer Check:** `(n1 > n2)`
      * **If True (n1 is greater than n2):** The macro compares $n1$ against $n3$: `(n1 > n3) ? n1 : n3`. The larger of these two is the maximum.
      * **If False (n2 is greater than or equal to n1):** The macro compares $n2$ against $n3$: `(n2 > n3) ? n2 : n3`. The larger of these two must be the maximum.
  * **Preprocessor Action:** The C preprocessor replaces the macro call `MAX(n1, n2, n3)` with the full, highly parenthesized comparison expression before compilation. This is a common way to simulate inline functions for simple logic in C.

### README Snippet

```c
#include <stdio.h>

// logic: If n1 > n2, compare n1 with n3. Else, compare n2 with n3.
#define MAX(n1,n2,n3) ((n1>n2)?((n1>n3)?n1:n3):((n2>n3)?n2:n3))

int main(){
	int n1,n2,n3 ,result;
	printf("Enter 3 numbers to compare:");
	scanf("%d%d%d",&n1,&n2,&n3);
    
	// Macro call replaced by the complex ternary expression
	result = MAX(n1,n2,n3); 
    
	printf("The Max is %d\n",result);
	return 0;
}
```

## 47\. `chechAlph.c`: Character Alphabet Check Macro ✔️

This program uses a macro to check if a given character is an alphabet (uppercase or lowercase) based on its ASCII value.

-----

### Explanation

  * **Macro Definition:** `#define CHALPHA(n) ((n>=65 && n<91)||(n>=97 && n<123))`
      * It checks two conditions separated by the logical OR (`||`):
        1.  **Uppercase:** ASCII range 65 ('A') to 90 ('Z'). Note: The original condition should be `n<=90` instead of `n<91`.
        2.  **Lowercase:** ASCII range 97 ('a') to 122 ('z'). Note: The original condition should be `n<=122` instead of `n<123`.
  * **Input:** The `main` function reads a single character (`n`) using `%c`.
  * **Output:** The result of the macro (0 or 1) determines whether "Valid" or "Invalid" is printed.

 

```c
#include <stdio.h>
// Using <= 90 and <= 122 for correct range inclusion.
#define CHALPHA(n) ((n>=65 && n<=90)||(n>=97 && n<=122))

int main(){
	int res;
	char n;
	printf("Enter character to check:");
	scanf("%c",&n);
	res= CHALPHA(n);
	if(res)
		printf("Valid\n");
	else
		printf("Invalid\n");
	return 0;
}
```

-----

## 48\. `square_macro_cube.c`: Nested Macros for Square and Cube 🧮

This program defines a macro for calculating the square and then uses that square macro to define the cube macro, demonstrating macro nesting.

-----

### Explanation

  * **`SQUA` Macro:** `#define SQUA(num) num * num` calculates the square.
  * **`CUBE` Macro:** `#define CUBE(num) SQUA(num) * num` calculates the cube by reusing the `SQUA` macro and multiplying the result by `num`.
  * **Expansion:** For `CUBE(5)`:
    1.  Preprocessor sees `CUBE(5)`.
    2.  Expands to `SQUA(5) * 5`.
    3.  Expands to `5 * 5 * 5`.
  * **Note on Safety:** While the nesting is neat, the macros lack parentheses, making them unsafe for arguments that are expressions (e.g., `SQUA(a+b)` expands to `a+b*a+b`).

  

```c
#include <stdio.h>
#define SQUA(num) num*num
#define CUBE(num) SQUA(num)*num // CUBE macro reuses SQUA macro

int main(){
	int num ,sq,cu;
	printf("Enter one number to find square and cube of:");
	scanf("%d",&num);
	sq = SQUA(num); // Expands to: sq = num * num;
	cu=CUBE(num);  // Expands to: cu = num * num * num;
	printf("The Square and the Cube is %d\t%d\n",sq,cu);
	
	return 0;
}
```

-----

## 49\. `macros.h`: Geometry Formulas Header File 📐

This file is a custom header containing macros for calculating the area and perimeter/circumference of various geometric shapes. This file is intended to be included in other C programs.

-----

### Explanation

The file defines several macros, using their intended formula names:

| Macro Name | Definition | Purpose |
| :--- | :--- | :--- |
| `AREAC(PI, r)` | `PI * r * r` | Area of a **Circle** |
| `AREASQ(l)` | `l * l` | Area of a **Square** |
| `AREAREC(l, b)` | `l * b` | Area of a **Rectangle** |
| `AREATRI(l, b)` | `0.5 * l * b` | Area of a **Triangle** (l=altitude, b=base) |
| `PERIC(PI, r)` | `2 * PI * r` | **Circumference** of a Circle |
| `PERISQ(l)` | `4 * l` | Perimeter of a **Square** |
| `PERIREC(l, b)` | `l * b` | Perimeter of a **Rectangle** |
| `PERITRI(l)` | `3 * l` | Perimeter of a **Triangle** (Assuming equilateral) |





```c
// macros.h - Custom Header File for Geometry Calculations

// Area Macros
#define AREAC(PI,r) (PI)*(r)*(r)
#define AREASQ(l) (l)*(l)
#define AREAREC(l,b) (l)*(b)
#define AREATRI(l,b) 0.5*(l)*(b) // l=altitude, b=base

// Perimeter/Circumference Macros
#define PERIC(PI,r) 2*(PI)*(r)
#define PERISQ(l) 4*(l)
// Corrected Perimeter of a Rectangle formula
#define PERIREC(l,b) 2*((l)+(b)) 
#define PERITRI(l) 3*(l) // Perimeter of an equilateral triangle
```

-----

## 50\. `menuMacro.c`: Menu-Driven Geometry Calculator 📐

This program uses a menu and includes the definitions from `macros.h` to calculate the area and perimeter/circumference of various shapes based on user choice.

-----

### Explanation

  * **Inclusion:** It includes the geometry macros via `#include "macros.h"` and defines `PI`.
  * **Menu Logic:** An infinite `while(1)` loop presents shape options (Circle, Square, Rectangle, Triangle). A `switch` statement handles the user's choice.
  * **Macro Usage:**
      * For **Circle (case 1)**, it uses `AREAC` and `PERIC`.
      * For **Square (case 2)**, it uses `AREASQ` and `PERISQ`.
      * For **Rectangle (case 3)**, it uses `AREAREC` and `PERIREC`.
      * For **Triangle (case 4)**, it uses `AREATRI` and `PERITRI`.
  * **Type Truncation:** Note that since all result variables (`area`, `peri`) are `int`, the floating-point results from macros like `AREAC` and `AREATRI` will be **truncated** to integers.

  

```c
#include <stdio.h>
// Include the custom header file with geometry macros
#include "macros.h" 
#define PI 3.14f

int main() {
    // ... Menu loop ...
    
    switch(userin){
        case 1:
            // Circle: AREA = PI*r*r, PERI = 2*PI*r
            area = AREAC(PI,l);
            peri = PERIC(PI,l);
            printf("The area of circle %d peri is %d\n",area,peri);
            break;
        case 3:
            //Rectangle: AREA = l*b, PERI = 2*(l+b)
            printf("Enter length and breadth:");
            scanf("%d%d",&l,&b);
            area = AREAREC(l,b);
            // This will output the peri to the macro definition in macros.h
            peri = PERIREC(l,b); 
            printf("The area of rectangle %d peri is %d\n",area,peri);
            break;
        // ... other cases ...
    }
    // ... quit logic ...
}
```


-----

## 51\. `a2zrecur.c`: Printing A to Z Recursively 🔠

This program prints the uppercase English alphabet from 'A' to 'Z' using a recursive function based on ASCII values.

-----

### Explanation

  * **Base Case:** The recursion stops when the ASCII value `n` is no longer less than 91 (the ASCII value of 'Z' + 1).
  * **Recursive Step:**
    1.  Prints the character corresponding to the current ASCII value `n`.
    2.  Calls `display(n + 1)`, incrementing the ASCII value to move to the next letter.
  * **Initial Call:** `main` starts the process by calling `display(65)` ('A'). The output is printed in forward order (A, B, C, ... Z) because the `printf` statement executes before the recursive call returns.

  

```c
#include <stdio.h>

void display(int n){
	// Base case: Stop when n reaches 91 (past 'Z')
	if(n<91){
	    // Print the character corresponding to the ASCII value
	    printf("%c\n",n); 
	    // Recursive step: Call the function with the next ASCII value
	    display(n+1);
	}else
		return;
}

int main(){
	int n=65; // Start at ASCII for 'A'
	display(n);
	return 0;
}
```

-----

## 52\. `num10recur.c`: Printing N to 1 Recursively ⬇️

This program reads an upper limit $N$ from the user and prints the numbers from $N$ down to 1 using recursion.

-----

### Explanation

  * **Base Case:** The recursion stops when `n` is no longer greater than 0.
  * **Recursive Step:**
    1.  Prints the current number `n`.
    2.  Calls `display(n - 1)`, decrementing the number.
  * **Output Order:** Since the `printf` statement executes **before** the recursive call, the output is printed in **decreasing order** ($N, N-1, \dots, 1$).

  

```c
#include <stdio.h>

void display(int n){
	// Base case: Stop when n reaches 0
	if(n>0){
	    // Print executes before recursion, resulting in N to 1 order
	    printf("%d\n",n); 
	    display(n-1);
	}else
		return;
}

int main(){
	int n;
	printf("Enter Upper Limit:");
	scanf("%d",&n);
	display(n);
	return 0;
}
```

-----

## 53\. `num10revr.c`: Printing 1 to N Recursively (Reverse Order Print) ⬆️

This program reads an upper limit $N$ from the user and prints the numbers from 1 up to $N$ by placing the `printf` statement **after** the recursive call. It also incorrectly attempts to calculate the sum.

-----

### Explanation

  * **Base Case:** The recursion stops when `n` is no longer greater than 0.
  * **Recursive Step:**
    1.  Calls `display(n - 1)` first, generating the sequence.
    2.  Prints the current number `n` **only after** the recursive call returns.
  * **Output Order:** Because the print statement is placed after the recursive call, the sequence unfolds as the function calls return, resulting in output in **increasing order** ($1, 2, \dots, N$).


   (Focusing on Reverse Order Print)

```c
#include <stdio.h>

void display(int n,int sum){
	// Base case: Stop when n reaches 0
	if(n>0){
	    // Note: sum calculation is ineffective as sum is passed by value
	    sum=sum+n; 
	    // Recursive step: Call comes first
	    display(n-1,sum);
	    // Print executes AFTER recursion returns, resulting in 1 to N order
	    printf("%d\n",n); 
	}else
	{	
	    // This prints the sum from the last function call's frame before returning 
	    printf("sum is %d\n",sum);
	}
		return;
}

int main(){
	int n,sum=0;
	printf("Enter Upper Limit:");
	scanf("%d",&n);
	display(n,sum);
	return 0;
}
```

-----

## 54\. `digitSumRe.c`: Sum of Digits Recursively ➕

This program calculates the sum of the digits of a number using recursion.

-----

### Explanation

  * **Base Case:** The recursion stops when the number `num` becomes 0 (meaning all digits have been processed).
  * **Recursive Step:**
    1.  **`rem = num % 10;`**: Extracts the last digit.
    2.  **`num = num / 10;`**: Removes the last digit.
    3.  **`digitSum = digitSum + rem;`**: Adds the digit to the running sum.
    4.  Calls `digitS(num, rem, digitSum)` with the truncated number and the accumulated sum.
  * **(Accumulation):** The logic for digit sum recursion requires returning the sum or passing a pointer.


The following snippet provides the **standard recursive logic** for calculating the sum of digits by **returning the sum**.

```c
#include <stdio.h>

// Standard recursive sum of digits function should return the sum
int digitSumRecursive(int num){
    // Base Case: If number is 0, the sum is 0
    if(num == 0){
        return 0;
    }
    // Recursive Step: Last digit + sum of remaining digits
    else {
        return (num % 10) + digitSumRecursive(num / 10);
    }
}

int main(){
	int num;
	printf("Enter number:");
	scanf("%d",&num);
    int sum = digitSumRecursive(num);
	printf("Sum of digits is %d\n",sum);
    return 0;
}
```

-----

## 55\. `factrecur.c`: Factorial Calculation Recursively ❗

This program attempts to calculate the factorial of a number using recursion.

-----

### Explanation

  * **Base Case:** The recursion stops when `n` is no longer greater than 0.
  * **Recursive Step:**
    1.  Calls `display(n-1, fact)` with the updated (but locally saved) factorial value.
    2.  Prints the current number `n` after the recursive call returns (similar to 1 to N printing).
  * **Logic :** Standard factorial recursion either returns the product or uses an accumulator passed by reference/pointer. The  snippet below uses the standard return method.

The following snippet provides the **standard recursive logic** for factorial calculation by **returning the product**, as the original implementation fails to accumulate the result correctly.

```c
#include <stdio.h>

//Standard recursive factorial function returns the product
int factorial(int n){
	// Base Case: Factorial of 0 is 1
	if(n == 0 || n == 1){
	    return 1;
	}
	// Recursive Step: n * factorial(n-1)
	else {
	    return n * factorial(n - 1);
	}
}

int main(){
	int n;
	printf("Enter Upper Limit:");
	scanf("%d",&n);
    int fact_result = factorial(n);
	printf("Factorial of %d is %d\n", n, fact_result);
	return 0;
}
```

-----

## 56\. `fiborecur.c`: Fibonacci Sequence Recursively (Non-Standard) 🧬

This program generates a Fibonacci sequence up to a given limit using a recursive function in a non-standard, iterative style.

-----

### Explanation

  * **Non-Standard Recursion:** Instead of the typical recursive definition where `fibo(n) = fibo(n-1) + fibo(n-2)`, this implementation uses recursion to repeatedly call itself in an iterative manner.
  * **Logic:** The `display` function simulates the iterative Fibonacci logic within a recursive framework:
    1.  `c=a+b;` (Calculate next term)
    2.  `b=a; a=c;` (Shift terms: `a` becomes previous, `c` becomes current)
    3.  Calls `display(a, b, c, limit)` with the new terms.
  * **Base Case:** The recursion stops when the current term `a` exceeds the user-defined `limit`.
  * **Output Order:** The number `b` is printed **after** the recursive call returns, resulting in the Fibonacci numbers being printed in **reverse order** (largest to smallest) relative to the sequence generated.

  

```c
#include <stdio.h>

void display(int a,int b,int c,int limit){
	
	// Base case: Stop when the current term (a) exceeds the limit
	if(limit>a){
	    // Simulate iterative Fibonacci term calculation
	    c=a+b;
	    b=a;
	    a=c;
	    
	    // Recursive step: Call before print
	    display(a,b,c,limit);
	    
	    // Print executes AFTER recursion returns, resulting in reverse order
	    printf("%d\n",b);
	}else
	{	
	    return;
	}
		
}

int main(){
	int n,a=0,b=1,c=0,limit;
	printf("Enter Upper Limit:");
	scanf("%d",&n);
	limit = n;
    // The first two terms (0 and 1) are usually printed separately if needed
	display(a,b,c,limit); 
	return 0;
}
```

-----

## 57\. `multirecur.c`: Multiplication Table Recursively ✖️

This program generates a multiplication table for a given number (up to $x10$) using recursion.

-----

### Explanation

  * **Base Case:** The recursion stops when `limit` (the multiplier) is no longer greater than 0.
  * **Recursive Step:**
    1.  `fact=n*limit;` calculates the current product.
    2.  Calls `display(n, fact, limit-1)`, decrementing the multiplier.
    3.  Prints the equation `n x limit = fact` after the recursive call returns.
  * **Output Order:** Since the `printf` executes **after** the recursive call, the output is printed in reverse order of calculation: $N \times 1, N \times 2, \dots, N \times 10$. The `main` function initializes `limit` to 10 for the default $x1$ to $x10$ table range.

  

```c
#include <stdio.h>

void display(int n,int fact,int limit){
	// Base case: Stop when limit (multiplier) reaches 0
	if(limit>0){
	    // Calculate the current product
	    fact=n*limit;
	    
	    // Recursive step: Call comes first
	    display(n,fact,limit-1);
	    
	    // Print executes AFTER recursion returns, resulting in x1 to x10 order
	    printf("%dx%d=%d\n",n,limit,fact);
	}else
	{	
	    return;
	}
		
}

int main(){
	int n,fact=1,limit=10;
	printf("Enter the number:");
	scanf("%d",&n);
    // Start with limit=10 to generate table from N*10 down to N*1
	display(n,fact,limit); 
	return 0;
}
```