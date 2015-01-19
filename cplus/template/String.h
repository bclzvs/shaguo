template<class C> class String {
	struct	Srep;
	Srep	*rep;
public:
	String();
	//String(const C*);
	//String(const String&);
	
	C read(int i) const;
};


