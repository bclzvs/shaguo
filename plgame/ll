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
	Uint16		*raw_pixels;
	int		x, y;
	if (SDL_Init(SDL_INIT_VIDEO) != 0) serror("sdl init video failed"); 
	
	screen = SDL_SetVideoMode(256, 256, 16, 0);
	if (screen == NULL) serror("sdl set video mode failed"); 

	atexit(SDL_Quit);
	SDL_LockSurface(screen);
	raw_pixels = (Uint16 *) screen->pixels;
	for (x = 0; x < 256; x++) {
		for (y = 0; y < 256; y++) {
			Uint16	pixel_color;
			int	offset;
			pixel_color = createHiclorPixel(screen->format, x, 0, y);
			offset = screen->pitch / 2 * y + x;
			raw_pixels[offset] = pixel_color;

		}
	}	
	SDL_UnlockSurface(screen);
	SDL_UpdateRect(screen, 0, 0, 0, 0);
	SDL_Delay(3000);
//	printf("Success!\n");
	return 0;	
}
