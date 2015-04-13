/*
	test static cast copy
*/
#include <stdio.h>

class Window {
public:
	virtual void onResize() { }
};

class SpecialWindow: public Window {
public:
	virtual void onResize() {
		static_cast<Window>(*this).onResize();
	}
};

int main()
{
	SpecialWindow win;
	win.onResize();	
}
