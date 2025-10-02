
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct STORE
{
    int bid;
    char bname[20];
    char aname[20];
    float price;
}STORE;

void Menu();
void Modify(STORE **, int);
void Display(STORE **, int);
void accept(STORE **, int);
STORE** allocate(int);
void deallocate(STORE **, int);

int main()
{

    
    Menu();

    

    return 0;
}

STORE** allocate(int row_size)
{
    STORE** arr;
    arr = (STORE**)malloc(row_size * sizeof(STORE*));
    if (arr == NULL)
    {
        printf("Memory allocation failed!\n");
        exit(1);
    }
    for(int i = 0; i < row_size; i++)
    {
        arr[i] = (STORE*)malloc(sizeof(STORE));
        if (arr[i] == NULL)
        {
            printf("Memory allocation failed for row %d!\n", i);
            exit(1);
        }
    }
    return arr;
}

void deallocate(STORE **arr, int row_size)
{
    for(int i = 0; i < row_size; i++)
    {
        free(arr[i]);
    }
    free(arr);
}

void Menu()
{
    char inp[10];
    int choice,row_size;

    STORE **store_array_ptr  = NULL;
    
    printf("Enter the number of books: ");
    fgets(inp, sizeof(inp), stdin);
    sscanf(inp, "%d", &row_size);

    
    store_array_ptr = allocate(row_size);

    while(1)
    {
        printf("\nMenu:\n\t1. Add\n\t2. Display\n\t3. Modify\n\t4. Quit\n");
        printf("Enter your choice: ");
        fgets(inp, sizeof(inp), stdin);
        sscanf(inp, "%d", &choice);

        switch(choice)
        {
            case 1:
                accept(store_array_ptr, row_size);
                break;
            case 2:
                Display(store_array_ptr, row_size);
                break;
            case 3:
                Modify(store_array_ptr, row_size);
                break;
            case 4:
                deallocate(store_array_ptr, row_size);
                return;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }
}

void Modify(STORE **store_array_ptr, int row_size)
{
    char inp[10];
    int modIndex, choice, i;
    int bide = -1;
    
    printf("Enter the Book ID you want to modify: ");
    fgets(inp, sizeof(inp), stdin);
    sscanf(inp, "%d", &modIndex);

    STORE **arr = store_array_ptr;
    for(i = 0; i < row_size; i++)
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

void Display(STORE **store_array_ptr, int size)
{
    STORE **arr = store_array_ptr;
    printf("\nBook Details:\n");
    for(int i = 0; i < size; i++)
    {
        printf("ID: %d\tTitle: %s\tAuthor: %s\tPrice: %.2f\n", arr[i]->bid, arr[i]->bname, arr[i]->aname, arr[i]->price);
    }
}

void accept(STORE **store_array_ptr, int size)
{
    STORE **arr = store_array_ptr;
    for(int i = 0; i < size; i++)
    {
        printf("Enter details for Book #%d (ID, Book Name, Author, Price): ", i + 1);
        scanf("%d", &arr[i]->bid);
        getchar(); // To consume the newline character
        fgets(arr[i]->bname, sizeof(arr[i]->bname), stdin);
        strtok(arr[i]->bname, "\n");
        fgets(arr[i]->aname, sizeof(arr[i]->aname), stdin);
        strtok(arr[i]->aname, "\n");
        scanf("%f", &arr[i]->price);
        getchar(); // To consume the newline character
    }
}