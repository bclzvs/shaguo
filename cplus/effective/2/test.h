class GamePlayer{
private:
	static const int NumTurns = 2;
	int scores[NumTurns];
public:
	static const int PubNum = 20;
	int score(int index) const {return scores[index];}
};
