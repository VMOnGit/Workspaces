#include<stdio.h>
#include<stdlib.h>

int main()
{   char ch;
	FILE *fptr =NULL;
	fptr=fopen("open.txt","w");
if(fptr==NULL)
{
	printf("File not exist");
}
for(int i=0;i<26;i++)
{
	fputc(("%c",i+65),fptr);
}

fclose (fptr);

fptr=fopen("open.txt","r");
if (fptr==NULL)
	{
		printf("File not exist");
	}
	
while( (ch=fgetc(fptr)) !=EOF)
	{
		printf("%c\n",ch);
	}
	fclose(fptr);
	return 0;
}


