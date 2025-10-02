#include "boonStruct.c"

void accept(BOON **, int);
void display(BOON **, int);
BOON** allocate(int);
void deallocate(BOON **, int);
void modify(BOON **, int);
void menu();
void writetofile(BOON **, int);
void readfromFile(BOON **, int);
void autoTest(int);


void menu(){
    char inp[8];
    int numBooks,choice;
    BOON **ptr = NULL;
    printf("Enter the number of books: ");
    fgets(inp, sizeof(inp), stdin);
    sscanf(inp, "%d", &numBooks);
    ptr = allocate(numBooks);
    while(1){
        printf("Menu:\n1. Accept Book Details\n2. Display Book Details\n3. Modify Book Details\n4. Automated Test Case\n5. Exit\nEnter your choice: ");
        fgets(inp, sizeof(inp), stdin);
        sscanf(inp, "%d", &choice);
        switch(choice){
            case 1:
                accept(ptr, numBooks);
                break;
            case 2:
                display(ptr, numBooks);
                break;  
            case 3:
                modify(ptr, numBooks);
                break;
            case 4:
                autoTest(numBooks);
                break;
            case 5:
                writetofile(ptr, numBooks);
                deallocate(ptr, numBooks);
                return;
            default:
                printf("Invalid choice. Please try again.\n");
                break;
        }
    }
}

BOON** allocate(int size)
{
    BOON **arr = (BOON **)malloc(size * sizeof(BOON *));
    for(int i = 0; i < size; i++)
    {
        arr[i] = (BOON *)malloc(sizeof(BOON));
    }
    return arr;
}

void deallocate(BOON **arr, int size)
{
    printf("Deallocating memory...\n");
    for(int i = 0; i < size; i++)
    {
        free(arr[i]);
    }
    free(arr);
}

void modify(BOON **store_array_ptr, int size)
{
    char inp[20];
    int modIndex, choice, i;
    int bide = -1;
    
    printf("Enter the Book ID you want to modify: ");
    fgets(inp, sizeof(inp), stdin);
    sscanf(inp, "%d", &modIndex);

    BOON **arr = store_array_ptr;
    for(i = 0; i < size; i++)
    {
        if(arr[i]->bid == modIndex)
        {
            bide = i;
            break;
        }
    }
    
    if (bide == -1)
    {
        printf("Book ID not found.\n");
        return;
    }

    printf("Book ID exists. Choose what to modify:\n\t1. Title\n\t2. Price\n\t3. Author\n");
    fgets(inp, sizeof(inp), stdin);
    sscanf(inp, "%d", &choice);

    switch(choice)
    {
        case 1:
            printf("Enter New Title: ");
            fgets(arr[bide]->bname, sizeof(arr[bide]->bname), stdin);
            strtok(arr[bide]->bname, "\n");
            break;
        case 2:
            printf("Enter New Price: ");
            fgets(inp, sizeof(inp), stdin);
            sscanf(inp, "%f", &arr[bide]->price);
            break;
        case 3:
            printf("Enter New Author: ");
            fgets(arr[bide]->aname, sizeof(arr[bide]->aname), stdin);
            strtok(arr[bide]->aname, "\n");
            break;
        default:
            printf("Invalid choice.\n");
    }
}

void accept(BOON **arr, int size)
{
    char inp[50];
    for(int i = 0; i < size; i++)
    {
        printf("Enter details for Book %d:\n", i + 1);
        
        printf("Book ID: ");
        fgets(inp, sizeof(inp), stdin);
        sscanf(inp, "%d", &arr[i]->bid);
        
        printf("Book Name: ");
        fgets(arr[i]->bname, sizeof(arr[i]->bname), stdin);
        strtok(arr[i]->bname, "\n");
        
        printf("Author Name: ");
        fgets(arr[i]->aname, sizeof(arr[i]->aname), stdin);
        strtok(arr[i]->aname, "\n");
        
        printf("Price: ");
        fgets(inp, sizeof(inp), stdin);
        sscanf(inp, "%f", &arr[i]->price);
    }
}
void display(BOON **arr, int size)
{
    printf("\nBook Details:\n");
    for(int i = 0; i < size; i++)
    {
        printf("ID: %d\tTitle: %s\tAuthor: %s\tPrice: %.2f\n", arr[i]->bid, arr[i]->bname, arr[i]->aname, arr[i]->price);
    }
}

void writetofile(BOON **arr, int size)
{
    FILE *fp = fopen("books.txt", "w");
    if(fp == NULL)
    {
        printf("Error opening file for writing.\n");
        return;
    }
    
    for(int i = 0; i < size; i++)
    {
        fprintf(fp, "%d,%s,%s,%.2f\n", arr[i]->bid, arr[i]->bname, arr[i]->aname, arr[i]->price);
    }
    
    fclose(fp);
    printf("Book details written to books.txt\n");
}

void readfromFile(BOON **arr, int size)
{
    FILE *fptr = NULL;
    char buffer[256]; // Buffer for reading file lines
    int i = 0;
    
    // Attempt to open the file for reading
    fptr = fopen("books.txt", "r");
    
    if (fptr == NULL)
    {
        printf("Error: Could not open books.txt for reading.\n");
        deallocate(arr, size);
        return;
    }

    printf("Reading book details from books.txt...\n");
    /*
    fscanf(fptr, "%d,%49[^,],%49[^,],%f",&arr[i]->bid,arr[i]->bname,&arr[i]->aname, &arr[i]->price) == 4)
    The format specifier should match the format in the text file  
        [^,] is used to skip commas as my code writes comma seperated data 
        Sample data:
            101,Book one,Auth one,1.00
            102,Book Two,Auth two,2.00
            103,Book Three,Auth three,3.00
    */
                                


    while (i < size && fscanf(fptr, "%d,%49[^,],%49[^,],%f", 
                             &arr[i]->bid, 
                             arr[i]->bname, 
                             &arr[i]->aname, 
                             &arr[i]->price) == 4)
    {
         
        printf("Read: ID %d, Name %s\n", arr[i]->bid, arr[i]->bname);
        i++;
    }
    
    fclose(fptr);
}
void autoTest(int size)
{
    
    
    BOON **arr = allocate(size);

    // Predefined book details

    arr[0]->bid = 101;

    strcpy(arr[0]->bname, "TheGreatGatsby");

    strcpy(arr[0]->aname, "F.ScottFitzgerald");

    arr[0]->price = 10.99;

    arr[1]->bid = 102;

    strcpy(arr[1]->bname, "1984");

    strcpy(arr[1]->aname, "GeorgeOrwell");

    arr[1]->price = 8.99;

    arr[2]->bid = 103;

    strcpy(arr[2]->bname, "ToKillaMockingbird");

    strcpy(arr[2]->aname, "HarperLee");

    arr[2]->price = 12.49;

    writetofile(arr,size); //Write test case data to file
    deallocate(arr, size); //Deallocate the memory used for initial data
    arr = NULL;
    //printf("Automated Test Case:\n");

    
    BOON **arr1 = allocate(size);

    readfromFile(arr1, size); //read test case data from file
    
    // --- Verification Logic ---
    printf("\nData in file is:\n");
    display(arr1, size);
    
    // Modify the price of the second book (or book with ID 102)
    printf("\nModifying the price of book with ID 102...\n");
    for(int j = 0; j < size; j++)
    {
        printf("%d",arr1[j]->bid);
        if(arr1[j]->bid == 102)
        {
            arr1[j]->price = 9.99; // New price
            printf("Book 102 price updated.\n");
            break;
        }
    }
    
    printf("\nAfter Modification:\n");
    display(arr1, size);
    deallocate(arr1, size); //Deallocate the memory used for read data
    
}

