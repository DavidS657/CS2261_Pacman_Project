#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "playerCollisionmap1.h"
#include "enemyCollisionmap1.h"
#include "playerCollisionmap2.h"
#include "enemyCollisionmap2.h"


// Variables
int hOff;
int vOff;
int ghostRand;
int toggleMovement;
int poweredUp;
int pacLives;
int ghostMulti;
int powerTimer;
int pelletCount;
int gameProgress = 1;
int scoreDigits[6];
OBJ_ATTR shadowOAM[128];
ANISPRITE pacMan;
ANISPRITE lives;
ANISPRITE score[SCORECOUNT];
ANISPRITE text[CHARCOUNT];
ANISPRITE ghosts[GHOSTCOUNT];
ANISPRITE pellets[PELLETCOUNT];
ANISPRITE powerPellets[POWERPELLETCOUNT];
unsigned char* playerCollisionmap = playerCollisionmap2Bitmap;
unsigned char* enemyCollisionmap = enemyCollisionmap2Bitmap;

// Animation states for aniState
enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

enum {GHOSTUP, GHOSTDOWN, GHOSTRIGHT, GHOSTLEFT};

// Initialize the game
void initGame() {

	// Place screen on map
    vOff = 96;
    hOff = 9;
    
    // Declaration of variables
    ghostMulti = 0;
    poweredUp = 0;
    powerTimer = 0;
    toggleMovement = 0;
    pelletCount = 80;
    // Set up elements that should persist throughout repeats
    if(gameProgress == 1) {
        initText();
        initLives();
        initScore();
        pacLives = 3;
    }
    // Logic to determine which collision map needs to be used
    if(gameProgress % 2 == 0) {
        playerCollisionmap = playerCollisionmap2Bitmap;
        enemyCollisionmap = enemyCollisionmap2Bitmap;
    } else {
        playerCollisionmap = playerCollisionmap1Bitmap;
        enemyCollisionmap = enemyCollisionmap1Bitmap;
    }
    initPlayer();
    initGhosts();
    initPellets();
    initPowerPellets();
    
}

// Updates the game each frame
void updateGame() {

	updatePlayer();
    for (int i = 0; i < GHOSTCOUNT; i++) {
        updateGhost(&ghosts[i]);
    }
    for (int i = 0; i < PELLETCOUNT; i++) {
        updatePellet(&pellets[i]);
    }
    for(int i = 0; i < POWERPELLETCOUNT; i++) {
        updatePowerPellet(&powerPellets[i]);
    }
}

// Draws the game each frame
void drawGame() {

    drawPlayer();
    drawGhosts();
    drawPellets();
    drawPowerPellets();
    drawLives();
    drawText();
    drawScore();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}

// Initialize the player
void initPlayer() {
    vOff = 96;
    hOff = 9;
    toggleMovement = 0;
    pacMan.width = 16;
    pacMan.height = 16;
    pacMan.accHeight = 13;
    pacMan.accWidth = 13;
    pacMan.rdel = 1;
    pacMan.cdel = 1;

    // Position changes depending on level
    if(gameProgress % 2 == 0) {
        pacMan.worldRow = SCREENHEIGHT / 2 - pacMan.width / 2 + vOff + 18;
    } else {
        pacMan.worldRow = SCREENHEIGHT / 2 - pacMan.width / 2 + vOff + 48;
    }

    pacMan.worldCol = SCREENWIDTH / 2 - pacMan.height / 2 + hOff;
    pacMan.aniCounter = 0;
    pacMan.curFrame = 0;
    pacMan.numFrames = 3;
    pacMan.aniState = SPRITEFRONT;
}

// Initialize the ghosts
void initGhosts() {
    for (int i = 0; i < GHOSTCOUNT;i++) {
        ghosts[i].height = 16;
        ghosts[i].width = 16;
        ghosts[i].accWidth = 14;
        ghosts[i].accHeight = 14;
        ghosts[i].rdel = 1;
        ghosts[i].cdel = 1;
        
        ghosts[i].ghostNum = i;
        ghosts[i].ghostTimer = i*420;

        if(gameProgress > 1) {
            ghosts[i].ghostTimer -= 120*i;
        }
        if(gameProgress > 2) {
            ghosts[i].ghostTimer -= 120*i;
        }
        if (gameProgress > 4) {
            ghosts[i].ghostTimer = 0;
        }
        if (gameProgress > 8) {
            ghosts[i].rdel = ghosts[i].rdel * 2;
            ghosts[i].cdel = ghosts[i].cdel * 2;
        }

        ghosts[i].spookTimer = 0;
        ghosts[i].worldRow = 112;
        ghosts[i].worldCol = 70 + (i*20);
        ghosts[i].aniCounter = 0;
        ghosts[i].curFrame = 0;
        ghosts[i].numFrames = 2;
        ghosts[i].aniState = SPRITEFRONT;
        ghosts[i].direction = GHOSTUP;
        ghosts[i].reverseCheck = 0;
        ghosts[i].gameState = 0;
        ghosts[i].hitCheck = 0;
        ghosts[i].hide = 0;
    }
}

// Initialize the pellets
void initPellets() {
    if(gameProgress % 2 == 0) {
        for (int i = 0; i < PELLETCOUNT; i++) {
            pellets[i].height = 8;
            pellets[i].width = 8;
            pellets[i].accWidth = 3;
            pellets[i].accHeight = 3;
            if( i < 5) {
                pellets[i].worldRow = 14;
                pellets[i].worldCol = 22 + (8*i);
            }
            if (i >= 5 && i < 10) {
                pellets[i].worldRow = 14;
                pellets[i].worldCol = 194 + (8*(i % 5));
            }
            if (i >= 10 && i < 15) {
                pellets[i].worldRow = 25 + (8*(i % 10));
                pellets[i].worldCol = 12;
            }
            if (i >= 15 && i < 20) {
                pellets[i].worldRow = 25 + (8*(i % 15));
                pellets[i].worldCol = 52;
            }
            if (i >= 20 && i < 25) {
                pellets[i].worldRow = 25 + (8*(i % 20));
                pellets[i].worldCol = 196;
            }
            if (i >= 25 && i < 30) {
                pellets[i].worldRow = 25 + (8*(i % 25));
                pellets[i].worldCol = 236;
            }
            if (i >= 30 && i < 40) {
                pellets[i].worldRow = 82 + (8*(i % 30));
                pellets[i].worldCol = 36;
            }
            if (i >= 40 && i < 45) {
                pellets[i].worldRow = 94;
                pellets[i].worldCol = 111 + (8*(i % 40));
            }
            if(i >= 45 && i < 55) {
                pellets[i].worldRow = 82 + (8*(i % 45));
                pellets[i].worldCol = 212;
            }
            if(i >= 55 && i < 60) {
                pellets[i].worldRow = 154 + (8*(i % 55));
                pellets[i].worldCol = 124;
            }
            if (i >= 60 && i < 65) {
                pellets[i].worldRow = 198;
                pellets[i].worldCol = 30 + (8*(i % 60));
            }
            if (i >= 65 && i < 70) {
                pellets[i].worldRow = 198;
                pellets[i].worldCol = 191 + (8*(i % 65));
            }
            if (i >= 70 && i < 75) {
                pellets[i].worldRow = 238;
                pellets[i].worldCol = 30 + (8*(i % 70));
            }
            if (i >= 75 && i < 80) {
                pellets[i].worldRow = 238;
                pellets[i].worldCol = 191 + (8*(i % 75));
            }
            pellets[i].hide = 0;
        }
    } else {
        for (int i = 0; i < PELLETCOUNT; i++) {
            pellets[i].height = 8;
            pellets[i].width = 8;
            pellets[i].accWidth = 3;
            pellets[i].accHeight = 3;
            if( i < 5) {
                pellets[i].worldRow = 14;
                pellets[i].worldCol = 22 + (8*i);
            }
            if (i >= 5 && i < 10) {
                pellets[i].worldRow = 14;
                pellets[i].worldCol = 194 + (8*(i % 5));
            }
            if (i >= 10 && i < 15) {
                pellets[i].worldRow = 25 + (8*(i % 10));
                pellets[i].worldCol = 12;
            }
            if (i >= 15 && i < 20) {
                pellets[i].worldRow = 25 + (8*(i % 15));
                pellets[i].worldCol = 68;
            }
            if (i >= 20 && i < 25) {
                pellets[i].worldRow = 25 + (8*(i % 20));
                pellets[i].worldCol = 180;
            }
            if (i >= 25 && i < 30) {
                pellets[i].worldRow = 25 + (8*(i % 25));
                pellets[i].worldCol = 236;
            }
            if (i >= 30 && i < 40) {
                pellets[i].worldRow = 67 + (8*(i % 30));
                pellets[i].worldCol = 36;
            }
            if (i >= 40 && i < 45) {
                pellets[i].worldRow = 94;
                pellets[i].worldCol = 110 + (8*(i % 40));
            }
            if(i >= 45 && i < 55) {
                pellets[i].worldRow = 67 + (8*(i % 45));
                pellets[i].worldCol = 212;
            }
            if(i >= 55 && i < 60) {
                pellets[i].worldRow = 148 ;
                pellets[i].worldCol = 108 + (8*(i % 55));
            }
            if (i >= 60 && i < 65) {
                pellets[i].worldRow = 190 + (8*(i % 60));
                pellets[i].worldCol = 12;
            }
            if (i >= 65 && i < 70) {
                pellets[i].worldRow = 190 + (8*(i % 65)) ;
                pellets[i].worldCol = 238;
            }
            if (i >= 70 && i < 75) {
                pellets[i].worldRow = 235;
                pellets[i].worldCol = 30 + (8*(i % 70));
            }
            if (i >= 75 && i < 80) {
                pellets[i].worldRow = 235;
                pellets[i].worldCol = 191 + (8*(i % 75));
            }
            pellets[i].hide = 0;
        }
    }
   
}
// Initialize the power pellets
void initPowerPellets() {
    for (int i = 0; i < POWERPELLETCOUNT; i++) {
        powerPellets[i].height = 8;
        powerPellets[i].width = 8;
        powerPellets[i].accWidth = 8;
        powerPellets[i].accHeight = 8;
        if(i == 0) {
            powerPellets[i].worldRow = 12;
            powerPellets[i].worldCol = 13;
        }
        if(i == 1) {
            powerPellets[i].worldRow = 13;
            powerPellets[i].worldCol = 234;
        }
        if(i == 2) {
            powerPellets[i].worldRow = 235;
            powerPellets[i].worldCol = 13;
        }
        if( i == 3) {
            powerPellets[i].worldRow = 235;
            powerPellets[i].worldCol = 234;
        }
       
        powerPellets[i].hide = 0;
    }   
}

// Initialize the text
void initText() {
    for (int i = 0; i < CHARCOUNT; i++) {
        if( i < 5 ) {
            text[i].screenRow = 10;
            text[i].screenCol = 10 + (8*i); 
        } else {
            text[i].screenRow = 10;
            if (i >= 9) {
                text[i].screenCol = 55 + (8*i);
            } else {
                text[i].screenCol = 50 + (8*i);
            }
        }
    }
}

// Initialize the lives
void initLives() {
    lives.screenRow = 20;
    lives.screenCol = 26;
}

// Initialize the score
void initScore(){
    for (int i = 0; i < SCORECOUNT; i++) {
        score[i].screenRow = 20;
        score[i].screenCol = 100 + (8*i);
        scoreDigits[i] = 0;
    }
    
}

// Draws the score each frame
void drawScore() {
    for(int i = 0; i < SCORECOUNT; i++) {
        shadowOAM[105 + i].attr0 =  (ROWMASK & score[i].screenRow) | ATTR0_SQUARE;
        shadowOAM[105 + i].attr1 = (COLMASK & score[i].screenCol) | ATTR1_TINY;
        if(i == 6) {
            shadowOAM[105 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 2);
        } else {
            shadowOAM[105 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreDigits[i] + 8 , 2);
        }
    }
}

// Draws the lives each frame
void drawLives() {
    shadowOAM[104].attr0 =  (ROWMASK & lives.screenRow) | ATTR0_SQUARE;
    shadowOAM[104].attr1 = (COLMASK & lives.screenCol) | ATTR1_TINY;
    if(pacLives == 3) {
        shadowOAM[104].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(11, 2);
    }
    else if (pacLives == 2) {
        shadowOAM[104].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 2);
    }
    else if (pacLives == 1) {
        shadowOAM[104].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9, 2);
    }
}

// Draws the text each frame
void drawText() {
    for(int i = 0; i < CHARCOUNT; i++) {
        shadowOAM[i+89].attr0 = (ROWMASK & text[i].screenRow) | ATTR0_SQUARE;
        shadowOAM[i+89].attr1 = (COLMASK & text[i].screenCol) | ATTR1_TINY;
        if(i < 5) {
            shadowOAM[i+89].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8 + i, 1);
        } else {
            shadowOAM[i+89].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3+i , 0);
        }
    }
}

//Updates the power pellet each frame
void updatePowerPellet(ANISPRITE* s) {
    if(collision(s->worldCol, s->worldRow, s->accWidth, s->accHeight, 
        pacMan.worldCol, pacMan.worldRow, pacMan.accWidth, pacMan.accHeight) && s->hide != 1) {
            s->hide = 1;
            poweredUp = 1;
            //Game becomes more difficult as it progresses as the duration of invincibility you get from each power pellet decreases depending on how far you are
            if(gameProgress > 3 ) {
                powerTimer = 1380;
            }
            if(gameProgress > 4 ) {
                powerTimer = 1000;
            } else {
                powerTimer = 1620;
            }
            for(int i = 0; i < GHOSTCOUNT;i++) {
                ghosts[i].hitCheck = 0;
            }
            scoreDigits[5] += 5;
            if(scoreDigits[5] >= 10) {
                scoreDigits[4] += 1;
                scoreDigits[5] = scoreDigits[5] - 10;
                if (scoreDigits[4] >= 10) {
                    scoreDigits[3] += 1;
                    scoreDigits[4] = scoreDigits[4] - 10;
                    if(scoreDigits[3] >= 10) {
                        scoreDigits[2] += 1;
                        scoreDigits[3] = scoreDigits[3] - 10; 
                        if(scoreDigits[2] >= 10) {
                            scoreDigits[1] += 1;
                            scoreDigits[2] = scoreDigits[2] - 10;
                            if(scoreDigits[1] >= 10 && scoreDigits[0] != 9) {
                                scoreDigits[0] += 1;
                                scoreDigits[1] = scoreDigits[1] - 10;
                            }
                        }
                    }
                }
            }
        }
        if(powerTimer <= 0) {
            poweredUp = 0;
        }

    s->screenRow = s->worldRow - vOff;
    s->screenCol = s->worldCol - hOff;
    powerTimer--;
}

// Draws the power pellets each frame
void drawPowerPellets() {
    for(int i = 0; i < POWERPELLETCOUNT; i++) {
        if (powerPellets[i].hide) {
            shadowOAM[i+85].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[i+85].attr0 = (ROWMASK & powerPellets[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i+85].attr1 = (COLMASK & powerPellets[i].screenCol) | ATTR1_TINY;
            shadowOAM[i+85].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1 , 26);
        }
    }
}

// Updates the pellets each frame
void updatePellet(ANISPRITE* p) {
    if(collision(p->worldCol, p->worldRow, p->accWidth, p->accHeight, 
        pacMan.worldCol, pacMan.worldRow, pacMan.accWidth, pacMan.accHeight) && p->hide != 1) {
            scoreDigits[5] += 1;
            if(scoreDigits[5] == 10) {
                scoreDigits[4] += 1;
                scoreDigits[5] = 0;
                if (scoreDigits[4] == 10) {
                    scoreDigits[3] += 1;
                    scoreDigits[4] = 0;
                    if(scoreDigits[3] == 10) {
                        scoreDigits[2] += 1;
                        scoreDigits[3] = 0; 
                        if(scoreDigits[2] == 10) {
                            scoreDigits[1] += 1;
                            scoreDigits[2] = 0;
                            if(scoreDigits[1] == 10 && scoreDigits[0] != 9) {
                                scoreDigits[0] += 1;
                                scoreDigits[1] = 0;
                            }
                        }
                    }
                }
            }
        p->hide = 1;
        pelletCount--;
    }
    p->screenRow = p->worldRow - vOff;
    p->screenCol = p->worldCol - hOff;
}

// Draws the pellets each frame
void drawPellets() {
    for(int i = 0; i < PELLETCOUNT; i++) {
        if (pellets[i].hide) {
            shadowOAM[i+5].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[i+5].attr0 = (ROWMASK & pellets[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i+5].attr1 = (COLMASK & pellets[i].screenCol) | ATTR1_TINY;
            shadowOAM[i+5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0 , 26);
    }
    }
}

// Updates the ghost each frame
void updateGhost(ANISPRITE* g) {
    
    // Logic for when ghost is in the starting area and needs to get out
    if(g-> gameState == 0 && g->ghostTimer <= 0 ) {
        g->worldCol = 120;
        g->direction = GHOSTUP;
        g->gameState = 1;
    }

    // Logic for when the ghost is eaten and has to go back to the start 
    if(g->gameState == 2) {
        g->spookTimer++;
        if (g->spookTimer >= 180) {
            g->gameState = 1;
            g->worldCol = 120;
            g->worldRow = 112;
            g->direction = GHOSTUP;
            g->spookTimer = 0;
            g->hide = 0;
        }
    }
    
    // Logic for when pacman runs into a ghost when they are powered up and eats them
    if(poweredUp == 1 && g->hitCheck == 0) {
        if(g->gameState != 2 && g->gameState != 3 && g->ghostTimer <= 0) {
            g->gameState = 3;
        }
        if(collision(g->worldCol, g->worldRow, g->accWidth, g->accHeight, 
            pacMan.worldCol, pacMan.worldRow, pacMan.accWidth, pacMan.accHeight) && g->hide != 1) {
            g->hide = 1;
            g->gameState = 2;
            g->hitCheck = 1;
            if(ghostMulti == 0) {
                scoreDigits[4] += 2;
                if (scoreDigits[4] >= 10) {
                    scoreDigits[3] += 1;
                    scoreDigits[4] = scoreDigits[4] - 10;
                    if(scoreDigits[3] >= 10) {
                        scoreDigits[2] += 1;
                        scoreDigits[3] = scoreDigits[3] - 10; 
                        if(scoreDigits[2] >= 10) {
                            scoreDigits[1] += 1;
                            scoreDigits[2] = scoreDigits[2] - 10;
                            if(scoreDigits[1] >= 10 && scoreDigits[0] != 9) {
                                scoreDigits[0] += 1;
                                scoreDigits[1] = scoreDigits[1] - 10;
                            }
                        }
                    }
                }
                ghostMulti++;
            }
            else if (ghostMulti == 1) {
                scoreDigits[4] += 4;
                if (scoreDigits[4] >= 10) {
                    scoreDigits[3] += 1;
                    scoreDigits[4] = scoreDigits[4] - 10;
                    if(scoreDigits[3] >= 10) {
                        scoreDigits[2] += 1;
                        scoreDigits[3] = scoreDigits[3] - 10; 
                        if(scoreDigits[2] >= 10) {
                            scoreDigits[1] += 1;
                            scoreDigits[2] = scoreDigits[2] - 10;
                            if(scoreDigits[1] >= 10 && scoreDigits[0] != 9) {
                                scoreDigits[0] += 1;
                                scoreDigits[1] = scoreDigits[1] - 10;
                            }
                        }
                    }
                }
                ghostMulti++;
            }
            else if (ghostMulti == 2) {
                scoreDigits[4] += 8;
                if (scoreDigits[4] >= 10) {
                    scoreDigits[3] += 1;
                    scoreDigits[4] = scoreDigits[4] - 10;
                    if(scoreDigits[3] >= 10) {
                        scoreDigits[2] += 1;
                        scoreDigits[3] = scoreDigits[3] - 10; 
                        if(scoreDigits[2] >= 10) {
                            scoreDigits[1] += 1;
                            scoreDigits[2] = scoreDigits[2] - 10;
                            if(scoreDigits[1] >= 10 && scoreDigits[0] != 9) {
                                scoreDigits[0] += 1;
                                scoreDigits[1] = scoreDigits[1] - 10;
                            }
                        }
                    }
                }
                ghostMulti++;
            }
            else if (ghostMulti == 3) {
                scoreDigits[3] += 1;
                scoreDigits[4] += 6;
                if (scoreDigits[4] >= 10) {
                    scoreDigits[3] += 1;
                    scoreDigits[4] = scoreDigits[4] - 10;
                    if(scoreDigits[3] >= 10) {
                        scoreDigits[2] += 1;
                        scoreDigits[3] = scoreDigits[3] - 10; 
                        if(scoreDigits[2] >= 10) {
                            scoreDigits[1] += 1;
                            scoreDigits[2] = scoreDigits[2] - 10;
                            if(scoreDigits[1] >= 10 && scoreDigits[0] != 9) {
                                scoreDigits[0] += 1;
                                scoreDigits[1] = scoreDigits[1] - 10;
                            }
                        }
                    }
                }
            }
        }     
        // Logic for when the ghosts get scared away when pacman picks up a power pellet
        if(g->reverseCheck == 0) {
            if(g->direction == GHOSTUP) {
                g->direction = GHOSTDOWN;
            }
            else if(g->direction == GHOSTDOWN) {
                g->direction = GHOSTUP;
            }
            else if(g->direction == GHOSTLEFT) {
                g->direction = GHOSTRIGHT;
            }
            else if(g->direction == GHOSTRIGHT) {
                g->direction = GHOSTLEFT;
            }
            g->reverseCheck = 1;
        }
    }
    
    // Logic for when ghosts hit pacman when he isn't powered up/ general state of ghost
    if (poweredUp == 0) {
        if(collision(g->worldCol, g->worldRow, g->accWidth, g->accHeight, 
            pacMan.worldCol, pacMan.worldRow, pacMan.accWidth, pacMan.accHeight) && g->hide == 0) {
            pacLives -= 1;
            initPlayer();
            initGhosts();
            
        }
        g->reverseCheck == 0;
        ghostMulti = 0;
        g->ghostTimer--; 
    }

    // Logic for ghost movement, movement is randomized, with the direction of a ghost being determined by collision with a wall. If they collide with a wall, 
    // they will move in any direction besides the one they were going in and the opposite direction that they were previously moving in
    if(g->direction == GHOSTUP) {
        if (g->worldRow > 0 && enemyCollisionmap[OFFSET(g->worldCol, g->worldRow - g->rdel, MAPWIDTH)] &&
            enemyCollisionmap[OFFSET(g->worldCol + g->width - 1, g->worldRow - g->rdel, MAPWIDTH)]) {
                g->worldRow -= g->rdel; 
            } else {
                ghostRand = rand() % 2; 
                if (ghostRand == 0) {
                    g->direction = GHOSTRIGHT;
                }
                if (ghostRand == 1) {
                    g->direction = GHOSTLEFT;   
            }
        }
    }
    if(g->direction == GHOSTDOWN) {
        if (g->worldRow + g->height < 256 && enemyCollisionmap[OFFSET(g->worldCol, g->worldRow - g->rdel + g->height + 1, MAPWIDTH)] &&
            enemyCollisionmap[OFFSET(g->worldCol + g->width - 1, g->worldRow - g->rdel + g->height + 1, MAPWIDTH)]) {
                    g->worldRow += g->rdel;
            } else {
                ghostRand = rand() % 2; 
                if (ghostRand == 0) {
                    g->direction = GHOSTRIGHT;
                }
                if (ghostRand == 1) {
                    g->direction = GHOSTLEFT;
            }
         }
    }
    if(g->direction == GHOSTLEFT) {
        if (g->worldCol > 0 && enemyCollisionmap[OFFSET(g->worldCol - 1 , g->worldRow  , MAPWIDTH)] &&
        enemyCollisionmap[OFFSET(g->worldCol - 1  , g->worldRow  + g->height - g->rdel, MAPWIDTH)]) { 
            g->worldCol -= g-> cdel;
        } else {
            ghostRand = rand() % 2; 
        if (ghostRand == 0) {
                    g->direction = GHOSTDOWN;
                }
                if (ghostRand == 1) {
                    g->direction = GHOSTUP;
                }
        }
    }
    if(g->direction == GHOSTRIGHT) {
        if (g->worldCol + g->width < 256 && enemyCollisionmap[OFFSET(g->worldCol  + g->width , g->worldRow , MAPWIDTH)] &&
        enemyCollisionmap[OFFSET(g->worldCol + g->width, g->worldRow - g->rdel  + g->height , MAPWIDTH)]) {
            g->worldCol += g->cdel;
        } else {
                ghostRand = rand() % 2; 
        if (ghostRand == 0) {
                    g->direction = GHOSTDOWN;
                }
                if (ghostRand == 1) {
                    g->direction = GHOSTUP;
                }
        }
    }
    g->screenRow = g->worldRow - vOff;
    g->screenCol = g->worldCol - hOff;

    animateGhost(g);   
}

// Animates the ghost
void animateGhost(ANISPRITE* g) {

    // Set previous state to current state
    g->prevAniState = g->aniState;
   

    // Change the animation frame every 15 frames of gameplay
    if (g->aniCounter % 15 == 0) {
        g->curFrame = (g->curFrame + 1) % g->numFrames;
    }

    // Control movement and change animation state
    if (g->direction == GHOSTUP) {
        g->aniState = SPRITEBACK;
    }
    else if(g->direction == GHOSTDOWN) {
        g->aniState = SPRITEFRONT;
    }
    else if(g->direction == GHOSTLEFT) {
        g->aniState = SPRITELEFT;
    }
    else if(g->direction == GHOSTRIGHT) {
        g->aniState = SPRITERIGHT;
    }

        g->aniCounter++;
 }

// Draws the ghost each frame
void drawGhosts() {
    for(int i = 0; i < GHOSTCOUNT; i++) {
        if (ghosts[i].hide) {
            shadowOAM[i+1].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[i+1].attr0 = (ROWMASK & ghosts[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i+1].attr1 = (COLMASK & ghosts[i].screenCol) | ATTR1_SMALL;
            // Logic for determining what sprite to use depending on whether or not the ghost is scared
            if (poweredUp == 1 && ghosts[i].gameState != 1  && ghosts[i].gameState != 2) {
                if(powerTimer <= 240 && powerTimer % 60 > 0 && powerTimer % 60 < 30) {
                    shadowOAM[i+1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(ghosts[i].curFrame*2 , 24);  
                } else {
                    shadowOAM[i+1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(ghosts[i].curFrame*2 , 22);
                }
            } else {
                shadowOAM[i+1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(ghosts[i].aniState * 2 , ghosts[i].curFrame * 2 + (4*i + 6));
            }
        }
    }
}

// Handle every-frame actions of the player
void updatePlayer() {
    if(BUTTON_PRESSED(BUTTON_UP)) {
        toggleMovement = 1;
    }
     if(BUTTON_PRESSED(BUTTON_DOWN)) {
        toggleMovement = 2;
    } 
     if(BUTTON_PRESSED(BUTTON_LEFT)) {
        toggleMovement = 3;
    } 
     if(BUTTON_PRESSED(BUTTON_RIGHT)) {
        toggleMovement = 4;
    }  
    
    // logic for emulating pac-man movement, where pac-man moves in the direction the joystick is tilted in, and doesn't have to be held to move that way.
    if(toggleMovement == 1) {
        if (pacMan.worldRow > 0 && playerCollisionmap[OFFSET(pacMan.worldCol , pacMan.worldRow - pacMan.rdel, MAPWIDTH)] &&
        playerCollisionmap[OFFSET(pacMan.worldCol + pacMan.accWidth - 1, pacMan.worldRow - pacMan.rdel, MAPWIDTH)]) {
     
            pacMan.worldRow -= pacMan.rdel;


            if (vOff > 0 && pacMan.screenRow < SCREENHEIGHT / 2 ) {
                vOff--;
            }
        }
    }

    if(toggleMovement == 2) {
        if (pacMan.worldRow + pacMan.height < 256 && playerCollisionmap[OFFSET(pacMan.worldCol, pacMan.worldRow - pacMan.rdel + pacMan.accHeight + 1 , MAPWIDTH)] &&
        playerCollisionmap[OFFSET(pacMan.worldCol + pacMan.accWidth - 1, pacMan.worldRow - pacMan.rdel + pacMan.height + 1, MAPWIDTH)]) {
            pacMan.worldRow += pacMan.rdel;

            if (vOff < MAPHEIGHT - SCREENHEIGHT && pacMan.screenRow > SCREENHEIGHT / 2 ) {
                vOff++;
            }
        }
    }
    if(toggleMovement == 3) {
        if (pacMan.worldCol > 0 && playerCollisionmap[OFFSET(pacMan.worldCol - 2 , pacMan.worldRow  , MAPWIDTH)] &&
        playerCollisionmap[OFFSET(pacMan.worldCol - 2  , pacMan.worldRow  + pacMan.accHeight - pacMan.rdel, MAPWIDTH)])
             {
                pacMan.worldCol -= pacMan.cdel;
                if (hOff > 0 && pacMan.screenCol < SCREENWIDTH / 2 ) {
                    hOff--;
            }
        }
    }
    if(toggleMovement == 4) {
        if (pacMan.worldCol + pacMan.width < 256 && playerCollisionmap[OFFSET(pacMan.worldCol  + pacMan.accWidth +2, pacMan.worldRow , MAPWIDTH)] &&
        playerCollisionmap[OFFSET(pacMan.worldCol + pacMan.accWidth +2 , pacMan.worldRow - pacMan.rdel  + pacMan.accHeight , MAPWIDTH)]) 
           {
                pacMan.worldCol += pacMan.cdel;
                if (hOff < MAPWIDTH - SCREENWIDTH && pacMan.screenCol > SCREENWIDTH / 2 ) {
                    hOff++;
                }
            }
    }
    pacMan.screenRow = pacMan.worldRow - vOff;
    pacMan.screenCol = pacMan.worldCol - hOff;

    animatePlayer();
}

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    pacMan.prevAniState = pacMan.aniState;
    pacMan.aniState = SPRITEIDLE;

    // Change the animation frame every 5 frames of gameplay
    if(pacMan.aniCounter % 5 == 0) {
        pacMan.curFrame = (pacMan.curFrame + 1) % pacMan.numFrames;
    }

    // Control movement and change animation state
    if(toggleMovement == 1)
        pacMan.aniState = SPRITEBACK;
    if(toggleMovement == 2)
        pacMan.aniState = SPRITEFRONT;
    if(toggleMovement == 3)
        pacMan.aniState = SPRITELEFT;
    if(toggleMovement == 4)
        pacMan.aniState = SPRITERIGHT;

    // If the pikachu aniState is idle, frame is pikachu standing
    if (pacMan.aniState == SPRITEIDLE) {
        pacMan.curFrame = 0;
        pacMan.aniCounter = 0;
        pacMan.aniState = pacMan.prevAniState;
    } else {
        pacMan.aniCounter++;
    }
}

// Draw the player
void drawPlayer() {

    if (pacMan.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & pacMan.screenRow) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & pacMan.screenCol) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(pacMan.aniState * 2, pacMan.curFrame * 2);
    }
}
