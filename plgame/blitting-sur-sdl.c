#include "SDL.h"
#include "stdlib.h"
#include "stdio.h"

#define serror(msg) do{\
		fprintf(stderr, "%s:%s\n", msg, SDL_GetError());\
		return 1;\
	} while (0)

Uint16 createHiclorPixel(SDL_PixelFormat *fmt, Uint8 red, Uint8 green, Uint8 blue)
{
	Uint16	value;
	value = ((red >> fmt->Rloss) << fmt->Rshift) + \
		((green >> fmt->Gloss) << fmt->Gshift) + \
		((blue >> fmt->Bloss) << fmt->Bshift);  
	return value;
}

int main()
{
	SDL_Surface 	*screen;
	SDL_Surface	*image;
	SDL_Rect	src, dest;
	if (SDL_Init(SDL_INIT_VIDEO) != 0) serror("sdl init video failed"); 
	
	screen = SDL_SetVideoMode(256, 256, 16, 0);
	if (screen == NULL) serror("sdl set video mode failed"); 

	atexit(SDL_Quit);
	image = SDL_LoadBMP("sail.bmp");
	if (image == NULL) serror("sdl load bmp failed");
	src.x = 0;
	src.y = 0;
	src.w = image->w;
	src.h = image->h;
	
	dest.x = 0;
	dest.y = 0;
	dest.w = image->w;
	dest.h = image->h;

	SDL_BlitSurface(image, &src, screen, &dest);

	SDL_UpdateRect(screen, 0, 0, 0, 0);
	SDL_Delay(3000);
//	printf("Success!\n");
	return 0;	
}
