// Asset key constants for Phaser loader
// All paths relative to /assets/ in public/

// --- Characters ---
// Named characters have: blink, talk, 1wave, 2wave
// NPCs have: blink, talk, wave
export const CHARACTER_NAMES = [
  'Jesse', 'Riley', 'Rose', 'Tanya',
  'NPCE1', 'NPCE2', 'NPCE3', 'NPCE4', 'NPCE5', 'NPCE6', 'NPCE7',
] as const;

export type CharacterName = typeof CHARACTER_NAMES[number];

// Returns the asset keys for a character's animation frames
export function avatarKeys(name: CharacterName) {
  return {
    blink: `avatar_${name}_blink`,
    talk: `avatar_${name}_talk`,
    wave1: `avatar_${name}_wave1`,
    wave2: `avatar_${name}_wave2`,
  };
}

// Returns the file path for a character sprite
export function avatarPath(name: CharacterName, pose: string): string {
  // Named characters use _1wave/_2wave, NPCs use _wave (single frame)
  if (pose === 'wave1') {
    return name.startsWith('NPCE')
      ? `assets/avatars/${name}_wave.png`
      : `assets/avatars/${name}_1wave.png`;
  }
  if (pose === 'wave2') {
    return name.startsWith('NPCE')
      ? `assets/avatars/${name}_wave.png`  // NPCs reuse same frame
      : `assets/avatars/${name}_2wave.png`;
  }
  return `assets/avatars/${name}_${pose}.png`;
}

// --- Desks ---
export const DESK_KEYS = {
  blackIdle: 'desk_black_idle',
  blackCoding: 'desk_black_coding',
  blackCodingAlt: 'desk_black_coding_alt',
  whiteIdle: 'desk_white_idle',
  whiteCoding: 'desk_white_coding',
  whiteCodingAlt: 'desk_white_coding_alt',
} as const;

export const DESK_PATHS: Record<string, string> = {
  [DESK_KEYS.blackIdle]: 'assets/desks/desktop_set_black_down.png',
  [DESK_KEYS.blackCoding]: 'assets/desks/desktop_set_black_down_coding.png',
  [DESK_KEYS.blackCodingAlt]: 'assets/desks/desktop_set_black_down_coding-1.png',
  [DESK_KEYS.whiteIdle]: 'assets/desks/desktop_set_white_down.png',
  [DESK_KEYS.whiteCoding]: 'assets/desks/desktop_set_white_down_coding.png',
  [DESK_KEYS.whiteCodingAlt]: 'assets/desks/desktop_set_white_down_coding-1.png',
};

// --- Furniture ---
export const FURNITURE_KEYS = {
  bookshelf: 'furniture_bookshelf',
  whiteboard: 'furniture_whiteboard',
  clock: 'furniture_clock',
  plant1: 'furniture_plant1',
  plant2: 'furniture_plant2',
  couch: 'furniture_couch',
  rug: 'furniture_rug',
  coffeeMug: 'furniture_coffee_mug',
  blinds: 'furniture_blinds',
  coffeeTable: 'furniture_coffee_table',
} as const;

export const FURNITURE_PATHS: Record<string, string> = {
  [FURNITURE_KEYS.bookshelf]: 'assets/furniture/bookshelf.png',
  [FURNITURE_KEYS.whiteboard]: 'assets/furniture/whiteboard.png',
  [FURNITURE_KEYS.clock]: 'assets/furniture/clock.png',
  [FURNITURE_KEYS.plant1]: 'assets/furniture/plant1.png',
  [FURNITURE_KEYS.plant2]: 'assets/furniture/plant2.png',
  [FURNITURE_KEYS.couch]: 'assets/furniture/couch.png',
  [FURNITURE_KEYS.rug]: 'assets/furniture/rug.png',
  [FURNITURE_KEYS.coffeeMug]: 'assets/furniture/coffee_mug.png',
  [FURNITURE_KEYS.blinds]: 'assets/furniture/blinds.png',
  [FURNITURE_KEYS.coffeeTable]: 'assets/furniture/coffee_table.png',
};
