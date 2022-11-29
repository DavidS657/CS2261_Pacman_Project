
//{{BLOCK(bgPause)

//======================================================================
//
//	bgPause, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2021-11-02, 15:58:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGPAUSE_H
#define GRIT_BGPAUSE_H

#define bgPauseTilesLen 32768
extern const unsigned short bgPauseTiles[16384];

#define bgPauseMapLen 2048
extern const unsigned short bgPauseMap[1024];

#define bgPausePalLen 512
extern const unsigned short bgPausePal[256];

#endif // GRIT_BGPAUSE_H

//}}BLOCK(bgPause)
