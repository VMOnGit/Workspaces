#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct Student
{
    int roll_no;
    char sname[20];
    int marks[5];
    float average;
} Stud;

float cal_average(Stud **, int);
void Display(Stud **, int);
void accept(Stud **, int);
Stud** allocate(int);
void deallocate(Stud **, int);

int main()
{
    Stud **arr = NULL;
    int size = 5;

    arr = allocate(size);
    accept(arr, size);
    cal_average(arr, size);
    Display(arr, size);

    deallocate(arr, size); // Free the allocated memory
    return 0;
}

Stud** allocate(int size)
{
    Stud** arr = (Stud**)malloc(size * sizeof(Stud*));
    if (arr == NULL)
    {
        printf("Memory allocation failed!\n");
        exit(1);
    }
    for(int i = 0; i < size; i++)
    {
        arr[i] = (Stud*)malloc(sizeof(Stud));
        if (arr[i] == NULL)
        {
            printf("Memory allocation failed for student %d!\n", i + 1);
            exit(1);
        }
    }
    return arr;
}

void deallocate(Stud **arr, int size)
{
    for(int i = 0; i < size; i++)
    {
        free(arr[i]);
    }
    free(arr);
}

float cal_average(Stud **arr, int size)
{
    float max_avg = 0.0;
    int max_index = -1;
    int i, j;

    for (i = 0; i < size; i++)
    {
        float sum = 0;
        for (j = 0; j < 5; j++)
        {
            sum += arr[i]->marks[j];
        }
        arr[i]->average = sum / 5.0;

        if (arr[i]->average > max_avg)
        {
            max_avg = arr[i]->average;
            max_index = i;
        }
    }
    if (max_index != -1) {
        printf("The topper is %s with an average of %.2f\n", arr[max_index]->sname, max_avg);
    } else {
        printf("No students to display topper.\n");
    }
    return max_avg;
}

void Display(Stud **arr, int size)
{
    printf("\nStudent Details:\n");
    for (int i = 0; i < size; i++)
    {
        printf("Roll No: %d\n", arr[i]->roll_no);
        printf("Name: %s\n", arr[i]->sname);
        printf("Marks: ");
        for (int j = 0; j < 5; j++)
        {
            printf("%d ", arr[i]->marks[j]);
        }
        printf("\nAverage: %.2f\n", arr[i]->average);
        printf("\n");
    }
}

void accept(Stud **e, int size)
{
    char buffer[100];
    for (int i = 0; i < size; i++)
    {
        printf("Enter roll no and name for student %d: ", i + 1);
        scanf("%d", &e[i]->roll_no);
        fgets(buffer, sizeof(buffer), stdin); // Consume newline
        scanf("%s", e[i]->sname);
        
        printf("Enter marks for student %d (5 marks): ", i + 1);
        for (int j = 0; j < 5; j++)
        {
            scanf("%d", &e[i]->marks[j]);
        }
    }
}