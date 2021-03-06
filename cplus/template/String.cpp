#include "String.h"

template<class C> struct String<C>::Srep{
	C*	s;
	int	sz;
	int	n;
	Srep(int nsz, const C* p){
		n = 1;
		sz = nsz;
		s = new C[nsz + 1];  // malloc	
		strcpy(s, p);
	}
};

template<class C> C String<C>::read(int i) const 
{
	return rep->s[i];
}
/*
template<class C> String<C>::String()
{
	rep = new Srep(0, C());
}
*/
String<char> us;	
