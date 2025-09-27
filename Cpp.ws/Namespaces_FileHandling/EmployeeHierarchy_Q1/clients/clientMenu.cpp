#include "Employee.h"
#include "WageEmployee.h"
#include "salesEmployee.h"
#include "Manager.h"

int main(){
	int choice,d,m,y,h,r,s,c,DA;
	char name[25];
	
	cout<<"Enter which class of employee:\n\
			1.Employee\n\
			2.Wage Employee\n\
			3.Sales Employee\n\
			4.Manager\n\
			5.Quit\n";

	cin>>choice;
	
	switch(choice){
		case 1:{
			cout<<"Enter Employee Name,Date of Birth"<<endl;
			cin>>name>>d>>m>>y;
			Employee e1(name,d,m,y);
			e1.display();
			break;
		}
		case 2:{
			cout<<"Enter Wage Employee Name,Date of Birth,Hours and Rate"<<endl;
			cin>>name>>d>>m>>y>>h>>r;
			WageEmployee we1(name,d,m,y,h,r);
			we1.display();
			break;	
		}
		
		case 3:{
			cout<<"Enter Sales Employee Name,Date of Birth,Hours, Rate, Sales, Commission"<<endl;
			cin>>name>>d>>m>>y>>h>>r>>s>>c;
			salesEmployee se1(name,d,m,y,h,r,s,c);
			se1.display();
			break;
		}	
		case 4:{
			cout<<"Enter Manager Name,Date of Birth, Daily Allowance"<<endl;
			cin>>name>>d>>m>>y>>DA;
			Manager man1(name,d,m,y,DA);
			man1.display();
			break;
		}
		case 5:{
			return 0;
		}
		default:{
			cout<<"Invalid Input"<<endl;
			break;
		}
	}	
			
}
