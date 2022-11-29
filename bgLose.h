
//{{BLOCK(bgLose)

//======================================================================
//
//	bgLose, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2021-11-02, 15:12:03
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGLOSE_H
#define GRIT_BGLOSE_H

#define bgLoseTilesLen 32768
extern const unsigned short bgLoseTiles[16384];

#define bgLoseMapLen 2048
extern const unsigned short bgLoseMap[1024];

#define bgLosePalLen 512
extern const unsigned short bgLosePal[256];

#endif // GRIT_BGLOSE_H

//}}BLOCK(bgLose)
