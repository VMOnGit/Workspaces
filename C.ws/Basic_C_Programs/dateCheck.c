#include<stdio.h>
int verifyDate(int,int,int);
int main(){
	int day,month,year,result;
	printf("Enter a Date:");
	scanf("%d%d%d",&day,&month,&year);
	result = verifyDate(day,month,year);
	if(result){
		printf("It is a valid date\n");
	}else{
		printf("It is a not valid date\n");
	}
}

int verifyDate(int day, int month,int year){
	int leap;
	int days[] =  {31,28,31,30,31,30,31,31,30,31,30,31};
	if(year<0){
		return 0;
	}
	if((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)){
		leap = 1;
	}else{
		leap = 0;
	}if(month<1||month>12)
		return 0;
	if(month == 2 && leap == 1){
		if(day<1||day>29)
		return 0;
	}else{
		if(day<1||day>days[month-1])
			return 0;
	}return 1;
	
}
