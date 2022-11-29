
//{{BLOCK(gameMap2)

//======================================================================
//
//	gameMap2, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2021-11-01, 22:40:11
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEMAP2_H
#define GRIT_GAMEMAP2_H

#define gameMap2TilesLen 32768
extern const unsigned short gameMap2Tiles[16384];

#define gameMap2MapLen 2048
extern const unsigned short gameMap2Map[1024];

#define gameMap2PalLen 512
extern const unsigned short gameMap2Pal[256];

#endif // GRIT_GAMEMAP2_H

//}}BLOCK(gameMap2)
