#include "salesManager.h"

salesManager::salesManager(const char*nm,int d,int m,int y,int h,int r,int s,int const com,int DA): salesEmployee(nm,d,m,y,h,r,s,com),Manager(nm,d,m,y,h,DA)

void salesManager::display(){
	Manager::displayDA();
	salesEmployee::display();
}
