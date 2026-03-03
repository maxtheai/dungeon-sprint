# Dungeon Sprint 🎮

**AI-Assisted Roguelike MVP** built with Godot 4.x

A rapid prototype to test AI game development workflows - from asset generation to code assistance.

![Status](https://img.shields.io/badge/status-in%20development-yellow)
![Engine](https://img.shields.io/badge/engine-Godot%204.x-blue)
![AI](https://img.shields.io/badge/AI-Assisted-green)

---

## 🎯 PROJECT GOALS

1. **Test AI Asset Pipeline** - Can Leonardo.ai + other tools produce shippable game art?
2. **Validate Solo Dev Speed** - 2-week MVP using AI acceleration
3. **Prove Roguelike Viability** - Core loop: enter → fight → die → retry
4. **Document Workflow** - Create reusable AI game dev pipeline

**Success Criteria:**
- ✅ Playable in browser (WebGL)
- ✅ 10-15 minute gameplay sessions
- ✅ 70%+ AI-generated assets
- ✅ Published to itch.io

---

## 🎮 GAMEPLAY

**Core Loop:**
1. Enter dungeon room
2. Defeat all enemies (2-7 per room)
3. Progress to next floor
4. Fight boss every 3 rooms
5. Die → Retry → Beat high score

**Controls:**
- **WASD / Arrow Keys:** Move
- **SPACE / Left Click:** Attack
- **E:** Special attack (area damage)

**Features:**
- Permadeath with high score tracking
- Procedural room generation
- Enemy variety (Slimes, Skeletons, Boss)
- XP and leveling system
- Difficulty scaling per floor

---

## 🏗️ TECH STACK

| Component | Technology | AI Tool |
|-----------|-----------|---------|
| **Engine** | Godot 4.x | - |
| **Language** | GDScript | GitHub Copilot |
| **2D Art** | Pixel Art | Leonardo.ai |
| **Audio SFX** | 8-bit style | ElevenLabs / Freesound |
| **Music** | Lo-fi dungeon | AIVA |
| **VCS** | Git | - |

---

## 📁 PROJECT STRUCTURE

```
dungeon-sprint/
├── assets/              # AI-generated art, audio (gitignored)
│   ├── characters/
│   ├── environment/
│   ├── items/
│   ├── ui/
│   └── audio/
├── scenes/              # Godot scene files
│   ├── main_menu.tscn
│   ├── dungeon.tscn
│   ├── player.tscn
│   └── enemies/
│       ├── slime.tscn
│       ├── skeleton.tscn
│       └── boss.tscn
├── scripts/             # GDScript code
│   ├── player.gd
│   ├── enemy.gd
│   ├── room.gd
│   ├── game_manager.gd
│   └── main_menu.gd
├── ai-pipeline/         # AI asset generation prompts
│   └── asset_specs.md
├── AI_ASSET_PIPELINE.md # Complete asset guide
├── project.godot        # Godot project file
└── README.md           # This file
```

---

## 🚀 QUICK START

### Prerequisites
- [Godot 4.x](https://godotengine.org/download) (4.2+ recommended)
- Git
- (Optional) Leonardo.ai account for asset generation

### Running the Game

```bash
# Clone repository
git clone <repo-url>
cd dungeon-sprint

# Open in Godot
# File > Import Project > Select project.godot

# Play (F5)
```

### Building for Web (itch.io)

```bash
# In Godot:
# Project > Export > Add (Web)
# Export Path: build/web/index.html
# Export Project

# Test locally:
python3 -m http.server 8000 --directory build/web
# Open http://localhost:8000
```

---

## 🤖 AI WORKFLOW

### Phase 1: Generate Assets (Days 1-3)

**Using Leonardo.ai:**
1. Generate player character sprite sheet
2. Generate enemy sprites (slime, skeleton, boss)
3. Generate tileset (floor, walls)
4. Generate UI elements
5. Generate item icons

**See:** [AI_ASSET_PIPELINE.md](AI_ASSET_PIPELINE.md) for detailed prompts

### Phase 2: Code with Copilot (Ongoing)

**Using GitHub Copilot:**
- Comment describes function → Copilot suggests implementation
- Example: "# Spawn enemy at random position" → generates code
- Review and refine AI-generated code

### Phase 3: Audio Generation (Day 4)

**SFX:** ElevenLabs free tier or Freesound.org
**Music:** AIVA for background loops

---

## 📝 DEVELOPMENT LOG

### Day 1: Project Setup ✅
- [x] Godot project initialized
- [x] Core systems coded (player, enemy, combat)
- [x] Room generation implemented
- [x] AI asset pipeline documented

### Day 2: Asset Generation 🔄
- [ ] Generate player sprites (Leonardo.ai)
- [ ] Generate enemy sprites
- [ ] Generate tileset
- [ ] Import into Godot

### Day 3: Integration 🔄
- [ ] Animate sprites
- [ ] Implement UI
- [ ] Add audio
- [ ] Polish game feel

### Day 4: Ship It! 🔄
- [ ] Bug fixes
- [ ] Balance tuning
- [ ] Web build
- [ ] itch.io upload

---

## 🎨 ASSET CHECKLIST

### Characters
- [ ] Player (knight) - idle, walk, attack, death
- [ ] Slime - idle, hop, death
- [ ] Skeleton - idle, walk, attack, death
- [ ] Boss (golem) - idle, attack, death

### Environment
- [ ] Floor tiles (4 variants)
- [ ] Wall tiles (4 directions)
- [ ] Props (torch, chest, bones)

### UI
- [ ] Health bar
- [ ] XP bar
- [ ] Buttons and frames
- [ ] Game over screen

### Audio
- [ ] Sword swing SFX
- [ ] Hit impact SFX
- [ ] Enemy death SFX
- [ ] Background music (3 loops)

---

## 🐛 KNOWN ISSUES

- Placeholder sprites currently used (colored rectangles)
- No sound implemented yet
- Balance not tuned (may be too hard/easy)
- No save/load system

---

## 🎯 FUTURE ENHANCEMENTS (Post-MVP)

If this test is successful:
- [ ] More enemy types
- [ ] Weapon variety
- [ ] Item shop between floors
- [ ] Permanent upgrades (meta-progression)
- [ ] Multiple biomes
- [ ] Online leaderboards
- [ ] Mobile port

---

## 📊 SUCCESS METRICS

| Metric | Target | Actual |
|--------|--------|--------|
| Dev Time | 2 weeks | TBD |
| AI Asset % | 70%+ | TBD |
| Performance | 60fps | TBD |
| Play Time | 10-15 min | TBD |
| Completion | itch.io | TBD |

---

## 🤝 CREDITS

**Development:** Brian Kramp + AI Assistants
**Engine:** Godot Team
**AI Tools:** Leonardo.ai, GitHub Copilot, ElevenLabs, AIVA
**Inspiration:** Slay the Spire, Enter the Gungeon, Binding of Isaac

---

## 📄 LICENSE

**Code:** MIT License (see LICENSE)
**Assets:** Check individual AI tool licenses
- Leonardo.ai: Commercial use allowed
- Review copyright implications of AI-generated content

**Note:** This is an MVP/test project. Not intended for commercial release without proper asset licensing review.

---

## 🙋 FAQ

**Q: Can I fork this?**
A: Yes! MIT licensed. Use as template for your own AI game experiments.

**Q: Will this make money?**
A: Unlikely as-is. It's a learning project. Commercial release would need original assets.

**Q: What if AI assets look inconsistent?**
A: That's part of the test! We'll document workarounds (style guides, post-processing).

**Q: Why Godot over Unity?**
A: Free forever, lightweight, excellent 2D support, no licensing concerns.

---

## 📞 CONTACT

Built as part of AI game development research.
Questions? Open an issue or reach out!

**Status:** 🔨 In Development | **Last Updated:** March 3, 2026