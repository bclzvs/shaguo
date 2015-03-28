class GamePlayer{
private:
	static const int NumTurns = 2;
	int scores[NumTurns];
public:
	int score(int index) const {return scores[index];}
};
