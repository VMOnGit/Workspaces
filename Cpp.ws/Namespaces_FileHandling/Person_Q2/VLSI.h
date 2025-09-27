#include "Student.h"

class DVLSI:public Student{
	private:
		char *module1;
		char *module2;
	
	public:
		DVLSI()=default;
		DVLSI(char*, char*, int, double, char*,char*,char*);
		void display();
		void accept();
		~DVLSI();
};
