/*
	Stoe newed object in smart pointer in standalone statements
*/
#include <tr1/memory>
using namespace std;
class Foo
{

};
int bar() {return 2;}
void func(tr1::shared_ptr<Foo>, int){ }
int main()
{
	func(tr1::shared_ptr<Foo>(new Foo), bar());	
	return 0;
}
