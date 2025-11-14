# Development Roadmap
## Detective Game - "Trial by Fire"

**Project Duration:** 18-24 months (estimated)
**Team Size:** TBD (Currently planning phase)
**Last Updated:** 2025-11-14

---

## Overview

This roadmap outlines the development phases from pre-production through launch. Each phase has specific goals, deliverables, and milestones.

**Total Estimated Timeline:** 18-24 months
- **Pre-Production:** 2-3 months
- **Prototype:** 3-4 months
- **Vertical Slice:** 3-4 months
- **Production:** 8-12 months
- **Polish & Testing:** 2-3 months

---

## Phase 0: Pre-Production (Months 1-3)
**Status:** CURRENT PHASE
**Goal:** Establish foundation, tools, and core systems

### Month 1: Foundation & Planning

#### Week 1-2: Project Setup
- [x] Create Game Design Document
- [x] Write Technical Specifications
- [x] Define development roadmap
- [ ] Set up Unity project (2022.3 LTS)
- [ ] Configure version control (Git)
- [ ] Create project folder structure
- [ ] Install essential packages (URP, TextMeshPro, Cinemachine)

#### Week 3-4: Core Systems Design
- [ ] Research and install Ink dialogue system
- [ ] Create system architecture diagrams
- [ ] Design save/load system structure
- [ ] Design morality system mechanics
- [ ] Create first Ink dialogue test

**Deliverables:**
- ✅ Complete GDD
- ✅ Technical specifications
- Unity project initialized
- Basic dialogue test working

---

### Month 2: Core Mechanics Prototype

#### Week 1-2: Player Controller & Movement
- [ ] First-person camera controller
- [ ] Basic movement (WASD + mouse look)
- [ ] Interaction system (raycast, highlight objects)
- [ ] Pick up and examine objects
- [ ] Basic inventory system

#### Week 3-4: Investigation Basics
- [ ] Evidence collection system
- [ ] Evidence UI (basic list)
- [ ] Simple puzzle (lock picking or safe cracking)
- [ ] Notebook system (basic notes)

**Deliverables:**
- Playable first-person character
- Working interaction system
- Basic evidence collection
- One simple puzzle

---

### Month 3: Dialogue & Choice System

#### Week 1-2: Dialogue Implementation
- [ ] Integrate Ink with Unity
- [ ] Create dialogue UI (TextMeshPro)
- [ ] Implement choice selection
- [ ] Test branching conversations
- [ ] Create sample NPC conversation

#### Week 3-4: Choice Consequences
- [ ] Morality tracking system
- [ ] Variable passing between Ink and Unity
- [ ] Locked dialogue options (based on morality/skills)
- [ ] Visual feedback for choice consequences

**Deliverables:**
- Functional dialogue system
- Branching conversation test
- Morality system tracking choices
- Sample NPC with 3+ dialogue paths

**Phase 0 Milestone:** Pre-production complete, core systems functional

---

## Phase 1: Prototype (Months 4-6)
**Goal:** Build a playable prototype of one simple case

### Month 4: Prototype Case Design

#### Week 1-2: Case Writing
- [ ] Write complete prototype case (Case 0: "The Missing Person")
  - Simple mystery, 3 suspects
  - 5-7 evidence pieces
  - 2 moral choices
  - 2 possible endings
- [ ] Create Ink dialogue for all NPCs
- [ ] Design investigation locations (2-3 scenes)

#### Week 3-4: Environment Greyboxing
- [ ] Create 3 investigation scenes (greybox/placeholder art)
  - Detective's office
  - Crime scene
  - Interrogation room
- [ ] Place interactive objects
- [ ] Add evidence placement

**Deliverables:**
- Complete prototype case design
- All dialogue written in Ink
- 3 greybox scenes

---

### Month 5: Prototype Implementation

#### Week 1-2: Case Logic
- [ ] Implement case progression system
- [ ] Create objective tracker
- [ ] Connect evidence to case progress
- [ ] Implement interrogation dialogue

#### Week 3-4: Puzzles & Endings
- [ ] Build 1-2 investigation puzzles
- [ ] Implement case resolution logic
- [ ] Create 2 different endings
- [ ] Test full case playthrough (30-60 min)

**Deliverables:**
- Fully playable prototype case
- Start to finish gameplay loop
- Multiple endings working

---

### Month 6: Prototype Polish & Testing

#### Week 1-2: UI Polish
- [ ] Design case file UI
- [ ] Create evidence examination UI
- [ ] Build notebook/journal system
- [ ] Add pause menu and settings

#### Week 3-4: Playtesting
- [ ] Internal playtesting (5+ players)
- [ ] Gather feedback on:
  - Investigation clarity
  - Dialogue pacing
  - Choice meaningfulness
  - Puzzle difficulty
- [ ] Iterate based on feedback

**Deliverables:**
- Polished prototype case
- Playtest feedback report
- Iteration plan

**Phase 1 Milestone:** Playable prototype demonstrating core gameplay loop

---

## Phase 2: Vertical Slice (Months 7-9)
**Goal:** Create one fully polished case with all features

### Month 7: Vertical Slice Case Design

#### Week 1-2: Chapter 1, Case 1 Design
- [ ] Write full case with all features:
  - Complex investigation (8+ evidence pieces)
  - 4-5 NPCs with full character arcs
  - 3+ moral choice moments
  - Multiple interrogation scenes
  - Relationship system integration
  - Memory fragment unlock
- [ ] Create detailed scene designs (4-5 locations)

#### Week 3-4: Advanced Systems
- [ ] Implement relationship tracking system
- [ ] Build skill tree foundation
- [ ] Create memory fragment system
- [ ] Design morality visual feedback

**Deliverables:**
- Complete Chapter 1, Case 1 design
- Relationship system functional
- Memory fragment system working

---

### Month 8: Art & Audio Production Begins

#### Week 1-2: Art Pipeline
- [ ] Establish art style (reference boards)
- [ ] Create 3D asset production pipeline
- [ ] Build modular environment kit (walls, floors, props)
- [ ] Create lighting templates for scenes

#### Week 3-4: Audio Foundation
- [ ] Define audio requirements
- [ ] Create sound effect list
- [ ] Record temp voice acting for testing
- [ ] Implement basic audio system

**Deliverables:**
- Art style guide
- First set of production-quality 3D assets
- Temp audio implemented

---

### Month 9: Vertical Slice Completion

#### Week 1-2: Integration
- [ ] Replace greybox with final art (1 complete scene)
- [ ] Implement all case mechanics
- [ ] Add memory fragment cutscene/presentation
- [ ] Polish UI for all systems

#### Week 3-4: Polish & Demo
- [ ] Extensive bug fixing
- [ ] Performance optimization
- [ ] Create demo build (for investors/publishers)
- [ ] Create pitch materials

**Deliverables:**
- One fully polished case (1-2 hours gameplay)
- Demo build ready
- All core features demonstrated

**Phase 2 Milestone:** Vertical slice complete, ready for funding/publishing pitches

---

## Phase 3: Production (Months 10-18)
**Goal:** Implement all 9 cases, complete narrative, full art production

### Months 10-12: Chapter 1 Production

#### Case Production Pipeline (per case):
1. **Design (2 weeks)**
   - Write case narrative
   - Design puzzles and investigation flow
   - Create Ink dialogue

2. **Implementation (2 weeks)**
   - Build scenes (greybox)
   - Implement case logic
   - Add all evidence and interactables

3. **Art & Audio (2 weeks)**
   - Create/integrate final 3D assets
   - Lighting and post-processing
   - Sound effects and music

4. **Testing & Polish (1 week)**
   - Internal testing
   - Bug fixes
   - Balance and pacing

**Chapter 1 Goals:**
- [ ] Complete Case 1.1 (already done in vertical slice)
- [ ] Complete Case 1.2
- [ ] Complete Case 1.3
- [ ] Implement chapter-wide consequence tracking
- [ ] Create chapter ending sequence

**Deliverables:**
- Chapter 1 complete (3 cases)
- All Chapter 1 memory fragments
- Character relationship arcs established

---

### Months 13-15: Chapter 2 Production

**Chapter 2 Goals:**
- [ ] Complete Case 2.1
- [ ] Complete Case 2.2
- [ ] Complete Case 2.3
- [ ] Implement consequence callbacks from Chapter 1
- [ ] Create chapter-specific NPCs
- [ ] Chapter 2 memory fragments

**Added Features:**
- [ ] More complex puzzles
- [ ] Deeper relationship consequences
- [ ] Morality-locked content demonstrates impact

**Deliverables:**
- Chapter 2 complete (3 cases)
- Branching paths showing consequence of Ch1 choices
- Mid-game content complete

---

### Months 16-18: Chapter 3 Production

**Chapter 3 Goals:**
- [ ] Complete Case 3.1
- [ ] Complete Case 3.2
- [ ] Complete Case 3.3 (climactic case)
- [ ] Implement all ending branches
- [ ] Create ending cinematics/sequences
- [ ] Final memory fragment revelations

**Ending Implementation:**
- [ ] Redemption ending
- [ ] Corruption ending
- [ ] Gray ending
- [ ] Minor variations (10+ ending permutations)

**Deliverables:**
- Chapter 3 complete (3 cases)
- All endings implemented
- Complete narrative arc finished
- Full game playable start to finish

**Phase 3 Milestone:** Full game content complete (Alpha)

---

## Phase 4: Polish & Beta (Months 19-21)
**Goal:** Bug fixing, optimization, and final polish

### Month 19: Alpha Testing

#### Week 1-2: Internal Testing
- [ ] Full playthrough testing (all paths)
- [ ] Bug database setup
- [ ] Critical bug fixing
- [ ] Performance profiling

#### Week 3-4: Closed Alpha
- [ ] Select 20-30 external testers
- [ ] Gather feedback on:
  - Story coherence
  - Pacing issues
  - Difficulty balance
  - Technical issues
- [ ] Create prioritized fix list

**Deliverables:**
- Bug database with 100+ issues logged
- Playtest feedback report
- Fix priority list

---

### Month 20: Beta Testing

#### Week 1-2: Beta Build
- [ ] Fix all critical bugs
- [ ] Performance optimization pass
- [ ] UI/UX improvements based on feedback
- [ ] Balance tuning (puzzle difficulty, morality impact)

#### Week 3-4: Open Beta
- [ ] Expand to 100+ testers
- [ ] Gather metrics:
  - Completion rate
  - Average playtime
  - Most common choices
  - Crash reports
- [ ] Final major bug fixes

**Deliverables:**
- Beta build
- Performance targets met (60 FPS)
- Most bugs resolved

---

### Month 21: Final Polish

#### Week 1-2: Quality Assurance
- [ ] Final bug fixing pass
- [ ] Localization preparation (if applicable)
- [ ] Achievement implementation
- [ ] Steam integration (Cloud saves, Workshop if applicable)

#### Week 3-4: Release Candidate
- [ ] Create Release Candidate build
- [ ] Final certification testing
- [ ] Create patch plan for post-launch
- [ ] Prepare day-one patch if needed

**Deliverables:**
- Release Candidate build
- Zero critical bugs
- Ready for certification (console)

**Phase 4 Milestone:** Game ready for launch (Gold)

---

## Phase 5: Launch & Post-Launch (Month 22+)
**Goal:** Release game and support with patches/DLC

### Month 22: Launch

#### Week 1-2: Pre-Launch
- [ ] Submit to platform certification (Steam, consoles)
- [ ] Create launch trailer
- [ ] Marketing push (social media, press releases)
- [ ] Review key distribution
- [ ] Set up community channels (Discord, Reddit)

#### Week 3-4: Launch Week
- [ ] Monitor for critical bugs
- [ ] Rapid response patch if needed
- [ ] Community management
- [ ] Track reviews and feedback

**Deliverables:**
- Game launched on PC (Steam)
- Marketing materials released
- Community engagement active

---

### Months 23-24: Post-Launch Support

#### Patch Schedule
- [ ] Patch 1.01 (Week 1): Critical bug fixes
- [ ] Patch 1.1 (Month 1): QoL improvements, balance
- [ ] Patch 1.2 (Month 2): Community-requested features

#### DLC Planning (if successful)
- [ ] Analyze player data (which endings, choices)
- [ ] Design DLC case based on player interest
- [ ] Consider randomized case generator mode

**Deliverables:**
- Stable, well-supported game
- Positive community relationship
- Foundation for future content

---

## Key Milestones Summary

| Milestone | Target Date | Description |
|-----------|-------------|-------------|
| **Pre-Production Complete** | Month 3 | Core systems functional |
| **Prototype Complete** | Month 6 | One playable case |
| **Vertical Slice Complete** | Month 9 | Fully polished demo case |
| **Alpha** | Month 18 | All content complete |
| **Beta** | Month 20 | Bug-fixed, optimized |
| **Gold** | Month 21 | Ready for launch |
| **Launch** | Month 22 | Game released |

---

## Resource Requirements

### Team Size Estimates

**Minimum Viable Team:**
- 1 Game Designer / Writer
- 1 Programmer (Unity C#)
- 1 3D Artist
- 1 Audio Designer
- 1 Producer / Project Manager (can be part-time)

**Ideal Team:**
- 1 Lead Designer / Writer
- 2 Programmers (gameplay + systems)
- 2 3D Artists (environment + props)
- 1 UI/UX Designer
- 1 Audio Designer / Composer
- Voice Actors (contract)
- 1 Producer
- QA Testers (contract, during beta)

### Budget Considerations

**Major Costs:**
- Salaries (largest expense)
- Unity Pro licenses (if team > 5)
- Asset Store purchases (~$500-1000)
- Audio assets / music licensing
- Voice acting (professional VO: $5k-20k+)
- Marketing (10-20% of budget)
- Platform fees (Steam: 30% revenue share)

---

## Risk Management

### High-Risk Items

1. **Scope Creep**
   - **Risk:** 9 cases is a lot of content
   - **Mitigation:** Reuse systems, modular design, strict feature lock after vertical slice

2. **Dialogue Complexity**
   - **Risk:** Branching narrative becomes unmanageable
   - **Mitigation:** Use Ink, create templates, regular testing

3. **Team Burnout**
   - **Risk:** Long development cycle (18-24 months)
   - **Mitigation:** Realistic milestones, avoid crunch, celebrate progress

4. **Funding**
   - **Risk:** Running out of money before completion
   - **Mitigation:** Seek publisher after vertical slice, consider Early Access

5. **Technical Debt**
   - **Risk:** Poor early decisions causing problems later
   - **Mitigation:** Plan architecture early, refactor when needed

---

## Success Metrics

### Development Metrics
- Stay within timeline (±10%)
- Stay within budget (±15%)
- Hit all major milestones
- Maintain team morale

### Launch Metrics
- **Critical Success:** 500+ sales in first month
- **Moderate Success:** 5,000+ sales in first month
- **High Success:** 20,000+ sales in first month

### Quality Metrics
- 75+ Metacritic score (if reviewed)
- 80%+ positive Steam reviews
- 15+ hour average playtime
- 50%+ completion rate

---

## Current Status

**Current Phase:** Phase 0 - Pre-Production
**Completed:**
- ✅ Game Design Document
- ✅ Technical Specifications
- ✅ Development Roadmap

**Next Immediate Steps:**
1. Set up Unity project (2022.3 LTS)
2. Install essential packages (URP, Ink, TextMeshPro)
3. Create basic project structure
4. Build simple first-person controller
5. Test Ink dialogue integration

---

## Appendix: Additional Considerations

### Platform Porting Timeline

If porting to consoles after PC launch:
- **Month 23-26:** Console porting
- **Month 27:** Console certification
- **Month 28:** Console launch

### Localization Timeline

If adding multiple languages:
- **Month 20:** Finalize all text
- **Month 21:** Send for translation
- **Month 22-23:** Implement translations
- **Month 24:** Localized launch

### Marketing Timeline

- **Month 9:** Announce game (after vertical slice)
- **Month 12:** First trailer
- **Month 18:** Gameplay deep-dive
- **Month 21:** Launch trailer
- **Month 22:** Launch
- **Ongoing:** Community engagement, updates

---

**Next Steps:** Begin Phase 0, Month 1 tasks. Set up Unity and start building core systems.

---

**End of Development Roadmap**

*This roadmap is a living document and will be updated as development progresses.*
