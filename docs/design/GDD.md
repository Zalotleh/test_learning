# Game Design Document
## Detective Game: "Trial by Fire"

**Version:** 1.0
**Last Updated:** 2025-11-14
**Status:** Pre-Production

---

## Table of Contents

1. [Game Overview](#game-overview)
2. [Game Pillars](#game-pillars)
3. [Core Concept](#core-concept)
4. [Narrative Structure](#narrative-structure)
5. [Memory System](#memory-system)
6. [Gameplay Mechanics](#gameplay-mechanics)
7. [Morality System](#morality-system)
8. [Skill System](#skill-system)
9. [Characters](#characters)
10. [UI/UX Design](#uiux-design)
11. [Endings](#endings)
12. [Art & Aesthetic](#art--aesthetic)
13. [Future Considerations](#future-considerations)

---

## Game Overview

**Genre:** Narrative-driven Detective Adventure
**Perspective:** First-person
**Platform:** PC / Console
**Target Audience:** Mature audiences (17+) - fans of heavy story, mystery, moral dilemmas
**Estimated Playtime:** 15-20 hours (main story)

---

## 🎯 Game Pillars

### 1. Investigative and Puzzle-like Gameplay
Each case is a mystery requiring:
- Deductive reasoning
- Evidence analysis
- Interrogation techniques
- Logic puzzles

### 2. Morality-Based Choices
Players decide whether to act ethically or selfishly:
- Directly influences character relationships
- Affects reputation in the city
- Changes available options in future cases

### 3. Choices Affect Gameplay and Ending
Every decision echoes through the game:
- Affects available skills and abilities
- Determines allies and enemies
- Influences narrative resolution
- Changes the ending

---

## 🧠 Core Concept

You play as **Alex Raines**, a former police detective turned private investigator. Burned by a corrupt system, you're now free but morally adrift. Each case is a chance to do the right thing… or survive by bending the rules.

You choose your clients. Sometimes, they're wolves in sheep's clothing. The money is good, but the consequences may be devastating.

**Central Question:** Will you pursue justice, or will you survive by any means necessary?

---

## 📚 Narrative Structure

The game is split into **3 Chapters**, each containing **3 standalone cases** connected by an overarching story arc about a city on the brink—rife with corruption, violence, and hidden power struggles.

### Chapter 1: Blood on the Pavement
**Theme:** Introduction & Moral Flexibility
You're still learning the ropes as a private investigator. Morality feels flexible. The choices seem small, but they set the foundation.

**Key Elements:**
- Establish the protagonist's character
- Introduce core mechanics
- Plant seeds for future consequences

### Chapter 2: Ties that Bind
**Theme:** Consequences & Relationships
Choices from Chapter 1 resurface. Allies and enemies begin to form. The stakes get personal.

**Key Elements:**
- Past decisions come back
- Relationships deepen or fracture
- Morality meter has visible effects

### Chapter 3: Trial by Fire
**Theme:** Culmination & Reckoning
The consequences come full circle. All relationships and endings hinge on your past decisions.

**Key Elements:**
- Major confrontations
- All choices converge
- Final moral tests
- Ending determination

### Case Flexibility

Each case allows players to:
- **Accept or refuse the client** (with consequences)
- **Choose methods:** manipulation, honesty, intimidation, etc.
- **Influence outcomes:** who lives, who dies, who gets justice
- **Discover secrets:** optional evidence that changes perspectives

---

## 🔄 Memory Fragment System

### Overview

To enrich narrative immersion and emotional continuity, each completed case (or major investigative milestone) unlocks a **"Memory Fragment."**

These fragments are pieces of the protagonist's:
- Forgotten past
- Buried trauma
- Ignored history

### Delivery Methods

Memory fragments are delivered through:

1. **Audio Logs**
   - Old voicemails
   - Analog tapes
   - Intercepted recordings
   - Phone messages

2. **Handwritten Letters**
   - From a sister
   - From a former partner
   - From an anonymous observer
   - Unsent letters

3. **News Clippings & Case Files**
   - From their time in the police force
   - Childhood events
   - Past investigations

4. **Personal Journal Scraps**
   - Updates based on player decisions
   - Reflects current moral state
   - May contradict earlier entries

### Narrative Design

These fragments are:
- **Not chronological** - pieces come in thematic order, not timeline order
- **Emotionally linked** to the case just solved
- **Deliberately ambiguous** in pronouns/gender specifics
- **Layered with suggestive detail** inviting interpretation
- **Space for self-reflection** allowing players to draw conclusions

### Example Memory Fragment

> *"You always hated lying. Even when you had to. Remember that time in the alley behind Pop's bar? You were what, nine? And you said you saw the man with the knife. But you didn't. You just wanted to protect them. You always did."*
> *(voice crackles faintly, feminine but maybe not?)*

---

## 🔓 Gameplay Integration

### Triggering Memories

- **After case resolution** - either at home, in a hidden drawer, or while revisiting a location
- **Optional discoveries** - encouraging exploration
- **Environmental triggers** - certain locations may unlock specific memories

### Memory Characteristics

- **Not all memories are warm** - some are jarring, cruel, confusing
- **Some contradict others** - leaving the player to decide which version is real
- **Morality affects memories** - some fragments may change slightly based on alignment (distorted memory effect)

### Emotional Function

1. **Builds identity ambiguity** - lets players project their understanding
2. **Strengthens moral weight** - draws parallels between past and present
3. **Adds reactivity** - same tape, different dialogue if you're corrupt

---

## 📖 Memory Archive UI

### Memory Locker (Menu Section)

Features:
- **Viewable audio logs and documents**
- **Organizable by:**
  - Location discovered
  - Case connection
  - Chronological (unlocked) order
- **Thematically dark, moody UI**
  - Shifts tone based on moral alignment
  - Warmer tones for lawful, colder for corrupt
- **Vague titles** to maintain mystery
  - Examples: "The Alley," "That Summer," "Unsent Letter"

---

## 🕹️ Gameplay Mechanics

### 📂 Case Investigation

#### 1. Exploration
- Move around crime scenes, offices, and public spaces
- First-person perspective
- Interactive environment highlighting
- Context-sensitive interactions

#### 2. Evidence Gathering
Find clues using investigation tools:
- **UV Light** - reveals hidden blood, fluids, markings
- **Recording Devices** - capture conversations, ambient sounds
- **Fingerprint Kit** - collect and analyze prints
- **Camera** - photograph evidence and scenes
- **Analysis Tools** - examine objects in detail

#### 3. Conversations & Interrogation
- **Dialogue trees** with branching options
- **Unlockable options** based on:
  - Past actions
  - Current skills
  - Evidence collected
  - Relationship status
- **Tone choices:** friendly, aggressive, manipulative, honest
- **Body language reading** (optional skill-based)

#### 4. Puzzle Solving
- **Lock picking / Safe cracking**
- **Timeline reconstruction** - piece together events
- **Evidence correlation** - connect disparate clues
- **Decryption** - passwords, codes, encrypted files
- **Deduction boards** - connect evidence to suspects

---

## 🧭 Morality System

### The Morality Meter

A spectrum between two extremes:

**Lawful ⇆ Corrupt**

- Not displayed numerically (immersive)
- Visual representation through environment and UI
- Affects all aspects of gameplay

### What Morality Affects

#### 1. NPC Behavior
- **Lawful:** NPCs trust you more, cooperate willingly
- **Corrupt:** NPCs fear you, may comply out of intimidation

#### 2. Skill Development
- **High Lawful → Unlocks:**
  - Enhanced observation
  - Trust-building dialogue
  - Legal investigation methods

- **High Corrupt → Unlocks:**
  - Blackmail options
  - Intimidation tactics
  - Evidence planting
  - Breaking and entering

#### 3. Life Circumstances
- **Lawful:** Better family relationships, community respect
- **Corrupt:** Strained relationships, criminal connections, threats

#### 4. World Changes
- **Lawful:** City grows brighter, more hopeful, cleaner streets
- **Corrupt:** City becomes darker, dingier, more dangerous

#### 5. Case Outcomes
- Different paths available based on moral standing
- Some solutions only available to lawful/corrupt players

---

## 🔓 Skill Tree (Morality-Linked)

### Core Skills

All players can develop these, but different branches unlock based on morality:

#### 1. Negotiation
- **Lawful Branch:** Empathy, persuasion, mediation
- **Corrupt Branch:** Threats, bribes, manipulation

#### 2. Observation
- **Lawful Branch:** Forensic detail, pattern recognition
- **Corrupt Branch:** Exploiting weaknesses, finding dirt

#### 3. Interrogation
- **Lawful Branch:** Building rapport, reading truth
- **Corrupt Branch:** Breaking suspects, intimidation

#### 4. Stealth
- **Lawful Branch:** Surveillance, tailing suspects
- **Corrupt Branch:** Breaking and entering, evidence planting

#### 5. Forensic Analysis
- **Lawful Branch:** Proper procedure, court-admissible evidence
- **Corrupt Branch:** Tampering, falsification, cover-ups

### Skill Point System

- Earn points by completing cases and objectives
- Some skills locked behind morality thresholds
- Skills affect dialogue options and investigation methods

---

## 🧍‍♂️ Characters

### Protagonist: Alex Raines

**Background:**
- Former police detective
- Left the force due to corruption / moral conflict
- Has a family (situation varies based on choices)
- Struggling financially and emotionally

**Customization:**
- Name (optional - default: Alex Raines)
- Gender (optional customization)
- Appearance

**Inner Conflict:**
- Justice vs. Survival
- Family vs. Principles
- Past vs. Future

**Character Arc:**
- Defined by player choices
- Can redeem themselves or fall further into corruption

---

### Key Supporting Characters

#### Clara Mendoza - Investigative Journalist

**Role:** Potential ally / love interest

**Personality:**
- Idealistic but pragmatic
- Seeks truth above all
- Sensitive to protagonist's moral choices

**Relationship Dynamics:**
- **If Lawful:** Becomes close ally, possible romance
- **If Corrupt:** Grows distant, may become adversary
- **Provides:** Information, media contacts, public pressure

---

#### Detective Kwan - Former Partner

**Role:** Ex-partner, now rival

**Personality:**
- By-the-book cop
- Feels betrayed by protagonist leaving the force
- Respects results but values procedure

**Relationship Dynamics:**
- **If Lawful:** Grudging respect, occasional help
- **If Corrupt:** Active opposition, interference
- **Provides:** Police access (or obstacles), case information

---

#### The Client Pool

Each chapter features diverse clients with hidden agendas:

1. **Cartel Boss**
   - High pay, dangerous consequences
   - Tests: Will you work for criminals?

2. **Grieving Widow**
   - Emotional manipulation
   - Tests: Can you see through victims?

3. **Crooked Politician**
   - Power and connections
   - Tests: Will you enable corruption?

4. **Scared Teenager**
   - Little money, high moral stakes
   - Tests: Will you help the powerless?

5. **Corporate Executive**
   - Legal but unethical requests
   - Tests: Where do you draw the line?

---

## 🧩 UI/UX Design

### Main Menu Systems

#### 1. Case Files Menu
- **Active Cases:** Current investigations
- **Closed Cases:** Completed investigations with outcomes
- **Evidence Review:** Re-examine collected evidence
- **Case Notes:** Player's observations and theories

#### 2. Investigation Notebook
- **Theories:** Player-created connections
- **Notes:** Custom notes and observations
- **Relationship Status:** Track NPC relationships
- **Leads:** Active investigation threads

#### 3. Dialogue System
- **Color/shade coding** based on:
  - Morality alignment
  - Skill requirements
  - Relationship thresholds
- **Locked/Unlocked** visual indicators
- **Consequence hints** (subtle icons/colors)

#### 4. Morality Indicator
- **Visual tracker** (not numerical)
- Represented through:
  - Environmental tone
  - UI color scheme
  - Character reactions
- Keeps immersion intact

#### 5. Memory Locker
- Archive of discovered memory fragments
- Atmospheric presentation
- Organized by theme/location

---

### HUD Elements

**Minimal HUD for immersion:**
- Interaction prompts (context-sensitive)
- Objective tracker (toggleable)
- Evidence quick-access
- Tool selection wheel

---

## 🏁 Endings

### Major Ending Categories

At least **3 major endings**, plus minor variations based on specific choices:

#### 1. Redemption Ending
**Requirements:** High Lawful morality

**Outcomes:**
- You played it mostly clean
- Earned respect from community
- Maintained relationships
- Personal struggles remain, but there's hope
- The city shows signs of improvement
- Justice prevails in most cases

**Tone:** Bittersweet hope

---

#### 2. Corruption Ending
**Requirements:** High Corrupt morality

**Outcomes:**
- You're powerful and feared
- Criminal connections run deep
- Isolated from loved ones
- The system works for you now
- The city grows darker
- You "won" but at tremendous cost

**Tone:** Hollow victory

---

#### 3. Gray Ending
**Requirements:** Balanced or fluctuating morality

**Outcomes:**
- Mixed results across cases
- Some relationships intact, others broken
- The system remains murky
- You made tough calls
- Neither hero nor villain
- You sleep at night… sometimes

**Tone:** Ambiguous realism

---

### Ending Variations

Within each major ending, variations based on:
- **Specific case outcomes**
- **Character relationships** (who lived, died, was saved)
- **Final case choice** (climactic decision)
- **Family status** (together, estranged, protected, endangered)

**Total Possible Endings:** 10-15 variations

---

## 🎨 Art & Aesthetic

### Visual Style

**Neo-noir with gritty realism:**

- **Color Palette:**
  - Deep shadows, high contrast
  - Muted colors with splashes of neon
  - Rain-slicked streets
  - Atmospheric lighting

- **Environmental Design:**
  - Grimy urban environments
  - Contrasting clean/dirty areas based on morality
  - Detailed crime scenes
  - Lived-in spaces with environmental storytelling

### Morality-Based Visual Cues

#### Lawful Path Visuals
- **Brighter environments** - more streetlights, cleaner spaces
- **Hopeful music** - subtle orchestral undertones
- **Warmer color grading**
- **NPCs appear friendlier** - better dressed, smiling

#### Corrupt Path Visuals
- **Dingier textures** - more grime, broken windows
- **Echoing sounds** - emptier, more threatening audio
- **Colder color grading** - blues and grays dominate
- **NPCs act colder** - suspicious glances, avoid eye contact

### Technical Art Direction

- **First-person perspective** requires detailed environment art
- **Facial animations** critical for interrogation scenes
- **Lighting** is key for mood and atmosphere
- **Weather system** for dynamic mood changes (rain, fog)

### Audio Design

- **Voice acting highly recommended** for immersion
- **Environmental audio** changes based on morality
- **Dynamic music** responding to investigation tension
- **Ambient city sounds** reflecting the world's state

---

## 🛠️ Future Considerations

### Post-Launch Content

#### 1. DLC: Additional Chapters
- New cases in the same city
- Different time periods (prequel/sequel)
- Different protagonist perspectives

#### 2. Optional Randomized Case Generator
**"Detective Mode"**
- Unlocked after main story completion
- Procedurally generated cases
- Extra hard difficulty
- New Game+ mode with harder cases

#### 3. Achievements & Moral Profiles
- **Steam Achievements** for different playstyles
- **End-game moral profile** summarizing player's journey
- **Case statistics** showing investigation performance
- **Relationship map** showing final state of all NPCs

### Potential Features

- **Photo mode** for crime scene documentation
- **Case editor** for community-created cases
- **Speedrun mode** for competitive investigation
- **Permadeath detective mode** (one chance per case)

---

## 🎯 Design Goals Summary

1. **Make every choice feel meaningful**
2. **Create moral dilemmas without clear answers**
3. **Reward thorough investigation**
4. **Build emotional connection to characters**
5. **Ensure replayability through branching paths**
6. **Maintain immersion through environmental storytelling**
7. **Balance gameplay challenge with narrative flow**

---

## 📝 Notes for Development

### Priority Systems
1. Core investigation mechanics
2. Dialogue and choice system
3. Morality tracking and consequences
4. Case 1 (prototype case)
5. Memory fragment system

### Technical Considerations
- Dialogue system needs robust branching support
- Save system must track extensive variables
- World state management for morality effects
- Performance optimization for detailed environments

---

**End of Game Design Document**

*This is a living document and will be updated throughout development.*
