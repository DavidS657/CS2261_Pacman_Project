#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "house.h"
#include "gameMap1.h"
#include "gameMap2.h"
#include "bgLose.h"
#include "bgPause.h"
#include "bgStart.h"


// Prototypes
void initialize();
void goToGame();
void game();
void goToLose();
void lose();
void goToPause();
void pause();
void goToStart();
void start();

// States
enum {START, GAME, PAUSE, LOSE};
int state;
int mapSwitch;
int pauseCheck;
// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {
            
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case LOSE:
                lose();
                break;
            case PAUSE:
                pause();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    // Set up the display

    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE; 
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;

   
    mapSwitch = 1;

    // Set up the first state
    goToStart();
}
void goToStart() {
    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    DMANow(3, bgStartPal, PALETTE, bgStartPalLen/2);
    DMANow(3, bgStartTiles, &CHARBLOCK[0], bgStartTilesLen / 2);
    DMANow(3, bgStartMap, &SCREENBLOCK[31], bgStartMapLen / 2);
    state = START;

    gameProgress = 1;
    seed = 0;
}
void start() {
    seed++;
    if(BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
}
// Sets up the game state
void goToGame() {

    // Make sure changes do not appear onscreen
    waitForVBlank();
    if(gameProgress % 2 == 1 && gameProgress != 1) {
        if(pauseCheck != 1) {
            initGame();
        }
        DMANow(3, gameMap1Pal, PALETTE, 256);
        DMANow(3, gameMap1Tiles, &CHARBLOCK[0], gameMap1TilesLen / 2);
        DMANow(3, gameMap1Map, &SCREENBLOCK[31], gameMap1MapLen / 2);
        pauseCheck = 0;
        } else if (gameProgress % 2 == 1) {
            DMANow(3, gameMap1Pal, PALETTE, 256);
            DMANow(3, gameMap1Tiles, &CHARBLOCK[0], gameMap1TilesLen / 2);
            DMANow(3, gameMap1Map, &SCREENBLOCK[31], gameMap1MapLen / 2);
        } else if (gameProgress % 2 == 0) {
            if (pauseCheck != 1) {
                initGame();
            }
            DMANow(3, gameMap2Pal, PALETTE, 256);
            DMANow(3, gameMap2Tiles, &CHARBLOCK[0], gameMap2TilesLen / 2);
            DMANow(3, gameMap2Map, &SCREENBLOCK[31], gameMap2MapLen / 2);
            pauseCheck = 0;
    }
    
    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;


    // Set up the sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (pacLives <= 0) 
        goToLose();
    if (pelletCount <= 0) {
        gameProgress += 1;
        goToGame();
 
    }
}
void goToPause() {
    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
    waitForVBlank();
    hideSprites();
    pauseCheck = 1;

    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, bgPausePal, PALETTE, bgPausePalLen/2 );
    DMANow(3, bgPauseTiles, &CHARBLOCK[0], bgPauseTilesLen/2);
    DMANow(3, bgPauseMap, &SCREENBLOCK[31], bgPauseMapLen/2);

    state = PAUSE;
}

void pause() {
    waitForVBlank();
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}
void goToLose() {
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, bgLosePal, PALETTE, bgLosePalLen/2 );
    DMANow(3, bgLoseTiles, &CHARBLOCK[0], bgLoseTilesLen/2);
    DMANow(3, bgLoseMap, &SCREENBLOCK[31], bgLoseMapLen/2);
    gameProgress = 1;

    state = LOSE; 
}

void lose() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}