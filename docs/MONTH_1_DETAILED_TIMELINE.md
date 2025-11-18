# Month 1: Pre-Production - Detailed Week-by-Week Breakdown

**Goal:** Complete all pre-production tasks and have a playable prototype by end of month

**Total Hours:** ~80-100 hours (20-25 hours per week)

---

## 📅 Week 1: Unity Setup & Learning Basics

**Goal:** Get Unity running, understand the interface, create first test scene

**Estimated Time:** 20-25 hours

---

### Monday (Day 1) - 4-5 hours

**Morning Session (2-3 hours):**
- [ ] Download and install Unity Hub
- [ ] Install Unity 2022.3 LTS (this takes time!)
- [ ] Install Visual Studio or Rider
- [ ] Open project in Unity for first time
- [ ] Wait for initial import (15+ minutes)
- [ ] Fix any errors that appear

**Afternoon Session (2 hours):**
- [ ] Follow Unity interface tutorial (built-in or YouTube)
- [ ] Learn Scene, Hierarchy, Inspector, Project windows
- [ ] Practice camera navigation (right-click, middle-click, scroll)
- [ ] Create a cube, move it, scale it, rotate it
- [ ] Delete it and create it again (get comfortable!)

**Evening (optional reading):**
- [ ] Read `CONTROLS_AND_SYSTEMS.md`
- [ ] Skim through `FIRST_SCENE_WALKTHROUGH.md`

---

### Tuesday (Day 2) - 5-6 hours

**Morning Session (3 hours):**
- [ ] Install required packages:
  - [ ] TextMeshPro (and import essentials)
  - [ ] Cinemachine
  - [ ] Input System
  - [ ] Verify URP is installed
- [ ] Create URP rendering asset
- [ ] Configure project settings (quality, graphics)
- [ ] Test that URP is working (materials aren't pink)

**Afternoon Session (2-3 hours):**
- [ ] Download Ink Unity Integration from GitHub
- [ ] Import Ink .unitypackage
- [ ] Install Inky editor on your computer
- [ ] Open one of the sample Ink scripts in Inky
- [ ] Understand Ink syntax basics
- [ ] Make a tiny test dialogue yourself

**Evening:**
- [ ] Git commit: "Set up Unity packages and Ink integration"

---

### Wednesday (Day 3) - 5 hours

**Morning Session (2-3 hours):**
- [ ] Start `FIRST_SCENE_WALKTHROUGH.md`
- [ ] Create new scene: TestScene
- [ ] Build ground (plane scaled to 10x10)
- [ ] Build 4 walls around perimeter
- [ ] Add a desk and chair (cubes scaled appropriately)
- [ ] Position directional light for mood

**Afternoon Session (2 hours):**
- [ ] Create Player GameObject
- [ ] Add Camera as child of Player
- [ ] Add CharacterController component
- [ ] Add PlayerController script
- [ ] Add PlayerInteraction script
- [ ] Configure all components
- [ ] **TEST:** Press Play, move around with WASD
- [ ] **TEST:** Look around with mouse

**Evening:**
- [ ] Fix any bugs from testing
- [ ] Git commit: "Create first playable test scene"

---

### Thursday (Day 4) - 4-5 hours

**Morning Session (2 hours):**
- [ ] Create Manager container (=== MANAGERS ===)
- [ ] Add GameManager GameObject with script
- [ ] Add MoralityManager GameObject with script
- [ ] Add CaseManager GameObject with script
- [ ] Add SaveManager GameObject with script
- [ ] Add TestCaseStarter GameObject with script
- [ ] **TEST:** Play scene, check Console for manager initialization

**Afternoon Session (2-3 hours):**
- [ ] Create first evidence item (yellow cube on desk)
- [ ] Add EvidenceItem component
- [ ] Configure evidence ID, name, description
- [ ] Add Box Collider
- [ ] **TEST:** Walk up to evidence, press E
- [ ] **TEST:** Check Console for "Evidence collected"
- [ ] Create 2 more evidence items in different locations

**Evening:**
- [ ] Test all evidence collection
- [ ] Test morality debug buttons in Inspector
- [ ] Git commit: "Add managers and evidence collection"

---

### Friday (Day 5) - 3-4 hours

**Morning/Afternoon Session (3-4 hours):**
- [ ] Add atmospheric lighting:
  - [ ] Adjust directional light (angle, color, intensity)
  - [ ] Add point lights (desk lamp, ceiling)
  - [ ] Add fog (Window > Rendering > Lighting)
- [ ] Organize hierarchy properly
- [ ] Create materials for different objects
- [ ] Add colors to differentiate objects
- [ ] Polish the scene appearance

**Testing Session:**
- [ ] Full playthrough test (5-10 minutes)
- [ ] Document any bugs
- [ ] Fix critical bugs

**Evening:**
- [ ] Git commit: "Polish test scene with lighting and materials"
- [ ] Take screenshot of your scene!

---

### Weekend (Days 6-7) - Optional 4-6 hours

**Saturday (2-3 hours):**
- [ ] Experiment! Try adding:
  - [ ] InteractableDoor to your scene
  - [ ] InteractableDrawer (put evidence inside!)
  - [ ] InteractableLightSwitch
  - [ ] InteractableDocument (a note on the desk)
- [ ] Test each interactable
- [ ] Get comfortable with adding components

**Sunday (2-3 hours):**
- [ ] Review what you learned this week
- [ ] Read through Case 1 design (`CH1_CASE01_TheLastCall.md`)
- [ ] Plan Week 2 based on case requirements
- [ ] Optional: Watch Unity tutorials on YouTube
- [ ] Optional: Play detective games for inspiration (Obra Dinn, LA Noire)

**Week 1 Complete!** ✅

---

## 📅 Week 2: First Case Implementation Begins

**Goal:** Start building David's apartment scene and core investigation mechanics

**Estimated Time:** 20-25 hours

---

### Monday (Day 8) - 5 hours

**Morning Session (3 hours):**
- [ ] Create new scene: `David_Apartment`
- [ ] Reference case design for apartment layout
- [ ] Build apartment structure:
  - [ ] Floor (larger than test scene)
  - [ ] Walls (define rooms: main room, kitchen, bathroom)
  - [ ] Ceiling (important for lighting)
  - [ ] Windows (even if just dark cubes for now)
- [ ] Add basic furniture (cubes/cylinders for now):
  - [ ] Bed
  - [ ] Desk with computer
  - [ ] Bookshelf
  - [ ] Kitchen counter
  - [ ] Small table

**Afternoon Session (2 hours):**
- [ ] Add Player and Manager systems to scene
- [ ] Set spawn position (at apartment entrance)
- [ ] Add TestCaseStarter (start Case 1)
- [ ] Add lighting:
  - [ ] One main ceiling light
  - [ ] Desk lamp
  - [ ] Window light (directional through window)
  - [ ] Dark, moody atmosphere
- [ ] **TEST:** Walk through apartment

**Evening:**
- [ ] Git commit: "Create David's apartment base scene"

---

### Tuesday (Day 9) - 5-6 hours

**Morning Session (3 hours):**
- [ ] Add evidence items from case design:
  - [ ] Empty pill bottles (near bed)
  - [ ] Tea cup (on kitchen counter) - use small cylinder
  - [ ] Phone (on desk)
  - [ ] Bookshelf (where USB will be hidden)
  - [ ] Trash can (discarded notes inside)
- [ ] Configure EvidenceItem components for each
- [ ] Set proper evidence IDs matching case design
- [ ] Add Box Colliders to all evidence

**Afternoon Session (2-3 hours):**
- [ ] Place InteractableComputer on desk
- [ ] Set password to mother's birthday format
- [ ] Add InteractableDocument (therapy appointment card)
- [ ] Add InteractableDrawer to desk
- [ ] Put sticky note evidence inside drawer
- [ ] **TEST:** Collect each piece of evidence
- [ ] **TEST:** Check evidence count in CaseManager

**Evening:**
- [ ] Git commit: "Add evidence items to apartment scene"

---

### Wednesday (Day 10) - 4-5 hours

**Morning Session (2-3 hours):**
- [ ] Create simple password puzzle UI (basic Unity UI):
  - [ ] Canvas in scene
  - [ ] Input field for password
  - [ ] Submit button
  - [ ] Error text display
  - [ ] Success text display
- [ ] Connect to InteractableComputer
- [ ] **TEST:** Try wrong password (see error)
- [ ] **TEST:** Try correct password (unlock computer)

**Afternoon Session (2 hours):**
- [ ] Create evidence review panel (simple UI):
  - [ ] List of collected evidence
  - [ ] Show evidence name and description
  - [ ] Toggle on/off with Tab key
- [ ] Connect to CaseManager events
- [ ] **TEST:** Collect evidence, check list updates
- [ ] Polish UI appearance (colors, fonts)

**Evening:**
- [ ] Git commit: "Add password puzzle and evidence UI"

---

### Thursday (Day 11) - 5 hours

**Morning Session (3 hours):**
- [ ] Import Sarah Chen opening Ink script
- [ ] Create simple dialogue UI:
  - [ ] TextMeshPro for dialogue text
  - [ ] Buttons for choices (3-4 buttons)
  - [ ] Character name display
  - [ ] Continue button
- [ ] Create DialogueManager script (basic Ink integration)
- [ ] Test dialogue in a separate test scene first

**Afternoon Session (2 hours):**
- [ ] Create "Your Office" scene (simple version)
- [ ] Add desk, chair, file cabinet
- [ ] Create Sarah Chen NPC (simple capsule for now)
- [ ] Add dialogue trigger on interaction
- [ ] **TEST:** Start dialogue with Sarah
- [ ] **TEST:** Make choices, see branches work
- [ ] **TEST:** Check morality changes

**Evening:**
- [ ] Git commit: "Add basic dialogue system and Sarah scene"

---

### Friday (Day 12) - 4-5 hours

**Morning Session (2-3 hours):**
- [ ] Polish apartment scene:
  - [ ] Better furniture arrangement
  - [ ] Add clutter (books, papers, photos)
  - [ ] Improve lighting atmosphere
  - [ ] Add ambient audio (clock ticking, city sounds)
- [ ] Add navigation between scenes:
  - [ ] Office → Apartment (accept case)
  - [ ] Apartment → Office (review evidence)

**Afternoon Session (2 hours):**
- [ ] Full playthrough test:
  - [ ] Start in office
  - [ ] Talk to Sarah
  - [ ] Accept case
  - [ ] Go to apartment
  - [ ] Collect evidence
  - [ ] Solve password puzzle
  - [ ] Review evidence list
- [ ] Document bugs
- [ ] Fix critical bugs

**Evening:**
- [ ] Git commit: "Week 2 complete - playable prototype"
- [ ] Take video/screenshot of your progress!

---

### Weekend (Days 13-14) - Optional 4-6 hours

**Saturday (3 hours):**
- [ ] Create Marcus Webb interrogation scene (basic)
- [ ] Simple office environment
- [ ] NPC for Webb
- [ ] Import Webb confrontation Ink script
- [ ] Test bribe choice

**Sunday (3 hours):**
- [ ] Add save/load functionality
- [ ] Create simple main menu
- [ ] Add pause menu
- [ ] Test saving game state

**Week 2 Complete!** ✅

---

## 📅 Week 3: Polish & Additional Content

**Goal:** Polish existing content, add more interactables, improve visuals

**Estimated Time:** 20-25 hours

---

### Monday (Day 15) - 5 hours

**Morning Session (3 hours):**
- [ ] Create materials for objects:
  - [ ] Wood texture for desk/bookshelf
  - [ ] Metal texture for file cabinet
  - [ ] Fabric for bed/couch
  - [ ] Evidence materials (yellow highlight)
- [ ] Apply materials to all objects
- [ ] Adjust colors for neo-noir aesthetic

**Afternoon Session (2 hours):**
- [ ] Add more interactables:
  - [ ] InteractableDoor (apartment entrance)
  - [ ] InteractableDoor (bathroom door)
  - [ ] InteractableDrawer (bedroom dresser)
  - [ ] InteractableLightSwitch (wall switch)
- [ ] **TEST:** All interactables work
- [ ] **TEST:** Doors open/close smoothly

**Evening:**
- [ ] Git commit: "Add materials and additional interactables"

---

### Tuesday (Day 16) - 4-5 hours

**Morning Session (2-3 hours):**
- [ ] Import Rebecca Martinez dialogue (if created)
- [ ] Create accounting firm scene (basic version)
- [ ] Add cubicles and office furniture
- [ ] Add Rebecca NPC
- [ ] Connect dialogue

**Afternoon Session (2 hours):**
- [ ] Add more evidence in firm scene:
  - [ ] Sticky note at David's old desk
  - [ ] Break room gossip trigger
  - [ ] Webb's office door (locked)
- [ ] **TEST:** Collect firm evidence
- [ ] **TEST:** Interrogate Rebecca

**Evening:**
- [ ] Git commit: "Add accounting firm scene"

---

### Wednesday (Day 17) - 4 hours

**Morning Session (2 hours):**
- [ ] Add audio:
  - [ ] Footstep sounds for player
  - [ ] Door open/close sounds
  - [ ] Evidence pickup sounds
  - [ ] Ambient background music (calm, tense)
- [ ] Create AudioManager (optional)

**Afternoon Session (2 hours):**
- [ ] Add visual feedback:
  - [ ] Highlight effect for interactables (outline shader)
  - [ ] Interaction prompts appear on screen
  - [ ] Evidence collection animation/effect
- [ ] Polish UI appearance

**Evening:**
- [ ] Git commit: "Add audio and visual feedback"

---

### Thursday (Day 18) - 5 hours

**Morning Session (3 hours):**
- [ ] Implement USB encryption puzzle:
  - [ ] Create puzzle UI (Caesar cipher)
  - [ ] Show encrypted text
  - [ ] Input field for solution
  - [ ] Hint system
- [ ] Connect to evidence found in bookshelf
- [ ] **TEST:** Solve puzzle, unlock files

**Afternoon Session (2 hours):**
- [ ] Create evidence board system:
  - [ ] UI showing all evidence
  - [ ] Connect evidence pieces (visual lines)
  - [ ] Deduction mechanic
- [ ] **TEST:** Connect evidence, reach conclusion

**Evening:**
- [ ] Git commit: "Add puzzles and evidence board"

---

### Friday (Day 19) - 4-5 hours

**Morning Session (2-3 hours):**
- [ ] Full case playthrough:
  - [ ] Play from start to finish
  - [ ] Document ALL bugs
  - [ ] Note pacing issues
  - [ ] Check dialogue flows correctly
- [ ] Prioritize bugs (critical vs. nice-to-have)

**Afternoon Session (2 hours):**
- [ ] Fix critical bugs
- [ ] Improve pacing (if too slow/fast)
- [ ] Balance difficulty (puzzles too hard/easy?)

**Evening:**
- [ ] Git commit: "Bug fixes and polish"
- [ ] Write Week 3 progress report

---

### Weekend (Days 20-21) - Optional 6-8 hours

**Saturday (4 hours):**
- [ ] Create timeline reconstruction puzzle
- [ ] Add Detective Kwan optional scene
- [ ] Add hospital scene (visit mother - optional)
- [ ] Polish all scenes

**Sunday (4 hours):**
- [ ] Playtest with a friend/family member
- [ ] Watch them play (don't help!)
- [ ] Take notes on confusion/difficulty
- [ ] Adjust based on feedback

**Week 3 Complete!** ✅

---

## 📅 Week 4: Finalization & Prototype Demo

**Goal:** Complete Month 1 with a polished, playable prototype

**Estimated Time:** 20-25 hours

---

### Monday (Day 22) - 5 hours

**Morning Session (3 hours):**
- [ ] Implement all three endings:
  - [ ] Justice Served (lawful path)
  - [ ] Bought Silence (corrupt path)
  - [ ] Pragmatic Justice (gray path)
- [ ] Create ending cutscenes/text
- [ ] Connect to bribe choice

**Afternoon Session (2 hours):**
- [ ] Implement memory fragment unlock
- [ ] Create memory fragment UI
- [ ] Show different version based on morality
- [ ] **TEST:** Complete case, see correct ending

**Evening:**
- [ ] Git commit: "Add all case endings and memory fragment"

---

### Tuesday (Day 23) - 4-5 hours

**Morning Session (2-3 hours):**
- [ ] Add case resolution report:
  - [ ] Summary of choices made
  - [ ] Evidence collected count
  - [ ] Morality score display
  - [ ] Relationships affected
- [ ] Create "Case Closed" screen

**Afternoon Session (2 hours):**
- [ ] Add main menu:
  - [ ] New Game
  - [ ] Continue
  - [ ] Load Game
  - [ ] Settings
  - [ ] Quit
- [ ] Add pause menu functionality
- [ ] **TEST:** All menu options work

**Evening:**
- [ ] Git commit: "Add menus and case resolution screen"

---

### Wednesday (Day 24) - 4 hours

**Morning Session (2 hours):**
- [ ] Add settings menu:
  - [ ] Volume controls (Master, Music, SFX)
  - [ ] Graphics quality options
  - [ ] Mouse sensitivity slider
  - [ ] Keybinding display
- [ ] Save settings to PlayerPrefs

**Afternoon Session (2 hours):**
- [ ] Polish pass on all scenes:
  - [ ] Consistent lighting
  - [ ] Consistent materials
  - [ ] Remove debug objects
  - [ ] Clean up hierarchy
- [ ] Optimize performance (if needed)

**Evening:**
- [ ] Git commit: "Add settings and final polish"

---

### Thursday (Day 25) - 5 hours

**Morning Session (3 hours):**
- [ ] Complete playthrough test (full case):
  - [ ] Start to finish
  - [ ] Try all three ending paths
  - [ ] Collect all evidence
  - [ ] Test all dialogue branches
- [ ] Record playtime for each path

**Afternoon Session (2 hours):**
- [ ] Fix any remaining bugs
- [ ] Improve anything that felt awkward
- [ ] Add any missing audio/visual feedback

**Evening:**
- [ ] Git commit: "Final bug fixes for Month 1 prototype"

---

### Friday (Day 26) - 4-5 hours

**Morning Session (2-3 hours):**
- [ ] Create build:
  - [ ] Configure build settings
  - [ ] Create Windows build
  - [ ] Test build runs correctly
  - [ ] Zip for sharing

**Afternoon Session (2 hours):**
- [ ] Record demo video:
  - [ ] 5-10 minute gameplay showcase
  - [ ] Show key features
  - [ ] Show one complete playthrough
- [ ] Take screenshots for portfolio

**Evening:**
- [ ] Write Month 1 completion report
- [ ] Document what worked/didn't work
- [ ] Plan Month 2 based on learnings

---

### Weekend (Days 27-28) - Celebration & Planning

**Saturday (optional):**
- [ ] Share prototype with friends
- [ ] Get feedback
- [ ] Celebrate completing Month 1!

**Sunday:**
- [ ] Review entire Month 1
- [ ] Plan Month 2 detailed tasks
- [ ] Order any assets you need (3D models, sounds)
- [ ] Research any new Unity features you need

**Month 1 Complete!** 🎉

---

## 📊 Month 1 Deliverables Checklist

By the end of Month 1, you should have:

### ✅ Technical
- [ ] Unity project fully set up and configured
- [ ] All required packages installed (URP, Ink, Cinemachine, etc.)
- [ ] All manager systems implemented and tested
- [ ] Player controller working smoothly
- [ ] Interaction system functional
- [ ] Save/load system working

### ✅ Content
- [ ] Test scene (Week 1)
- [ ] David's apartment scene (Week 2-3)
- [ ] Your office scene (Week 2)
- [ ] Accounting firm scene (Week 3)
- [ ] 8-12 evidence items placed and collectible
- [ ] 3-5 interactable objects (doors, drawers, computer, etc.)

### ✅ Gameplay
- [ ] First-person movement and camera
- [ ] Evidence collection system
- [ ] At least 1 puzzle working (computer password)
- [ ] Basic dialogue system with branching
- [ ] Morality system tracking choices
- [ ] Case progression system

### ✅ Narrative
- [ ] Sarah Chen opening dialogue implemented
- [ ] Marcus Webb bribe scene implemented (optional)
- [ ] 1-2 additional NPC dialogues
- [ ] At least 1 complete ending
- [ ] Memory fragment system (optional)

### ✅ UI/UX
- [ ] Evidence list UI
- [ ] Dialogue UI with choices
- [ ] Interaction prompts
- [ ] Pause menu
- [ ] Main menu
- [ ] Settings menu

### ✅ Audio/Visual
- [ ] Basic materials on objects
- [ ] Neo-noir lighting in all scenes
- [ ] Interaction sound effects
- [ ] Background music/ambience
- [ ] Visual feedback for interactables

### ✅ Polish
- [ ] No critical bugs
- [ ] Consistent art style
- [ ] Playable from start to finish (at least one path)
- [ ] Estimated 30-60 minutes of gameplay

---

## 📈 Success Metrics

**You've succeeded in Month 1 if:**

✅ You can play through one complete case (simplified version)
✅ Evidence collection feels satisfying
✅ Dialogue choices matter and branch correctly
✅ At least one puzzle works
✅ Morality system affects outcomes
✅ The game has atmosphere (lighting, audio)
✅ You haven't given up! (Most important!)

---

## 💡 Tips for Success

### Time Management
- **Don't skip weekends entirely** - give yourself breaks!
- **Focus on function over beauty** - polish comes later
- **If stuck for >30 minutes** - Google it or move on
- **Commit to Git daily** - save your progress!

### Learning
- **Watch Unity tutorials** when you're stuck
- **Read documentation** for packages you use
- **Join Unity Discord/forums** for quick help
- **Play detective games** for inspiration

### Motivation
- **Share progress** with friends/online
- **Take screenshots/videos** of milestones
- **Celebrate small wins** - every working feature counts!
- **Remember why you started** - you're building a game!

### What to Cut if Behind Schedule
1. Optional scenes (hospital, firm)
2. Additional interactables (keep 2-3 core ones)
3. Polish and audio
4. Multiple endings (just do one)
5. Extra dialogue branches

**Priority:** Core gameplay loop must work!

---

## 🚨 Common Pitfalls to Avoid

### Week 1
- **Don't spend days customizing Unity** - use defaults and move on
- **Don't watch tutorial hell** - watch one, then DO
- **Don't install random assets** - stick to the plan

### Week 2
- **Don't try to make perfect models** - cubes are fine for now
- **Don't over-design puzzles** - start simple
- **Don't implement features not in the plan** - scope creep kills projects

### Week 3
- **Don't rewrite working code** - polish later
- **Don't chase perfect graphics** - atmosphere > fidelity
- **Don't add new features** - finish existing ones

### Week 4
- **Don't skip testing** - bugs compound
- **Don't forget to commit/backup** - losing work is devastating
- **Don't aim for perfection** - done is better than perfect

---

## 📝 Daily Routine Suggestion

**Morning (2-3 hours):**
1. Review yesterday's work (10 min)
2. Check today's tasks (5 min)
3. Focus session - hardest task first (2+ hours)
4. Git commit

**Afternoon (2 hours):**
1. Break from hard task
2. Do something creative (building, art, audio)
3. Git commit

**Evening (1 hour - optional):**
1. Testing/playing your game
2. Planning next day
3. Learning (tutorials, reading docs)

---

## 🎯 End of Month 1 Goal

**You should be able to say:**

> "I have a playable detective game prototype. You can walk around David's apartment, collect evidence, solve a password puzzle, and make a moral choice that affects the ending. It's rough, but it works, and I built it!"

**That's a HUGE accomplishment!**

---

## What's Next After Month 1?

**Month 2 Preview:**
- Expand to full Case 1 (all scenes)
- Add remaining puzzles
- Implement relationship system
- Create more NPCs and dialogues
- Polish existing content
- Add second case (Chapter 1, Case 2)

**But first:** Finish Month 1! One day at a time.

---

**You've got this! Start with Day 1 and let's build this game together!** 🚀

---

## Quick Reference: Daily Checklist Template

```
Date: ___________
Week: ___ Day: ___

Today's Goals:
1. ________________
2. ________________
3. ________________

Completed:
✓ ________________
✓ ________________

Tomorrow:
→ ________________
→ ________________

Blockers/Questions:
- ________________

Git Commits:
- ________________
```

**Print this or keep it in a notebook!**
