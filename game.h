// Constants
#define MAPHEIGHT 256
#define MAPWIDTH 256
#define GHOSTCOUNT 4
#define PELLETCOUNT 80
#define POWERPELLETCOUNT 4
#define CHARCOUNT 14
#define SCORECOUNT 7

// Variables
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
extern ANISPRITE ghosts[GHOSTCOUNT];
extern ANISPRITE pellets[PELLETCOUNT];
extern ANISPRITE powerPellets[POWERPELLETCOUNT];
extern ANISPRITE score[SCORECOUNT];
extern ANISPRITE text[CHARCOUNT];
extern unsigned char* playerCollisionmap;
extern unsigned char* enemyCollisionmap;

// Prototypes
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