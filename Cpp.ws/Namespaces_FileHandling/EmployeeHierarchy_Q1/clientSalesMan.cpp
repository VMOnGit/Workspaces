
#include "salesManager.h"

int main(){
	int choice,d,m,y,h,r,s,c,DA;
	char name[25];
	Employee *eptr;
	
	cout<<"Enter which class of employee:\n\
			1.Sales Manager\n\
			2.Wage Employee\n\
			3.Sales Employee\n\
			4.Manager\n\
			5.Quit\n";

	cin>>choice;
	
	switch(choice){
		case 1:{
			
			cout<<"Enter Sales Manager Name,Date of Birth,Hours, Rate, Sales,Commission,Daily Allowance"<<endl;
			cin>>name>>d>>m>>y>>h>>r>>s>>c>>DA;
			//dynamic_cast<salesManager*>(eptr);
			eptr = new salesManager(name,d,m,y,h,r,s,c,DA);			
			eptr->display();
			break;
		}
		
		case 2:{
			cout<<"Enter Wage Employee Name,Date of Birth,Hours and Rate"<<endl;
			cin>>name>>d>>m>>y>>h>>r;
			//dynamic_cast<WageEmployee*>(eptr);
			eptr = new WageEmployee(name,d,m,y,h,r) ;
			cout<<eptr->calSal()<<endl;
			eptr->display();
			break;	
		}
		
		case 3:{
			cout<<"Enter Sales Employee Name,Date of Birth,Hours, Rate, Sales, Commission"<<endl;
			cin>>name>>d>>m>>y>>h>>r>>s>>c;
			//dynamic_cast<salesEmployee*>(eptr);
			eptr = new salesEmployee(name,d,m,y,h,r,s,c) ;
			eptr->display();
			break;
		}	
		case 4:{
			cout<<"Enter Manager Name,Date of Birth, Daily Allowance"<<endl;
			cin>>name>>d>>m>>y>>DA;
			eptr = new Manager(name,d,m,y,DA);
			Manager* mgr = dynamic_cast<Manager*>(eptr);
			cout<<mgr->Bonus();
			eptr->display();
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
