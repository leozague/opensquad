// Slimmed palette — only badge colors and layout constants
// All visual rendering now uses sprite assets, not procedural colors

export const COLORS = {
  // Status badge dots
  statusIdle: 0xaaaacc,
  statusWorking: 0x60b0ff,
  statusDone: 0x60f080,
  statusCheckpoint: 0xffbb22,

  // Name badge
  nameCardBg: 0x14141c,
  nameCardText: 0xffffff,

  // Background
  background: 0x1a1420,

  // Floor fill (warm wood)
  floor: 0xc4a882,
  floorAlt: 0xb89a72,

  // Wall fill
  wall: 0xe4d8cc,
  wallTrim: 0xa89888,
} as const;

// Layout constants
export const TILE = 32;           // Base tile size in pixels
export const CELL_W = 4 * TILE;   // 128px — desk cell width
export const CELL_H = 4 * TILE;   // 128px — desk cell height
export const MARGIN = 2 * TILE;   // 64px — room edge margin
export const WALL_H = 2 * TILE;   // 64px — wall strip height at top
