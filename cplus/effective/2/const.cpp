#include "test.h"
#include <stdio.h>

//const int GamePlayer::NumTurns;
const double AspecRatio = 1.653;
int main()
{
	//printf("%d\n", GamePlayer::NumTurns);
	GamePlayer g;
	printf("%d\n", g.score(1));
	printf("AspecRatio %d\n", AspecRatio);
	//const double& i = AspecRatio;
	//printf("i %d\n",i);
	
	return 0;
}
