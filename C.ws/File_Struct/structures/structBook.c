#include<stdio.h>
typedef struct Book
{
	int bid;
	char bname[20];
	char aname[20];
	float price;
	float price_GST;
}Book;

float cal_price(float);
void Display(Book);
void accept();
int main(){
	Book e1;		//Normal struct
	Book e_arr[3];
	
	accept(e_arr,3);
	e1.price_GST = cal_price(e1.price);
	Display(e_arr,3);
	return 0;
}

float cal_price(float price){	//Price with GST
	return price = price+(price*.05);//5% GST
}

void Display(Book *e,int size){	//Display Struct
	for(int i=0;i<size;i++){	//Input for array of struct
		printf("%d%s%f",e_arr[i].emp_id,e_arr[i].name,e_arr[i].salary)
		}
}

void accept(Book *e,int size){	//pointer
	for(int i=0;i<size;i++){	//Input for array of struct
		printf("Enter details for emp%d:",i+1);
		scanf("%d%s%f",&e_arr[i].emp_id,e_arr[i].name,&e_arr[i].salary)
	}

}
