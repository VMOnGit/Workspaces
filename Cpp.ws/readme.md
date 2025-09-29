

-----

# C++ Code Documentation


## 1\. Complex Class

The `Complex` class represents a complex number with integer `Real` and `Imag` parts.

### Class Definition Snippet

```cpp
class Complex
{
	int Real=1,Imag=1;
	
	public:
		
		Complex() = default; //user-defined
		Complex(int,int);
		int getReal();
		// ... (other accessors and mutators)
		void accept();
		void display();
		
};
```

### Key Functions

| Function | Snippet | Description |
| :--- | :--- | :--- |
| **Parameterized Constructor** | `Complex::Complex(int r,int i){ this->Real=r; this->Imag=i; }` | Initializes `Real` and `Imag` with the provided arguments. |
| **`accept()`** | `void Complex::accept() { cin>>Real>>Imag; }` | Reads new values for the `Real` and `Imag` parts from standard input. |
| **`display()`** | `void Complex::display(){ cout<<"\nComplex::"<<Real<<"+"<<Imag<<"i"<<endl; }` | Prints the complex number in the standard format (e.g., `5+3i`). |

-----

## 2\. Date Class

The `Date` class manages a calendar date and features a **static member** (`new_year`) to demonstrate class-level data sharing.

### Class Definition Snippet

```cpp
class Date
{
	int day=1,month=1,year=1;
	static int new_year;
	public:
		
		Date() = default; //user-defined
		Date(int,int,int);
		int getYear();
		void setYear(int);
		// ... (other accessors and mutators)
		void display();
		void staticDisplay();
		static void setNewYear(int);
		static int getNewYear();
};
// Static member initialization
int Date::new_year = 2025;
```

### Key Functions

| Function | Snippet | Description |
| :--- | :--- | :--- |
| **Static Mutator** | `void Date::setNewYear(int y) { new_year=y; }` | Sets the value of the shared **static member** `new_year`. |
| **Static Display** | `void Date::staticDisplay() { cout<<"\nDate::"<<day<<"/"<<month<<"/"<<new_year<<std::endl; }` | Displays the instance's day/month combined with the **static** `new_year`. |
| **Parameterized Constructor** | `Date::Date(int d,int m,int y) { day=d; month=m; year=y; }` | Initializes all instance members (`day`, `month`, `year`). |

-----

## 3\. Emp Class (Employee)

The `Emp` class manages employee details and uses a static counter (`new_eid`) to automatically assign sequential employee IDs upon construction or acceptance of new data.

### Class Definition Snippet

```cpp
class Emp
{
	int eid=1,salary=1;
	char name[20];
	static int new_eid; // Static counter for auto-ID generation
	public:
		
	Emp(); //user-defined
	Emp(char[],int);
	void display();
    // ... (other functions)
	void setNewEid();
	static int getNewEid();
	
};
// Static member initialization
int Emp::new_eid = 100;
```

### Key Functions

| Function | Snippet | Description |
| :--- | :--- | :--- |
| **`setNewEid()`** | `void Emp::setNewEid() { new_eid++; this->eid = new_eid; }` | Increments the **static ID counter** (`new_eid`) and assigns the new, unique ID to the instance member `eid`. |
| **`accept()`** | `void Emp::accept() { cin>>name>>salary; Emp::setNewEid(); }` | Reads `name` and `salary` and then calls `setNewEid()` to generate and assign the next available ID. |
| **Parameterized Constructor** | `Emp::Emp(char n[20],int sal) { strcpy(name,n); salary=sal; Emp::setNewEid(); }` | Initializes name and salary, and calls `setNewEid()` to assign a unique ID. |

-----

## 4\. Time Class

The `Time` class represents a time using integer components for hour, minute, and second.

### Class Definition Snippet

```cpp
class Time
{
	int hh=1,mm=1,ss=1;
	
	public:
		
		Time() = default; //user-defined
		Time(int,int,int);
		int getHour();
		int getMin();
		// ... (other accessors and mutators)
		void accept();
		void display();
		
};
```

### Key Functions

| Function | Snippet | Description |
| :--- | :--- | :--- |
| **Parameterized Constructor** | `Time::Time(int h,int m,int s){ this->hh=h; this->mm=m; this->ss=s; }` | Initializes all three time components (`hh`, `mm`, `ss`). |
| **`accept()`** | `void Time::accept() { cout<<"\nEnter Time:: "; cin>>hh>>mm>>ss; }` | Prompts the user and reads new values for hour, minute, and second. |
| **`setSec()`** | `void Time::setSec(int s) { this->ss=s; }` | Sets the value of the `ss` (second) component. |
| **`getMin()`** | `int Time::getMin() { return this->mm; }` | Returns the value of the `mm` (minute) component. |

```
```



-----

# C++ Code Documentation (Continued)

## 5\. Area and Perimeter Calculator (Call by Reference) 📐

[cite\_start]This program uses a menu to calculate the area and perimeter/circumference of four geometric shapes (Circle, Rectangle, Square, Triangle) using functions that write their results via **call by reference**[cite: 1].

### Explanation

  * [cite\_start]**Call by Reference:** Functions use integer reference parameters (`int &area`, `int &peri`) to write the calculated results back to the `main` function[cite: 1].
  * [cite\_start]**Constants:** The constant `PI` is defined as `3.14f`[cite: 2].
  * [cite\_start]**Circle (`circAP`):** Calculates area ($\pi r^2$) and circumference ($2\pi r$)[cite: 7].
  * [cite\_start]**Square (`sqAP`):** Calculates area ($l^2$) and perimeter ($4l$)[cite: 9].
  * [cite\_start]**Rectangle (`recAP`):** Calculates area ($l \times b$) and perimeter ($2(l+b)$)[cite: 4, 8].
  * [cite\_start]**Triangle (`triAP`):** Calculates area as $0.5 \times base \times altitude$ and perimeter as $3 \times base$ (implying an equilateral triangle for perimeter calculation)[cite: 6].
  * [cite\_start]**Menu:** A `switch` statement handles the user's choice (1-4) to call the appropriate calculation function or exit (5)[cite: 2, 3, 4, 5, 6, 7].

### Code Snippets

```cpp
void circAP(int radius,const float PI,int &area,int &peri){
	area = PI*radius*radius;
	peri = 2*PI*radius;
[cite_start][cite: 8]}
//
void recAP(int num1,int num2,int &area,int &peri){
	area = num1*num2;
	peri = 2*(num1+num2);
}
//
void sqAP(int num1,int &area,int &peri){
	area = num1*num1;
[cite_start][cite: 9] peri = 4*num1;
}
//
void triAP(int num1,int num2,int &area,int &peri){
	area = 0.5*(num1*num2);
	peri = 3*num1;
}
```

-----

## 6\. Function Overloading (Type-Based Summation) ➕

[cite\_start]This program demonstrates **function overloading** by defining four versions of a `sum` function, each accepting a unique combination of `int` and `float` arguments[cite: 10].

### Explanation

  * [cite\_start]**Overloading:** Four distinct signatures of the `sum` function are declared and defined to handle different input types[cite: 10].
  * [cite\_start]**Automatic Dispatch:** The `main` function uses a menu to prompt the user to select which signature to test (e.g., `int,int` or `float,int`)[cite: 11, 12].
  * [cite\_start]**Type Casting:** The `sum(int, float)` version explicitly casts the final result to `int` using `static_cast<int>` before printing[cite: 15]. [cite\_start]The `sum(float, int)` version casts the result to `float`[cite: 15].

### Code Snippets

```cpp
void sum(int num1,int num2){
	cout<<"The Sum is"<<(num1+num2);
}
//
void sum(int num1,float num2){
	cout<<"The Sum is"<<static_cast<int>(num1+num2);
[cite_start][cite: 15]}
//
void sum(float num1,int num2){
	cout<<"The Sum is"<<(static_cast<float>(num1+num2));
[cite_start][cite: 15]}
//
void sum(float num1,float num2){
	cout<<"The Sum is"<<(num1+num2);
}
//
int main(){
    // ... (menu driven input)
	switch(ch){
		case 3:
			int num1;
[cite_start][cite: 13] float num2;
			cout<<"Enter numbers to add\n";
			cin>>num1>>static_cast<float>(num2);
			sum(num1,num2); // Calls sum(int, float)
			break;
        // ... (other cases)
	}
}
```

-----

## 7\. Inline Functions (Square, Cube, Max) ⚡

[cite\_start]This program utilizes three simple functions (`square`, `cube`, `max`) defined with the **`inline` keyword**, suggesting the compiler should perform function call substitution at compile time for potential optimization[cite: 16].

### Explanation

  * [cite\_start]**Inline Keyword:** The `inline` keyword is a compiler hint to replace the function call with the function's body[cite: 16].
  * **Functionality:**
      * [cite\_start]`square`: Calculates $n_1 \times n_1$[cite: 16].
      * [cite\_start]`cube`: Calculates $n_1 \times n_1 \times n_1$[cite: 16].
      * [cite\_start]`max`: Finds the greater of two inputs using the ternary operator[cite: 16].
  * [cite\_start]**Menu:** The program provides options to test the Square/Cube functions (Case 1) or the Max function (Case 2)[cite: 17, 19].

### Code Snippets

```cpp
inline int square(int n1){return n1*n1;}
inline int cube(int n1){return n1*n1*n1;}
inline int max(int n1, int n2){return (n1>n2)?n1:n2;}
//

int main(){
    int ch,a,s,c;
    // ... (menu input)
	switch(ch){
		case 1: cout<<"Enter number to be squared and cubed:"<<endl;
				cin>>a;
				s=square(a); // Inline call
				c=cube(a);   // Inline call
				cout<<"Square:"<<s<<endl<<"Cube"<<c<<endl;
				break;
[cite_start][cite: 19] case 2: cout<<"Enter the numbers for min and max:"<<endl;
				cin>>s>>c;
				a=max(s,c);  // Inline call
				cout<<"The max is:"<<a<<endl;
				break;
		case 3: return 0;
        // ... (other cases)
	}
}
```

-----

## 8\. Default Arguments (Character Replication) 💬

[cite\_start]This program demonstrates the use of **default arguments** in the function `repchar` to allow it to be called with zero, one, or two arguments[cite: 21].

### Explanation

  * [cite\_start]**Default Arguments:** The function `void repchar(char='*', int=5)` is defined with the character defaulting to `'*'` and the count defaulting to `5`[cite: 21].
  * [cite\_start]**Function Flexibility:** The `main` function explicitly calls `repchar()` with no parameters, one character parameter, one integer parameter, and both parameters to showcase the default behavior[cite: 21, 22].
  * [cite\_start]**`repchar` Logic:** A simple `for` loop prints the given character (`rep`) repeatedly based on the given count (`num`)[cite: 23].

### Code Snippets

```cpp
void repchar(char='*',int=5);
//
void repchar(char rep,int num){
    int i;
[cite_start][cite: 23] for(i=0;i<num;i++){
        cout<<rep<<"\t";
    }cout<<endl;
}

int main(){
    char rep;
    int num;
    // ... (input)
    cout<<"No parameters"<<endl;
[cite_start][cite: 21] repchar(); // Uses both defaults '*' and 5
    cout<<"Char parameter"<<endl;
[cite_start][cite: 22] repchar(rep); // Uses default count 5
    cout<<"Char and Int parameters"<<endl;
    repchar(rep,num); // Uses both provided arguments
}
```

-----

## 9\. String Reversal (XOR Swap) 🔄

[cite\_start]This program reverses an input string **in place** using the efficient **bitwise XOR swap algorithm**, avoiding the need for a temporary variable[cite: 24].

### Explanation

  * [cite\_start]**XOR Swap:** The core of the reversal occurs within a `while` loop that iterates up to half the string's length (`n/2`)[cite: 26]. [cite\_start]In each iteration, three **Bitwise XOR** operations are used to swap the character at the front (`str[j]`) with the character at the back (`ptr[i]`)[cite: 26, 27].
  * [cite\_start]**In-Place Operation:** The swap modifies the original `str` array directly[cite: 28].
  * [cite\_start]**Pointers:** A character pointer `ptr` is initialized to the start of the `str` array[cite: 24]. [cite\_start]The loop calculates the length by searching for the null terminator (`\0`)[cite: 25].

### Code Snippets

```cpp
int main()
{ 
  char str[20];
[cite_start][cite: 24] char *ptr=NULL;
  ptr = str;
  // ... (input and length calculation)
  
  int n,i = 0,j = 0;
[cite_start][cite: 25] while (str[i] != '\0')
      i++;  
  n=i;
[cite_start][cite: 26] i--; // Start 'i' at the last character
  
  while(j<(n/2)){ // Iterate only through half the length
    // Bitwise XOR swap operation
    str[j]=str[j]^ptr[i];
    ptr[i]=str[j]^ptr[i];
    str[j]=str[j]^ptr[i];
    j++;
[cite_start][cite: 27] i--; 
  }
  cout<<"The reversed string is:"<<ptr<<endl;
[cite_start][cite: 28]}
```

-----

## 10\. Dynamic Array Sum and Average (New/Delete) 💾

[cite\_start]This program demonstrates **dynamic memory allocation** in C++ using the `new` and `delete` operators to create a 1D array whose size is determined by the user at runtime[cite: 29, 30].

### Explanation

  * [cite\_start]**Dynamic Allocation:** The array is created using **`ptr = new int[size];`** after the user specifies the `size`[cite: 29]. The pointer `ptr` manages this memory block.
  * [cite\_start]**Calculation:** After reading elements into the array using `ptr[i]`, the program calculates the total `sum` and the `average`[cite: 30].
  * [cite\_start]**Deallocation:** The memory is correctly released using **`delete []ptr;`** to free the entire dynamically allocated array block and prevent memory leaks[cite: 30].

### Code Snippets

```cpp
int main(){
	int size,i;
	float average=0,sum=0;
	int *ptr;
	// ... (input size)
	
[cite_start][cite: 29] ptr = new int[size];
	
	// ... (input elements and sum/average calculation)
	
[cite_start][cite: 30] delete []ptr;
	return 0;
}
```

-----

## 11\. Dynamic Two-Dimensional Array (New/Delete) 🌐

[cite\_start]This program demonstrates creating and managing a **two-dimensional array** (matrix) dynamically in C++ using the "array of pointers" approach with `new` and `delete`[cite: 31].

### Explanation

  * [cite\_start]**Dynamic Allocation (`allocate`):** The function first allocates an array of integer pointers using `new int*[row_size]`[cite: 35]. [cite\_start]Then, it loops through this array, allocating a new 1D array (the columns) for each row pointer using `arr[i] = new int[col]`[cite: 35]. [cite\_start]The `main` function calls `allocate` to create `arr1`[cite: 32].
  * [cite\_start]**Input and Display:** The `accept` function reads elements into the allocated matrix using double-indexing (`arr[i][j]`)[cite: 34]. [cite\_start]The `display` function prints the matrix[cite: 33].
  * [cite\_start]**Deallocation (`deallocate`):** Memory is released in the **reverse order of allocation** to prevent leaks[cite: 37]. [cite\_start]The inner 1D arrays (`delete[] arr[i];`) are freed first, followed by the outer array of pointers (`delete[] arr;`)[cite: 37].

### Code Snippets

```cpp
int** allocate(int** arr,int row_size,int col){
	int i;
[cite_start][cite: 35] arr=new int*[row_size]; // Allocate array of row pointers
[cite_start][cite: 35] for(i=0;i<row_size;i++){
		arr[i] = new int[col]; // Allocate columns for each row
	}
[cite_start][cite: 36] return arr;
}
//
void deallocate(int** arr, int row_size){
	for (int i = 0; i < row_size; i++)
[cite_start][cite: 37] delete[] arr[i]; // Delete each row (inner array)
[cite_start][cite: 37] delete[] arr; // Delete the array of pointers (outer array)
}
```


## 11. `Date.h` and `Demodate.cpp`: The Date Base Class 📅

These files define the `Date` class, which serves as a component (composition) within the `Employee` class.

### `Date` Class Overview

The `Date` class manages a calendar date with day, month, and year components. It includes **constructors**, **accessors/mutators**, and demonstrates **static members** for class-wide data.

| Member | Type | Purpose |
| :--- | :--- | :--- |
| `day`, `month`, `year` | `int` | Instance members storing the date components. |
| `new_year` | `static int` | Class-wide variable initialized to `2025`. |

### Key Functionality

| Function | Type | Description |
| :--- | :--- | :--- |
| **`Date()`** | Constructor | Default constructor; initializes `day=1`, `month=1`, `year=2025`. |
| **`Date(int d, int m, int y)`** | Constructor | Parameterized constructor used by the `Employee` class for initialization. |
| **`display()`** | Utility | Prints the date instance in `day/month/year` format. |
| **`staticDisplay()`** | Utility | Prints the instance's day/month with the static `new_year`. |
| **Static Functions** | `getNewYear()`, `setNewYear(int y)` | Access and modify the class-wide static variable `new_year`. |

***

## 12. `Employee.h` and `employee.cpp`: The Employee Base Class 👤

These files define the base `Employee` class, which manages basic employee details and demonstrates **composition** with the `Date` class and **static ID generation**.

### `Employee` Class Overview

| Member | Type | Relationship | Purpose |
| :--- | :--- | :--- | :--- |
| `name` | `String` | Composition | Employee's name (requires an external `String.h` definition). |
| `b_date` | `Date` | Composition | Employee's birth date. |
| `emp_id` | `int` | Instance | Unique ID assigned to each employee. |
| `new_emp_id` | `static int` | Class-Wide | Counter initialized to `100` to generate sequential IDs. |

### Key Functionality

| Function | Description |
| :--- | :--- |
| **Parameterized Constructor** | Takes name and birth date components (`d, m, y`). Uses a **member initializer list** (`:b_date(d, m, y), name(nm)`) to initialize the composed objects and assigns `emp_id = ++new_emp_id`. |
| **`display()`** | Prints the `emp_id`, calls `name.display()`, and calls `b_date.display()`. |

***

## 13. `Manager.h` and `Manager.cpp`: The Manager Subclass 💼

These files define the `Manager` class, which inherits from `Employee` and adds a daily allowance feature.

### `Manager` Class Overview

* **Inheritance:** Publicly inherits from `Employee`.
* **Member:** `DailyAllow` (`int`) stores the manager's daily allowance.

### Key Functionality

| Function | Description |
| :--- | :--- |
| **Parameterized Constructor** | Takes all `Employee` parameters plus `DA`. Uses the initializer list to call the **base class constructor** (`:Employee(nm, d, m, y)`) and initializes `DailyAllow`. |
| **`display()`** | **Overrides** `Employee::display()`. Calls `Employee::display()` first, and then prints the `Daily Allowance`. |
| **`displayDA()`** | Prints only the `Daily Allowance`. |

***

## 14. `salesEmployee.h` and `salesEmployee.cpp`: The Sales Employee Subclass 💰

These files define the `salesEmployee` class, which inherits from `WageEmployee` (implying a deeper hierarchy) and manages sales and commission data.

### `salesEmployee` Class Overview

* **Inheritance:** Publicly inherits from `WageEmployee`.
* **Members:** `sales` (`int`) and a constant `commission` (`const int`).

### Key Functionality

| Function | Description |
| :--- | :--- |
| **Parameterized Constructor** | Takes all `WageEmployee` parameters plus `sales` and `commission`. Uses the initializer list to call the intermediate **base class constructor** (`:WageEmployee(nm, d, m, y, h, r)`) and initializes the constant `commission`. |
| **`display()`** | **Overrides** the base display. Calls `Employee::display()` and `WageEmployee::display()`, then prints `Sales` and `Commission`. |
| **Note:** The `WageEmployee.h` file is required to define the direct base class for `salesEmployee`, but was not provided. |

***

## 15. `clientMenu.cpp`: Hierarchy Demonstration Client 🧑‍💻

This file contains the `main` function used to demonstrate the functionality and inheritance structure of the Employee hierarchy via a menu.

### Execution Flow

The program prompts the user to select an employee type (1-4) and uses a `switch` statement to execute the relevant demonstration:

| Choice | Class Demonstrated | Action |
| :--- | :--- | :--- |
| **1** | `Employee` | Creates an `Employee` object with user-provided name and DOB, then calls `e1.display()`. |
| **2** | `WageEmployee` | Creates a `WageEmployee` object (assumed to be defined in `WageEmployee.h`) with name, DOB, hours, and rate, then calls `we1.display()`. |
| **3** | `salesEmployee` | Creates a `salesEmployee` object, initializing all fields including sales and commission, then calls `se1.display()`. |
| **4** | `Manager` | Creates a `Manager` object, initializing all fields including Daily Allowance, then calls `man1.display()`. |
| **5** | Quit | Exits the program. |

I'll provide documentation for the C++ code files related to the **Person-Student-DVLSI hierarchy** and the supporting `String` class, focusing on **dynamic memory management** and **inheritance**. I'll continue the numbering from the previous analysis, starting with **79**.

***


## 16. `Person.h` and `Person.cpp`: The Person Base Class 👤

These files define the `Person` class, which serves as the root of the hierarchy and demonstrates dynamic memory allocation for string members.

### `Person` Class Overview

| Member | Type | Purpose | Dynamic Allocation |
| :--- | :--- | :--- | :--- |
| `name` | `char*` | Person's name | Yes, in constructors/`accept`. |
| `pan_id` | `char*` | Person's PAN ID | Yes, in constructors/`accept`. |
| `age` | `int` | Person's age | No, standard integer. |

### Key Functionality

| Function | Description |
| :--- | :--- |
| **Constructors** | Default constructor initializes `name` to an empty string (`\0`) after allocating 1 byte. Parameterized constructor allocates memory for `name` and `pan_id` and copies input strings using `strcpy`. |
| **`accept()`** | Uses temporary buffers (`temp_name`, `temp_pan`) to read input, then allocates new memory for `name` and `pan_id` before copying the data, ensuring the strings are stored dynamically. |
| **`display()`** | Prints `Name`, `Pan ID`, and `Age`. |
| **Destructor (`~Person`)** | **Crucial for DMA:** Checks if `name` and `pan_id` are non-null, then uses `delete []` to free the dynamically allocated memory for both strings, setting the pointers to `NULL` afterward. |

***

## 17. `Student.h` and `Student.cpp`: The Student Subclass 🎓

These files define the `Student` class, which publicly **inherits** from `Person` and adds academic details.

### `Student` Class Overview

* **Inheritance:** Publicly inherits from `Person`.
* **Members:** `PRN` (`double`) and `course` (`char*`).

### Key Functionality

| Function | Description |
| :--- | :--- |
| **Parameterized Constructor** | Calls the base class constructor first (`:Person(nm, pid, a)`). Then, it allocates memory for `course` and initializes `PRN`. |
| **`accept()`** | Calls the base class `Person::accept()` to read `name`, `pan_id`, and `age`. Then, it reads `PRN` and `course` (using a temporary buffer and dynamic allocation). |
| **`display()`** | Calls the base class `Person::display()`. Then, it prints `PRN` and `Course`. |
| **Destructor (`~Student`)** | Frees the dynamically allocated memory for the `course` string. |

***

## 18. `VLSI.h`, `VLSI.cpp`, and `clientVLSI.cpp`: The DVLSI Subclass and Client 🖥️

These files define the `DVLSI` class, representing a student specialized in VLSI, and a client file to demonstrate the entire hierarchy.

### `DVLSI` Class Overview

* **Inheritance:** Publicly inherits from `Student`.
* **Members:** `module1` and `module2` (`char*`), representing specialized course modules.

### Key Functionality

| Function | Description |
| :--- | :--- |
| **Parameterized Constructor** | Calls the intermediate base class constructor (`:Student(nm, pid, a, PN, co)`). Then, it allocates memory for and copies `module1` and `module2`. |
| **`accept()`** | Calls the base class `Student::accept()` to gather all ancestor data. Then, it reads `module1` and `module2` (using temporary buffers and dynamic allocation). |
| **`display()`** | Calls the base class `Student::display()`. Then, it prints `Module 1` and `Module 2`. |
| **Destructor (`~DVLSI`)** | Frees the dynamically allocated memory for both `module1` and `module2`. |
| **Client (`clientVLSI.cpp`)** | Demonstrates two uses: parameterized construction (`v1`) and default construction followed by `accept()` (`v2`), showing proper initialization and display across the three-level hierarchy. |

***

## 19. `String.h` and `String.cpp`: The Custom String Class 📝

These files define a custom `String` class, which manually handles character arrays using dynamic memory allocation, similar to the functionality implemented in the `Person` class.

### `String` Class Overview

| Member | Type | Purpose |
| :--- | :--- | :--- |
| `name` | `char*` | Pointer to the dynamically allocated character array. |
| `length` | `int` | Stores the length of the string. |

### Key Functionality

| Function | Description |
| :--- | :--- |
| **Default Constructor** | Initializes `length` to 0, allocates 1 byte of memory for `name`, and sets the first character to the null terminator (`\0`). |
| **Parameterized Constructor** | Takes a C-style string (`const char* nm`), calculates its length, allocates the required memory, and copies the string using `strcpy`. |
| **`display()`** | Prints the string content. |
| **Destructor (`~String`)** | Frees the dynamically allocated memory pointed to by `name`. |

***

### Summary of Memory Management

The entire hierarchy (`Person`, `Student`, `DVLSI`) relies on dynamic memory allocation (DMA) for its string members (`name`, `pan_id`, `course`, `module1`, `module2`). This necessitates:

1.  Explicit allocation using **`new char[]`** in constructors and `accept()` methods.
2.  Explicit deallocation using **`delete []`** in all destructors (`~Person`, `~Student`, `~DVLSI`).
3.  Calling base class constructors in derived class initializer lists to ensure proper initialization of ancestor members (e.g., `DVLSI` calls `Student`, which calls `Person`).



-----


## 20\. `Shape.h`: The Abstract Base Class (Interface) 📐

This file defines the abstract base class, `Shape`, which establishes the common interface and required polymorphic behavior for all derived geometric shapes.

### Explanation

  * **Abstract Class:** `Shape` is an abstract class because it contains **pure virtual functions** (`= 0`). This means you cannot create an instance of `Shape`; you must inherit from it.
  * **Polymorphic Interface:** It defines the four required operations that every concrete shape *must* implement: `accept()`, `display()`, `area()`, and `perimeter()`.
  * **Destructor:** It includes a **virtual destructor** (`virtual ~Shape() {}`). This is crucial for **safe polymorphism** as it ensures that when a derived class object is deleted via a base class pointer, the correct derived class destructor is called.
  * **Protected Members:** `Area` and `Perimeter` are included as protected members. While not used in the final derived implementations, they are available for subclasses.

### Code Snippet

```cpp
class Shape {
    protected:
        float Area=0;
        float Perimeter=0;
public:
    virtual void accept() = 0;       // pure virtual
    virtual void display() = 0;
    virtual float area() = 0;
    virtual float perimeter() = 0;
    virtual ~Shape() {}
};
```

-----

## 21\. `Circle.h` and `Circle.cpp`: Circle Implementation 🟠

These files implement the concrete `Circle` class, which inherits from `Shape` and implements all pure virtual methods.

### Explanation

  * **Inheritance:** `Circle` publicly inherits from `Shape`.
  * **Member:** It stores the dimension as an integer `radius`.
  * **Constructors:** Includes a default constructor (initializes `radius` to 0) and a parameterized constructor.
  * **`area()` and `perimeter()`:**
      * **Area:** Calculates $\pi r^2$ (using $3.14$).
      * **Perimeter (Circumference):** Calculates $2\pi r$ (using $3.14$).

### Code Snippets

```cpp
// Circle.h
class Circle : public Shape {
private:
    int radius;
public:
    // ... (Constructors and accept/display)
    float area();
    float perimeter();
};

// Circle.cpp
float Circle::area() {
    return 3.14 * radius * radius;
}

float Circle::perimeter() {
    return 2 * 3.14 * radius;
}
```

-----

## 22\. `Square.h` and `Square.cpp`: Square Implementation 🟩

These files implement the concrete `Square` class, inheriting from `Shape`.

### Explanation

  * **Inheritance:** `Square` publicly inherits from `Shape`.
  * **Member:** It stores the dimension as an integer `side`.
  * **Functionality:**
      * **`accept()`/`display()`:** Simple methods for I/O of the `side`.
      * **`area()`:** Calculates $side \times side$.
      * **`perimeter()`:** Calculates $4 \times side$.

### Code Snippets

```cpp
// Square.h
class Square : public Shape {
private:
    int side;
public:
    // ... (Constructors and accept/display)
    float area();
    float perimeter();
};

// Square.cpp
float Square::area() { return side * side; }
float Square::perimeter() { return 4 * side; }
```

-----

## 23\. Triangle Implementations (Base and Derived) 🔺

The provided files imply the existence of a base `Triangle` class (not fully provided) and implement two specialized triangular shapes: `EquilateralTriangle` and `RightTriangle`.

### Implied Base Triangle

The derived classes utilize a base class constructor `Triangle(side1, side2, side3)`, indicating that the base `Triangle` class is likely responsible for holding the three side lengths.

### EquilateralTriangle (`EquilateralTriangle.h`/`.cpp`)

  * **Inheritance:** Inherits from `Triangle`.
  * **Construction:** The constructor takes a single `side` and initializes the base `Triangle` with all three sides equal: `Triangle(side, side, side)`.

### RightTriangle (`RightTriangle.h`/`.cpp`)

  * **Inheritance:** Inherits from `Triangle`.
  * **Construction:** The constructor takes `base` and `height` and uses the Pythagorean theorem to calculate the hypotenuse (`std::sqrt(base*base + height*height)`).
  * The base `Triangle` constructor is then called with (base, height, hypotenuse). Requires the `<cmath>` library for the `sqrt` function.

### Code Snippets

```cpp
// EquilateralTriangle.h
class EquilateralTriangle : public Triangle {
public:
    EquilateralTriangle(int side) : Triangle(side, side, side) {}
};

// RightTriangle.h
#include <cmath>
class RightTriangle : public Triangle {
public:
    RightTriangle(int base, int height)
        : Triangle(base, height, std::sqrt(base*base + height*height)) {}
};
```

-----



## 24\. `A.h`: The Base Class (Root) 🅰️

This file defines the base class **`A`**, which is the root of the inheritance hierarchy.

### Explanation

  * **Member:** Contains one integer data member, `a`.
  * **Constructors:** Includes a default constructor (initializes `a` to 0) and a parameterized constructor (initializes `a` to a given integer `n`).
  * **`display()`:** Prints the value of `a`.

### Code Snippet

```cpp
class A{
	int a;
	public:
		A(){
			a=0;
		}
		
		A(int n){
		 a=n;
		}
		
		void display(){
			cout<<"\n A::"<<a<<endl;
		}
};
```

-----

## 25\. `B.h`: The First Intermediate Class (Virtual Base) 🅱️

This file defines class **`B`**, which inherits from `A` using **virtual inheritance**.

### Explanation

  * **Inheritance:** Publicly inherits from `A` using **`public virtual A`**. This is crucial for resolving the *Diamond Problem* by ensuring that only a single instance of `A` exists in the final derived class `D`.
  * **Member:** Contains one integer data member, `b`.
  * **Constructor:** The parameterized constructor takes two integers (`n1`, `n2`). It passes `n1` to the `A` constructor (`A(n1)`) and initializes `b` with `n2`.
  * **`display()`:** Calls `A::display()` and then prints the value of `b`.

### Code Snippet

```cpp
class B:public virtual A{
	int b;
	public:
		// ... (Constructors)
		
		B(int n1,int n2):A(n1){
		 b=n2;
		}
		
		void display(){
			A::display();
			cout<<b<<endl;
		}
};
```

-----

## 26\. `C.h`: The Second Intermediate Class (Virtual Base) 🅲

This file defines class **`C`**, which also inherits from `A` using **virtual inheritance**.

### Explanation

  * **Inheritance:** Publicly inherits from `A` using **`public virtual A`**. Like `B`, this ensures `C` contributes to the shared single instance of `A` in the final `D` class.
  * **Member:** Contains one integer data member, `c`.
  * **Constructor:** The parameterized constructor takes two integers (`n1`, `n2`). It passes `n1` to the `A` constructor (`A(n1)`) and initializes `c` with `n2`.
  * **`display()`:** Prints the value of `c`.

### Code Snippet

```cpp
class C: public virtual A{
	int c;
	public:
		// ... (Constructors)
		
		C(int n1,int n2):A(n1){
		 c=n2;
		}
		
		void display(){
			cout<<"\n C::"<<c<<endl;
		}
};
```

-----

## 27\. `D.h`: The Derived Class (Diamond Resolution) 🅳

This file defines class **`D`**, which resolves the **Diamond Inheritance Problem** by inheriting from both `B` and `C`.

### Explanation

  * **Inheritance:** Inherits from both `B` and `C`. Since both `B` and `C` used `virtual A`, `D` contains only a single instance of the `A` base class.
  * **Constructor:** The parameterized constructor demonstrates the required syntax for virtual inheritance: `D(int n1, int n2, int n3): B(n1, n2), C(n1, n3), A(n1) {}`.
      * **Direct Call to Virtual Base (`A(n1)`):** The most derived class (`D`) is responsible for calling the constructor of the **virtual base class (`A`)** to ensure its single instance is properly initialized.
      * **Intermediate Calls (`B`, `C`):** Calls the parameterized constructors for `B` and `C`.
  * **`display()`:** Calls the `display()` methods of its two direct parents, `B` and `C`.

### Code Snippet

```cpp
class D: public B,public C{
	
	public:
		D(){}
		
		D(int n1,int n2,int n3):B(n1,n2),C(n1,n3),A(n1){}
		
		void display(){
			B::display();
			C::display();
		}
};
```


***


## 28. `Complex.h` and `Complex.cpp`: Comprehensive Operator Overloading 🔢

These files define the `Complex` class, which represents a complex number and extensively overloads various arithmetic, comparison, and I/O operators, demonstrating all major forms of operator overloading (member, non-member, and friend functions).

### `Complex` Class Overview

| Member | Type | Initial Value | Purpose |
| :--- | :--- | :--- | :--- |
| `Real` | `int` | 1 | The real component. |
| `Imag` | `int` | 1 | The imaginary component. |

### Key Overloaded Operators

The `Complex` class overloads operators in three categories:

#### A. Binary Arithmetic (Member Functions)

These operators allow complex numbers to be added, subtracted, multiplied, and divided by another `Complex` object or an `int`.

| Operator | Signature (Example) | Operation |
| :--- | :--- | :--- |
| `+` | `operator+(Complex& c)` | Adds a `Complex` object to the current object. |
| `+` | `operator+(int c)` | Adds an `int` to both the `Real` and `Imag` parts. |
| `-` | `operator-(Complex& c)` | Subtracts a `Complex` object from the current object. |
| `*` | `operator*(Complex& c)` | Multiplies the two complex numbers. |
| `/` | `operator/(Complex& c)` | Divides the two complex numbers (using integer division). |

#### B. Unary, Assignment, and Comparison

| Operator | Signature (Example) | Type | Purpose |
| :--- | :--- | :--- | :--- |
| `-` | `operator-()` | Unary (Member) | Returns the negative (inversion) of the complex number. |
| `++` | `operator++()` | Pre-Increment (Member) | Increments both `Real` and `Imag` parts and returns the modified object (`*this`). |
| `++` | `operator++(int n)` | Post-Increment (Member) | Increments both parts but returns the state *before* incrementing. |
| `+=` | `operator+=(Complex& c)` | Assignment (Member) | Adds a `Complex` object to the current object and updates it (`*this`). |
| `<` | `operator<(Complex& c)` | Comparison (Member) | Compares the magnitude squared ($\text{R}^2 + \text{I}^2$) of two objects. |
| `==` | `operator==(int n)` | Comparison (Member) | Compares the magnitude squared ($\text{R}^2 + \text{I}^2$) to $2n^2$. |

#### C. Friend Functions (Non-Member)

These are defined as `friend` functions to allow the first operand to be a non-class type (e.g., `int + Complex`).

| Operator | Signature (Example) | Operation |
| :--- | :--- | :--- |
| `+` | `operator+(int n, Complex& c)` | Adds an `int` to a `Complex` object (e.g., `3 + num2`). |
| `-` | `operator-(int n, Complex& c)` | Subtracts a `Complex` object from an `int` (e.g., `3 - num2`). |
| `<<` | `operator<<(ostream& o, Complex& c)` | Stream insertion (output) for `cout << num1`. |
| `>>` | `operator>>(istream& i, Complex& c)` | Stream extraction (input) for `cin >> num1`. |

### Client Execution (`clientComplex.cpp`)

The client demonstrates chained operations and the use of friend functions:
1.  Input is accepted for four objects (`num1` through `num4`).
2.  Tests include: `num1 = num2 + num3`, `num1 = 3 - num2` (friend function), and combined operation `num1 = num2 * num3 + num4`.
3.  I/O operators are tested: `cout << num1 << num2;` and `cin >> num3 >> num2;`.

***

## 29. `Vector.h`, `Vector.cpp`, and `clientVector.cpp`: Vector Operator Overloading 🧭

These files define the `Vector` class, which represents a 2D vector with `X` and `Y` components, and overloads arithmetic and unary operators.

### `Vector` Class Overview

| Member | Type | Initial Value | Purpose |
| :--- | :--- | :--- | :--- |
| `X` | `int` | 00 | The X-component. |
| `Y` | `int` | 00 | The Y-component. |

### Key Overloaded Operators

| Operator | Signature | Type | Operation |
| :--- | :--- | :--- | :--- |
| `+` | `operator+(Vector& c)` | Binary (Member) | Vector addition: $\text{temp.X} = \text{X} + \text{c.X}$ and $\text{temp.Y} = \text{Y} + \text{c.Y}$. |
| `-` | `operator-(Vector& c)` | Binary (Member) | **Flawed:** Implements addition instead of subtraction (e.g., $\text{temp.X} = \text{X} + \text{c.X}$). |
| `++` | `operator++(int n)` | Post-Increment (Member) | Increments both `X` and `Y` components and returns the *original* object state. |
| `--` | `operator--(int n)` | Post-Decrement (Member) | Decrements both `X` and `Y` components and returns the *original* object state. |

### Client Execution (`clientVector.cpp`)

The client demonstrates the usage of the overloaded operators:
1.  Input is accepted for three vectors (`v1`, `v2`, `v3`).
2.  Tests include: `v1 = v2 + v3;`, `v1 = v2 - v3;`, `v1++;`, and `v1--;`.
3.  Accessors (`getX`, `getY`) and mutators (`setX`, `setY`) are tested.

***

## 30. `ArrayClass.h`, `ArrayClassDef.cpp`, and `ArrayClassClient.cpp`: Array Class Overloading 💾

These files define an `Array` class using dynamic memory allocation and overload the stream (`<<`, `>>`) and subscript (`[]`) operators to manage array I/O and element access.

### `Array` Class Overview

| Member | Type | Purpose | Dynamic Allocation |
| :--- | :--- | :--- | :--- |
| `size` | `int` | The size of the array. | No. |
| `arr` | `int*` | Pointer to the dynamically allocated array data. | Yes, in constructor. |

### Key Overloaded Operators

| Operator | Signature | Type | Purpose |
| :--- | :--- | :--- | :--- |
| `>>` | `operator>>(istream& i, Array& arr)` | Friend (Non-Member) | Reads elements into the array using a loop and pointer arithmetic. |
| `<<` | `operator<<(ostream& o, Array& arr)` | Friend (Non-Member) | Writes elements from the array to the output stream. |
| `[]` | `operator[](int index)` | Member | Accesses a single element at `index`. **Checks for valid index range** (`0` to `size-1`). Returns `0` if the index is out of bounds (due to integer return type). |

### Implementation Details

* **Constructor:** `Array(int size)` allocates memory for the array: `this->arr = new int(this->size);`.
* **Index Safety:** The `operator[]` ensures the index is between 0 and `size-1` before returning the value.

### Client Execution (`ArrayClassClient.cpp`)

The client demonstrates the core features:
1.  The array is created with user-defined `size`.
2.  The stream operators are tested: `cin >> arr;` and `cout << arr;`.
3.  The subscript operator is tested: `int temp = arr[index];`.
4.  The output explicitly checks the return value to determine if an invalid index was entered.


***

## 31. `String.h` and `String.cpp`: Custom String Class Implementation 📝

These files define and implement a custom `String` class, demonstrating manual memory management for character arrays and providing a rich set of overloaded operators for common string operations.

### `String` Class Overview

| Member | Type | Purpose | Memory Management |
| :--- | :--- | :--- | :--- |
| `str_ptr` | `char*` | Pointer to the dynamically allocated character array. | **Dynamic (DMA)**. |
| `length` | `int` | Stores the length of the string (excluding null terminator). | Standard. |

### Constructors and Destructor

| Function | Signature | Memory Operation |
| :--- | :--- | :--- |
| **Default Constructor** | `String()` | Allocates 1 byte, initializes `length` to 0, and sets `*str_ptr = '\0'`. |
| **C-String Constructor** | `String(const char *str)` | Allocates memory based on `strlen(str)` and copies the string using `strcpy`. |
| **Copy Constructor** | `String(const String&s)` | Performs a **deep copy**: allocates new memory and copies the content from the source object's pointer. |
| **Destructor** | `~String()` | **Crucial for DMA:** Uses `delete []ptr;` to deallocate the memory pointed to by `str_ptr`, preventing memory leaks. |

### Key Overloaded Operators

The class overloads both member and friend operators for powerful, intuitive string manipulation:

#### A. Arithmetic and Assignment (Member Functions)

| Operator | Signature | Operation |
| :--- | :--- | :--- |
| **`=`** | `operator=(String &a)` | **Assignment Operator:** Implements deep copy by checking for self-assignment, deallocating old memory, allocating new memory, and copying content. |
| **`+`** | `operator+(const String &a)` | **Concatenation:** Allocates new memory for the combined length, uses `strcpy` and `strcat` to append the strings, and returns a new dynamic `String` object. |
| **`[]`** | `operator[](int index)` | **Subscript Access:** Provides safe access to individual characters. Checks for a valid index range (`0` to `length-1`). |
| **`()`** | `operator()(int index1, int index2)` | **Substring:** Extracts a substring from `index1` to `index2` (inclusive). Uses a **static `String temp`** object to store and return the result. |

#### B. Comparison (Member Functions)

| Operator | Signature | Logic |
| :--- | :--- | :--- |
| **`==`** | `operator==(String &a)` | Uses `strcmp()`: Returns the result of `strcmp()`. *Note: The boolean logic in `clientString.cpp` effectively tests for inequality when the strings are identical.*. |
| **`<`** | `operator<(String &a)` | Compares based on **string length**. |
| **`>`** | `operator>(String &a)` | Compares based on **string length**. |

#### C. Stream Operators (Friend Functions)

| Operator | Signature | Purpose |
| :--- | :--- | :--- |
| **`>>`** | `operator>>(istream& i, String& str_ptr)` | **Stream Extraction (Input):** Reads characters into the string one by one using a loop and pointer arithmetic. |
| **`<<`** | `operator<<(ostream& o, String& str_ptr)` | **Stream Insertion (Output):** Prints the string content using a loop and pointer arithmetic. |

## 32. `clientString.cpp`: Demonstration Client 🧑‍💻

This file demonstrates the usage of various constructors and overloaded operators.

### Execution Flow

1.  **Construction:** `s1` (default), `s2("Hello")` (C-string constructor).
2.  **Assignment (`=`):** `s1 = s2;` (Tests deep copy implemented by the overloaded assignment operator).
3.  **Copy Construction:** `String s3 = s2;` (Tests deep copy implemented by the copy constructor).
4.  **Comparison (`==`):** Compares `s3` and `s2`.
5.  **Concatenation (`+`):** `s1 = s2 + s3;` (Concatenates "Hello" + "Hello").
6.  **Substring (`()`):** `cout << s1(3, 7);` (Extracts a portion of the concatenated string).
7.  **Subscript (`[]`):** Prints and modifies the character at index 2 (`s1[2] = 'p';`).