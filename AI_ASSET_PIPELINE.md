# AI Asset Pipeline - Dungeon Sprint

**Project:** Dungeon Sprint (Roguelike MVP)  
**Style:** Pixel Art, Fantasy Dungeon  
**Engine:** Godot 4.x  
**AI Tools:** Leonardo.ai (primary), Midjourney (concepts), ElevenLabs (SFX)

---

## ASSET LIST

### 1. PLAYER CHARACTER (Knight)
**Size:** 32x32 pixels
**Animations Needed:**
- [ ] idle (4 frames)
- [ ] walk (4 directions, 4 frames each = 16 frames)
- [ ] attack (4 frames)
- [ ] hurt (2 frames)
- [ ] death (4 frames)

**Leonardo.ai Prompt:**
```
Pixel art knight character, 32x32, fantasy dungeon crawler, 
medieval armor, sword and shield, idle pose, 
simple color palette, 8-bit style, white background, 
sprite sheet, game asset
```

**Style Reference:** Slay the Spire, Enter the Gungeon

---

### 2. ENEMIES

#### A. SLIME (Basic Enemy)
**Size:** 24x24 pixels
**Animations:**
- [ ] idle (4 frames, pulsing)
- [ ] hop/walk (4 frames)
- [ ] attack (2 frames)
- [ ] death (4 frames, shrinking)

**Leonardo.ai Prompt:**
```
Pixel art slime monster, 24x24, green gelatinous blob, 
animated bounce, cute but dangerous, dungeon enemy, 
sprite sheet, 8-bit style, white background
```

#### B. SKELETON (Stronger Enemy)
**Size:** 32x32 pixels
**Animations:**
- [ ] idle (2 frames, breathing)
- [ ] walk (4 frames)
- [ ] attack (4 frames, sword swing)
- [ ] death (4 frames, collapsing)

**Leonardo.ai Prompt:**
```
Pixel art skeleton warrior, 32x32, undead dungeon enemy, 
bones and sword, animated, sprite sheet, 
8-bit style, white background, fantasy
```

#### C. BOSS - DUNGEON GUARDIAN
**Size:** 64x64 pixels
**Animations:**
- [ ] idle (4 frames)
- [ ] attack (6 frames)
- [ ] special attack (8 frames)
- [ ] hurt (2 frames)
- [ ] death (6 frames)

**Leonardo.ai Prompt:**
```
Pixel art dungeon boss, 64x64, massive stone golem, 
glowing eyes, boss enemy, animated sprite sheet, 
8-bit style, white background, dark fantasy
```

---

### 3. ENVIRONMENT TILES

#### A. FLOOR TILES
**Size:** 32x32 pixels each
**Variations:**
- [ ] Floor base (stone)
- [ ] Floor variant 1 (cracked)
- [ ] Floor variant 2 (mossy)
- [ ] Floor variant 3 (blood stain)

**Leonardo.ai Prompt:**
```
Pixel art dungeon floor tile, 32x32, stone texture, 
top-down view, game tileset, 8-bit style, 
seamless texture, dark fantasy
```

#### B. WALL TILES
**Size:** 32x32 pixels each
**Variations:**
- [ ] Wall top (horizontal)
- [ ] Wall side (vertical)
- [ ] Wall corner (inner)
- [ ] Wall corner (outer)
- [ ] Pillar

**Leonardo.ai Prompt:**
```
Pixel art dungeon wall tile, 32x32, stone brick, 
top-down view, game tileset, 8-bit style, 
dark fantasy, seamless
```

#### C. PROPS/DECORATIONS
- [ ] Torch (animated, 4 frames)
- [ ] Chest (closed, open)
- [ ] Bones/skulls (static)
- [ ] Chains
- [ ] Spider webs
- [ ] Cracks/decals

---

### 4. ITEMS/LOOT
**Size:** 16x16 pixels each

- [ ] Health potion (red flask)
- [ ] Sword upgrade
- [ ] Shield
- [ ] Gold coins
- [ ] Key

**Leonardo.ai Prompt:**
```
Pixel art health potion, 16x16, red flask, 
game item, 8-bit style, white background
```

---

### 5. UI ELEMENTS
**Style:** Pixel art UI, dark fantasy theme

- [ ] Health bar (frame + fill)
- [ ] XP bar
- [ ] Button (normal, hover, pressed)
- [ ] Panel/frame (for menus)
- [ ] Minimap frame
- [ ] Inventory slots
- [ ] Font: Pixelated font (use Kenney Pixel or similar)

**Leonardo.ai Prompt:**
```
Pixel art UI frame, health bar border, 
dark fantasy style, 8-bit, game interface, 
stone texture border
```

---

### 6. EFFECTS/VFX
**Size:** Variable

- [ ] Sword slash (3 frames)
- [ ] Hit impact/spark (3 frames)
- [ ] Magic/spell effect (optional)
- [ ] Death poof/smoke (4 frames)
- [ ] Item pickup glow

---

### 7. AUDIO (ElevenLabs + AIVA)

#### SFX (ElevenLabs or Freesound):
- [ ] Sword swing (whoosh)
- [ ] Hit impact (grunt + thud)
- [ ] Enemy death (slime pop, bone crumble)
- [ ] Item pickup (coin jingle)
- [ ] Footsteps (stone)
- [ ] UI click
- [ ] Level up (fanfare - short)

#### Music (AIVA):
- [ ] Main menu theme (loop, 60-90 seconds)
- [ ] Dungeon ambient (loop, 2-3 minutes)
- [ ] Boss battle (loop, 2 minutes)
- [ ] Game over (stinger, 5 seconds)
- [ ] Victory (stinger, 5 seconds)

**AIVA Prompt:**
```
Dark fantasy dungeon crawler, 8-bit retro style, 
loopable, atmospheric, mysterious, tension
```

---

## WORKFLOW

### Phase 1: Concept (Day 1)
1. Generate 5-10 concepts in Midjourney for each character
2. Pick style direction
3. Create detailed prompts for Leonardo.ai

### Phase 2: Asset Generation (Days 2-3)
1. Generate all sprites in Leonardo.ai
2. Batch download and organize
3. Quick cleanup in Aseprite (if needed)

### Phase 3: Animation (Day 4)
1. Slice sprite sheets
2. Create animations in Godot
3. Test in-game

### Phase 4: Audio (Day 5)
1. Generate SFX (ElevenLabs/Freesound)
2. Create music loops (AIVA)
3. Implement in Godot

---

## LEONARDO.AI SETTINGS

**Model:** Leonardo Diffusion XL or Phoenix
**Preset:** Pixel Art Style
**Resolution:** 512x512 (for multiple sprites)
**Guidance Scale:** 7
**Steps:** 30

**Post-Processing:**
- Download PNG
- Open in Aseprite
- Cut out individual sprites
- Save as 32x32 or appropriate size

---

## BUDGET ESTIMATE

**Leonardo.ai:** $10/month (free tier = 150 tokens/day, may be enough)
**ElevenLabs:** Free tier (10k characters/month)
**AIVA:** Free tier (3 downloads/month)
**Aseprite:** $20 one-time (optional, can use free alternatives)

**Total:** $10-30 for asset generation

---

## ALTERNATIVE: PLACEHOLDER ASSETS

If AI generation is slow, use FREE placeholders:

**Kenney Assets:**
- https://kenney.nl/assets/series:Dungeon
- Pre-made, CC0 license
- Replace with AI later

**OpenGameArt:**
- https://opengameart.org/
- Search "dungeon crawler sprites"

**Asset Pack Recommendations:**
- "Dungeon Crawl Stone Soup" tiles (open source)
- "Pixel Dungeon" assets (open source)

---

## QUALITY CHECKLIST

Before using an AI-generated asset:
- [ ] Consistent art style across all assets?
- [ ] Properly sized (powers of 2)?
- [ ] Readable at game resolution?
- [ ] Distinguishable from background?
- [ ] Animation frames consistent?

**Style Consistency Tip:**
Use the SAME seed/prompt structure for all assets in a category. Reference previous outputs for style matching.

---

## FILE ORGANIZATION

```
assets/
├── characters/
│   ├── player/
│   │   ├── knight_idle.png
│   │   ├── knight_walk.png
│   │   └── knight_attack.png
│   └── enemies/
│       ├── slime/
│       ├── skeleton/
│       └── boss/
├── environment/
│   ├── tiles/
│   │   ├── floor.png
│   │   └── walls.png
│   └── props/
├── items/
├── ui/
└── audio/
    ├── sfx/
    └── music/
```

---

**Last Updated:** March 3, 2026
**Next Step:** Generate first batch of assets (Player + Floor tiles)