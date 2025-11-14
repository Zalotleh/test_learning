# Technical Specifications
## Detective Game - "Trial by Fire"

**Version:** 1.0
**Last Updated:** 2025-11-14
**Engine:** Unity (Recommended)

---

## Table of Contents

1. [Engine Selection](#engine-selection)
2. [Unity Version & Requirements](#unity-version--requirements)
3. [Core Systems Architecture](#core-systems-architecture)
4. [Essential Unity Packages](#essential-unity-packages)
5. [Dialogue & Narrative System](#dialogue--narrative-system)
6. [Save System](#save-system)
7. [Performance Targets](#performance-targets)
8. [Platform Requirements](#platform-requirements)
9. [Development Tools](#development-tools)

---

## Engine Selection

### ✅ Recommended: Unity

**Version:** Unity 2022.3 LTS (Long Term Support)

### Why Unity?

#### Strengths for This Project:

1. **Narrative Focus**
   - Excellent dialogue system integrations (Yarn Spinner, Ink)
   - Easy to implement complex branching narratives
   - Superior text-heavy UI management
   - Large community for narrative-driven games

2. **Investigation Mechanics**
   - Point-and-click interactions are straightforward
   - Flexible UI/UX for menus, case files, notebooks
   - Fast prototyping for investigation puzzles
   - Rich asset store for detective/noir assets

3. **Development Speed**
   - C# is more accessible than C++ (easier for team growth)
   - Faster iteration cycles for narrative testing
   - Robust debugging tools
   - Excellent documentation

4. **Performance**
   - Handles dialogue-heavy scenes efficiently
   - Lower system requirements for players
   - Better optimization for UI-intensive gameplay
   - Proven performance with similar games

5. **Indie-Friendly**
   - Free for projects under $100k revenue
   - Large asset marketplace
   - Strong community support
   - Proven track record (Firewatch, Outer Wilds, Return of the Obra Dinn)

6. **Visual Style Match**
   - Excellent for stylized/neo-noir aesthetics
   - Strong post-processing capabilities
   - Flexible lighting for mood and atmosphere
   - URP (Universal Render Pipeline) for optimized graphics

### ❌ Why Not Unreal?

While Unreal is excellent, it's overkill for this project:
- Steeper learning curve (C++ or complex Blueprints)
- Built for AAA graphics (unnecessary for narrative focus)
- Slower iteration for dialogue-heavy content
- Higher system requirements for players
- Less mature narrative tooling

**Verdict:** Unity is the optimal choice for this narrative-driven detective game.

---

## Unity Version & Requirements

### Recommended Unity Version

**Unity 2022.3 LTS (Long Term Support)**

**Why LTS?**
- Stable, well-tested version
- Long-term support and bug fixes
- Mature package ecosystem
- Better for commercial projects

### Alternative Versions
- **Unity 2023.2+** (if you need cutting-edge features)
- **Avoid:** Unity 6 beta (too unstable for production)

---

## Core Systems Architecture

### System Overview

```
Game Manager (Singleton)
├── Save System Manager
├── Morality System Manager
├── Dialogue Manager
├── Case Manager
│   ├── Evidence Manager
│   ├── Clue Tracker
│   └── Investigation State
├── Relationship Manager
├── Memory Fragment Manager
├── Scene Transition Manager
└── Audio Manager
```

### 1. Game Manager
**Purpose:** Central coordinator for all major systems

**Responsibilities:**
- Initialize all managers
- Handle scene transitions
- Manage global game state
- Coordinate save/load operations

**Implementation:** Singleton pattern, persistent across scenes

---

### 2. Morality System Manager

**Core Functionality:**
- Track player's moral choices
- Calculate morality score (Lawful ⇆ Corrupt)
- Trigger world state changes based on morality
- Provide morality-based skill unlocks

**Key Components:**
```csharp
public class MoralityManager : MonoBehaviour
{
    public float moralityScore; // -100 (corrupt) to +100 (lawful)
    public MoralAlignment currentAlignment;

    public void RecordChoice(MoralChoice choice);
    public bool IsSkillUnlocked(string skillID);
    public void UpdateWorldState();
}

public enum MoralAlignment
{
    HighlyLawful,
    Lawful,
    Neutral,
    Corrupt,
    HighlyCorrupt
}
```

**Data Storage:**
- Choice history (for debugging/analytics)
- Current morality score
- Unlocked skills
- World state modifications

---

### 3. Dialogue Manager

**Core Functionality:**
- Display dialogue trees
- Handle player choices
- Lock/unlock options based on:
  - Morality level
  - Skills
  - Evidence collected
  - Relationship status

**Recommended Tool:** **Yarn Spinner** or **Ink**

#### Option A: Yarn Spinner
**Pros:**
- Unity-native integration
- Visual editor (Yarn Editor)
- Easy to learn syntax
- Good for branching narratives

**Cons:**
- Less mature than Ink
- Smaller community

#### Option B: Ink (Recommended)
**Pros:**
- Industry standard (80 Days, Heaven's Vault)
- Powerful scripting language
- Excellent conditional logic
- Better for complex narratives
- Free and open-source

**Cons:**
- Steeper learning curve
- Requires Inky editor (separate app)

**Recommendation:** Use **Ink** for its maturity and powerful branching.

---

### 4. Case Manager

**Core Functionality:**
- Track current active case
- Manage case state (objectives, progress)
- Coordinate evidence collection
- Trigger case completion

**Key Components:**
```csharp
public class CaseManager : MonoBehaviour
{
    public Case currentCase;
    public List<Case> completedCases;

    public void StartCase(Case newCase);
    public void CompleteCase(CaseResolution resolution);
    public void AddEvidence(Evidence evidence);
}

public class Case
{
    public string caseID;
    public string caseName;
    public List<Objective> objectives;
    public List<Evidence> collectedEvidence;
    public CaseState state;
}
```

---

### 5. Evidence Manager

**Core Functionality:**
- Store collected evidence
- Tag evidence with metadata
- Enable evidence examination
- Connect evidence to dialogue unlocks

**Data Structure:**
```csharp
public class Evidence
{
    public string evidenceID;
    public string name;
    public string description;
    public Sprite icon;
    public string caseID;
    public List<string> tags; // for connections
    public bool isExamined;
}
```

---

### 6. Relationship Manager

**Core Functionality:**
- Track relationship status with all NPCs
- Modify relationships based on choices
- Unlock/lock dialogue based on relationship
- Affect NPC behavior

**Data Structure:**
```csharp
public class Relationship
{
    public string npcID;
    public float trustLevel; // -100 to +100
    public RelationshipStatus status;
    public List<InteractionHistory> history;
}

public enum RelationshipStatus
{
    Hostile,
    Distrustful,
    Neutral,
    Friendly,
    Allied
}
```

---

### 7. Memory Fragment Manager

**Core Functionality:**
- Unlock memory fragments based on triggers
- Store fragment data
- Handle fragment presentation
- Modify fragments based on morality (distorted memories)

**Implementation:**
```csharp
public class MemoryManager : MonoBehaviour
{
    public List<MemoryFragment> unlockedFragments;

    public void UnlockFragment(string fragmentID);
    public MemoryFragment GetFragment(string fragmentID, MoralAlignment alignment);
}

public class MemoryFragment
{
    public string fragmentID;
    public MemoryType type; // Audio, Letter, Clipping, Journal
    public string content; // Text or audio reference
    public string title;
    public string unlockCondition;
    public bool hasVariations; // Changes with morality?
}
```

---

### 8. Save System Manager

**Core Functionality:**
- Save/load all game state
- Handle autosave
- Manage multiple save slots
- Ensure data persistence

**What to Save:**
- Current case progress
- All completed cases and outcomes
- Morality score and alignment
- All relationships
- Unlocked memory fragments
- Player skills and progression
- World state changes
- Inventory/evidence
- Scene location

**Recommended Implementation:**
- **JSON serialization** for human-readable saves
- **PlayerPrefs** for settings only (not game state)
- **Encrypted saves** (optional, prevents cheating)

**Save Location:**
- PC: `Application.persistentDataPath`
- Console: Platform-specific paths

---

## Essential Unity Packages

### Core Packages (Required)

1. **Yarn Spinner** or **Ink**
   - Purpose: Dialogue system
   - Installation: Unity Package Manager or Asset Store
   - Recommendation: Ink for complex narratives

2. **Cinemachine**
   - Purpose: Camera control for cinematic sequences
   - Installation: Package Manager (Unity official)
   - Use: Investigation camera, cutscenes, dramatic angles

3. **TextMeshPro**
   - Purpose: High-quality text rendering
   - Installation: Package Manager (Unity official)
   - Use: All UI text, dialogue, menus

4. **Universal Render Pipeline (URP)**
   - Purpose: Optimized graphics with post-processing
   - Installation: Package Manager
   - Use: Neo-noir lighting, atmosphere, visual effects

5. **Post Processing Stack**
   - Purpose: Visual effects (bloom, color grading, vignette)
   - Installation: Included with URP
   - Use: Morality-based visual changes, atmosphere

6. **Input System (New)**
   - Purpose: Modern input handling for PC/Console
   - Installation: Package Manager
   - Use: Rebindable controls, multi-platform support

---

### Recommended Packages (Optional but Valuable)

7. **DOTween**
   - Purpose: Smooth animations and UI transitions
   - Installation: Asset Store (Free)
   - Use: Menu animations, evidence pop-ups, transitions

8. **Odin Inspector** (Paid)
   - Purpose: Enhanced Unity editor for designers
   - Cost: ~$55
   - Use: Better inspector layouts, easier data management

9. **A* Pathfinding Project**
   - Purpose: NPC navigation (if NPCs move around)
   - Installation: Asset Store (Free or Pro)
   - Use: NPC movement in investigation scenes

10. **FMOD** or **Wwise** (Advanced Audio)
    - Purpose: Dynamic audio system
    - Cost: Free for indie (revenue limits)
    - Use: Morality-based audio changes, atmospheric sound

---

## Dialogue & Narrative System

### Recommended: Ink Integration

**Why Ink?**
- Used by professional narrative games
- Powerful conditional logic
- Easy integration with Unity
- Free and well-documented

### Ink Setup

1. **Install Ink Unity Integration**
   - Download from GitHub: https://github.com/inkle/ink-unity-integration
   - Or use Unity Package Manager

2. **Basic Ink Syntax Example**

```ink
=== case_interrogation ===
You face the suspect across a cold metal table.

* [Ask about alibi] -> ask_alibi
* [Threaten with evidence] -> threaten
  {morality < 0} // Only available if corrupt
* [Show empathy] -> empathy
  {morality > 20} // Only available if lawful

=== ask_alibi ===
"Where were you on the night of the 15th?"
The suspect hesitates.
-> suspect_response

=== threaten ===
~ morality -= 5 // Decrease morality
You slam the evidence on the table.
"We know you were there. Talk."
-> suspect_breaks
```

3. **Unity C# Integration**

```csharp
using Ink.Runtime;

public class DialogueManager : MonoBehaviour
{
    public TextAsset inkJSON;
    private Story currentStory;

    void Start()
    {
        currentStory = new Story(inkJSON.text);

        // Bind external variables
        currentStory.variablesState["morality"] = MoralityManager.Instance.moralityScore;
    }

    void ContinueStory()
    {
        if (currentStory.canContinue)
        {
            string text = currentStory.Continue();
            DisplayText(text);
        }

        DisplayChoices();
    }

    void DisplayChoices()
    {
        foreach (Choice choice in currentStory.currentChoices)
        {
            // Create UI button for each choice
        }
    }
}
```

---

## Save System

### Save Data Structure

```csharp
[System.Serializable]
public class SaveData
{
    // Meta
    public string saveSlotName;
    public DateTime saveTime;
    public float playtime;

    // Player Progress
    public string currentSceneName;
    public Vector3 playerPosition;
    public string currentCaseID;

    // Morality
    public float moralityScore;
    public List<MoralChoiceRecord> choiceHistory;

    // Cases
    public List<CompletedCase> completedCases;
    public CaseProgress currentCaseProgress;

    // Relationships
    public Dictionary<string, float> npcRelationships;

    // Memory Fragments
    public List<string> unlockedFragmentIDs;

    // Skills
    public List<string> unlockedSkills;
    public Dictionary<string, int> skillLevels;

    // Evidence
    public List<string> collectedEvidenceIDs;

    // World State
    public Dictionary<string, bool> worldFlags;
}
```

### Save/Load Implementation

```csharp
public class SaveManager : MonoBehaviour
{
    private string savePath;

    void Awake()
    {
        savePath = Application.persistentDataPath + "/saves/";
        Directory.CreateDirectory(savePath);
    }

    public void SaveGame(int slotNumber)
    {
        SaveData data = new SaveData();

        // Collect all data from managers
        data.moralityScore = MoralityManager.Instance.moralityScore;
        data.currentCaseID = CaseManager.Instance.currentCase.caseID;
        // ... etc

        string json = JsonUtility.ToJson(data, true);
        string filePath = savePath + $"save_{slotNumber}.json";

        File.WriteAllText(filePath, json);
    }

    public void LoadGame(int slotNumber)
    {
        string filePath = savePath + $"save_{slotNumber}.json";

        if (File.Exists(filePath))
        {
            string json = File.ReadAllText(filePath);
            SaveData data = JsonUtility.FromJson<SaveData>(json);

            // Restore all data to managers
            MoralityManager.Instance.moralityScore = data.moralityScore;
            // ... etc

            SceneManager.LoadScene(data.currentSceneName);
        }
    }
}
```

---

## Performance Targets

### Target Specifications

**Minimum PC Specs:**
- OS: Windows 10 64-bit
- CPU: Intel Core i5-4590 / AMD FX 8350
- RAM: 8 GB
- GPU: NVIDIA GTX 960 / AMD R9 280
- Storage: 15 GB

**Recommended PC Specs:**
- OS: Windows 10/11 64-bit
- CPU: Intel Core i7-7700 / AMD Ryzen 5 2600
- RAM: 16 GB
- GPU: NVIDIA GTX 1660 / AMD RX 580
- Storage: 15 GB SSD

**Console Targets:**
- PlayStation 5
- Xbox Series X|S
- Nintendo Switch (requires optimization)

### Frame Rate Targets

- **PC:** 60 FPS (1080p), 30 FPS (4K)
- **Console:** 60 FPS (PS5/Xbox), 30 FPS (Switch)

**Note:** This is a narrative game, so 30 FPS is acceptable if needed for visual quality.

### Optimization Priorities

1. **Scene Loading:** < 5 seconds per scene
2. **Dialogue Loading:** Instant (no perceptible delay)
3. **Save/Load:** < 3 seconds
4. **UI Responsiveness:** 60 FPS UI regardless of world FPS

---

## Platform Requirements

### PC (Primary Platform)

**Distribution:**
- Steam (primary)
- GOG
- Epic Games Store

**Features to Support:**
- Steam Cloud saves
- Steam Achievements
- Controller support (Xbox, PlayStation, generic)
- Rebindable controls
- Graphics settings menu
- Multiple save slots

---

### Console (Future Consideration)

**Certification Requirements:**
- Each platform has specific technical requirements
- Consider from the start (controller-first UI)
- Plan for performance on lower-end hardware

**Platform-Specific:**
- Xbox: Game Pass compatibility
- PlayStation: Trophy system
- Switch: Portable mode optimization

---

## Development Tools

### Essential Tools

1. **Unity Editor** (2022.3 LTS)
2. **Visual Studio** or **Rider** (C# IDE)
3. **Inky** (Ink dialogue editor)
4. **Git** (version control)
5. **GitHub / GitLab** (repository hosting)

### Recommended Tools

6. **Blender** (3D modeling - free)
7. **Substance Painter** (texturing - paid)
8. **Audacity** (audio editing - free)
9. **DaVinci Resolve** (video editing for trailers - free)
10. **Trello / Notion** (project management)

### Asset Creation

**3D Modeling:**
- Blender (free, industry-standard)
- Maya (expensive, but powerful)

**2D Art:**
- Photoshop (industry-standard)
- Krita (free alternative)
- Procreate (iPad, great for concepts)

**Audio:**
- Audacity (free, basic editing)
- Reaper (affordable DAW)
- FMOD Studio (game audio implementation)

**Voice Recording:**
- Professional studio (for final VO)
- Home recording (for prototyping with:
  - Decent mic (Blue Yeti, Audio-Technica AT2020)
  - Quiet space
  - Audacity for editing

---

## Version Control Setup

### Git Repository Structure

```
/Assets
  /Scripts
    /Managers
    /Dialogue
    /UI
    /Gameplay
  /Scenes
  /Prefabs
  /Art
    /Models
    /Textures
    /Materials
  /Audio
    /Music
    /SFX
    /VO
  /Ink
    /Cases
    /Characters
  /Resources
/Packages
/ProjectSettings
```

### .gitignore for Unity

Use the standard Unity .gitignore:
https://github.com/github/gitignore/blob/main/Unity.gitignore

**Key excludes:**
- `/Library/` (Unity's cache)
- `/Temp/`
- `/Logs/`
- `*.csproj`, `*.sln` (generated files)

---

## Technical Milestones

### Phase 1: Prototype (Months 1-3)
- Unity project setup with URP
- Core scene navigation
- Basic dialogue system (Ink)
- Simple evidence collection
- Prototype case (1 simple investigation)

### Phase 2: Vertical Slice (Months 4-6)
- One complete case with all features
- Morality system functional
- Save/load working
- Polish UI
- Complete gameplay loop

### Phase 3: Production (Months 7-18)
- All 9 cases designed and implemented
- Full narrative implementation
- All endings implemented
- Art and audio production
- Voice recording and integration

### Phase 4: Polish (Months 19-24)
- Extensive playtesting
- Bug fixing
- Performance optimization
- Platform porting (console)
- Localization

---

## Risk Mitigation

### Technical Risks

1. **Dialogue System Complexity**
   - **Risk:** Branching narrative becomes unmanageable
   - **Mitigation:** Use Ink, create reusable patterns, regular testing

2. **Save System Bugs**
   - **Risk:** Save corruption or data loss
   - **Mitigation:** Extensive testing, backup saves, versioned save format

3. **Performance on Lower-End Hardware**
   - **Risk:** Game runs poorly on minimum specs
   - **Mitigation:** Regular performance testing, optimize early

4. **Scope Creep**
   - **Risk:** Feature bloat delays release
   - **Mitigation:** Stick to core pillars, save extras for DLC

---

## Next Steps

1. **Install Unity 2022.3 LTS**
2. **Set up Git repository** with proper .gitignore
3. **Install Ink Unity Integration**
4. **Create project structure** (folders, managers)
5. **Build prototype scene** (simple investigation)
6. **Test dialogue system** with sample Ink script

---

**End of Technical Specifications**

*This document will be updated as technical decisions are made during development.*
