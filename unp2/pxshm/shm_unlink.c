#include "unp2.h"

int main(int argc, char **argv)
{
	if (argc != 2) usage("<name>");

	if(shm_unlink(argv[1]) == -1)
		err_abort("shm_unlink failed");
}
