# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int direction;
    int accWidth;
    int accHeight;
    int spookTimer;
    int gameState;
    int ghostNum;
    int ghostTimer;
    int hitCheck;
    int reverseCheck;
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 209 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 220 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 260 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "game.h" 1
# 11 "game.h"
extern int hOff;
extern int vOff;
extern int pacLives;
extern int gameProgress;
extern int pelletCount;
extern int ghostMulti;
extern int toggleMovement;
extern int ghostRand;
extern int poweredUp;
extern int powerTimer;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE pacMan;
extern ANISPRITE lives;
extern ANISPRITE ghosts[4];
extern ANISPRITE pellets[80];
extern ANISPRITE powerPellets[4];
extern ANISPRITE score[7];
extern ANISPRITE text[14];
extern unsigned char* playerCollisionmap;
extern unsigned char* enemyCollisionmap;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void initGhosts();
void updateGhost(ANISPRITE* g);
void animateGhost(ANISPRITE* g);
void drawGhosts();
void initPellets();
void updatePellet(ANISPRITE* p);
void drawPellets();
void initPowerPellets();
void updatePowerPellet(ANISPRITE* s);
void drawPowerPellets();
void initLives();
void drawLives();
void initText();
void drawText();
void initScore();
void drawScore();
# 3 "main.c" 2
# 1 "spritesheet.h" 1
# 22 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetMap[1024];


extern const unsigned short spritesheetPal[256];
# 4 "main.c" 2
# 1 "house.h" 1
# 22 "house.h"
extern const unsigned short houseTiles[896];


extern const unsigned short houseMap[1024];


extern const unsigned short housePal[256];
# 5 "main.c" 2
# 1 "gameMap1.h" 1
# 22 "gameMap1.h"
extern const unsigned short gameMap1Tiles[16384];


extern const unsigned short gameMap1Map[1024];


extern const unsigned short gameMap1Pal[256];
# 6 "main.c" 2
# 1 "gameMap2.h" 1
# 22 "gameMap2.h"
extern const unsigned short gameMap2Tiles[16384];


extern const unsigned short gameMap2Map[1024];


extern const unsigned short gameMap2Pal[256];
# 7 "main.c" 2
# 1 "bgLose.h" 1
# 22 "bgLose.h"
extern const unsigned short bgLoseTiles[16384];


extern const unsigned short bgLoseMap[1024];


extern const unsigned short bgLosePal[256];
# 8 "main.c" 2
# 1 "bgPause.h" 1
# 22 "bgPause.h"
extern const unsigned short bgPauseTiles[16384];


extern const unsigned short bgPauseMap[1024];


extern const unsigned short bgPausePal[256];
# 9 "main.c" 2
# 1 "bgStart.h" 1
# 22 "bgStart.h"
extern const unsigned short bgStartTiles[16384];


extern const unsigned short bgStartMap[1024];


extern const unsigned short bgStartPal[256];
# 10 "main.c" 2



void initialize();
void goToGame();
void game();
void goToLose();
void lose();
void goToPause();
void pause();
void goToStart();
void start();


enum {START, GAME, PAUSE, LOSE};
int state;
int mapSwitch;
int pauseCheck;

unsigned short buttons;
unsigned short oldButtons;


int seed;

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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


void initialize() {



    (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<12);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((31)<<8) | (0<<14);


    mapSwitch = 1;


    goToStart();
}
void goToStart() {
    (*(volatile unsigned short *)0x04000016) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    DMANow(3, bgStartPal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, bgStartTiles, &((charblock *)0x6000000)[0], 32768 / 2);
    DMANow(3, bgStartMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    state = START;

    gameProgress = 1;
    seed = 0;
}
void start() {
    seed++;
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        srand(seed);
        goToGame();
        initGame();
    }
}

void goToGame() {


    waitForVBlank();
    if(gameProgress % 2 == 1 && gameProgress != 1) {
        if(pauseCheck != 1) {
            initGame();
        }
        DMANow(3, gameMap1Pal, ((unsigned short *)0x5000000), 256);
        DMANow(3, gameMap1Tiles, &((charblock *)0x6000000)[0], 32768 / 2);
        DMANow(3, gameMap1Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        pauseCheck = 0;
        } else if (gameProgress % 2 == 1) {
            DMANow(3, gameMap1Pal, ((unsigned short *)0x5000000), 256);
            DMANow(3, gameMap1Tiles, &((charblock *)0x6000000)[0], 32768 / 2);
            DMANow(3, gameMap1Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        } else if (gameProgress % 2 == 0) {
            if (pauseCheck != 1) {
                initGame();
            }
            DMANow(3, gameMap2Pal, ((unsigned short *)0x5000000), 256);
            DMANow(3, gameMap2Tiles, &((charblock *)0x6000000)[0], 32768 / 2);
            DMANow(3, gameMap2Map, &((screenblock *)0x6000000)[31], 2048 / 2);
            pauseCheck = 0;
    }

    (*(volatile unsigned short *)0x04000016) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff;



    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = GAME;
}


void game() {

    updateGame();
    drawGame();
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
    (*(volatile unsigned short *)0x04000016) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;
    waitForVBlank();
    hideSprites();
    pauseCheck = 1;

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4*128));
    DMANow(3, bgPausePal, ((unsigned short *)0x5000000), 512/2 );
    DMANow(3, bgPauseTiles, &((charblock *)0x6000000)[0], 32768/2);
    DMANow(3, bgPauseMap, &((screenblock *)0x6000000)[31], 2048/2);

    state = PAUSE;
}

void pause() {
    waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
    }
}
void goToLose() {
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4*128));
    DMANow(3, bgLosePal, ((unsigned short *)0x5000000), 512/2 );
    DMANow(3, bgLoseTiles, &((charblock *)0x6000000)[0], 32768/2);
    DMANow(3, bgLoseMap, &((screenblock *)0x6000000)[31], 2048/2);
    gameProgress = 1;

    state = LOSE;
}

void lose() {
    waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToStart();
}
