static const char *colorname[] = {
    "#131618", /* 0: black (bg_dim) */
    "#D04E63", /* 1: red */
    "#72C472", /* 2: green */
    "#EAD88A", /* 3: yellow */
    "#9EDFE2", /* 4: blue (cyan) */
    "#B8A0D5", /* 5: magenta */
    "#5FB3A3", /* 6: cyan (teal) */
    "#E9F2F2", /* 7: white (fg) */
    "#33383C", /* 8: bright black */
    "#F08090", /* 9: bright red */
    "#88E888", /* 10: bright green */
    "#FFF2B0", /* 11: bright yellow */
    "#D0FFFF", /* 12: bright blue */
    "#D8C5F0", /* 13: bright magenta */
    "#88E0D0", /* 14: bright cyan */
    "#F5FAFA", /* 15: bright white */
    [255] = 0,
    /* more colors can be added after 255 to use with DefaultXX */
    [256] = "#181A1C", /* background */
};

/*
 * Default colors (colorname index)
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultbg = 256;
unsigned int defaultfg = 7;
unsigned int defaultcs = 7;
unsigned int defaultrcs = 7;
