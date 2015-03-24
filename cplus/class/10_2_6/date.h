class Date
{
	public:
		int year() const;
	private:
		int y, m ,d;
};

// must add const
int Date::year() const
{
	return y;
}
