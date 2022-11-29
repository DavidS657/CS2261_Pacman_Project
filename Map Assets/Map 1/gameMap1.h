
//{{BLOCK(gameMap1)

//======================================================================
//
//	gameMap1, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2021-11-01, 22:39:51
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEMAP1_H
#define GRIT_GAMEMAP1_H

#define gameMap1TilesLen 32768
extern const unsigned short gameMap1Tiles[16384];

#define gameMap1MapLen 2048
extern const unsigned short gameMap1Map[1024];

#define gameMap1PalLen 512
extern const unsigned short gameMap1Pal[256];

#endif // GRIT_GAMEMAP1_H

//}}BLOCK(gameMap1)
