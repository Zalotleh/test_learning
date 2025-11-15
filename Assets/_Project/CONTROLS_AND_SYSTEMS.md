# Game Controls & Systems Quick Reference

## 🎮 Player Controls

### Movement
- **W / A / S / D** - Move forward / left / backward / right
- **Left Shift (hold)** - Sprint
- **Mouse** - Look around
- **ESC** - Unlock mouse cursor / Pause

### Interaction
- **E** - Interact with objects
- **Left Click** - (When cursor unlocked) Lock cursor back to game

---

## 🔧 Core Systems Overview

### GameManager
**Location:** Singleton, persists across scenes
**Purpose:** Central coordinator for all game systems

**Key Methods:**
- `SetPauseState(bool)` - Pause/unpause game
- `TogglePause()` - Toggle pause state
- `QuitGame()` - Exit application

---

### MoralityManager
**Location:** Singleton, persists across scenes
**Purpose:** Track player's moral choices and alignment

**Morality Scale:** -100 (Corrupt) to +100 (Lawful)

**Alignments:**
- **Highly Lawful:** Score >= 50
- **Lawful:** Score >= 20
- **Neutral:** Score between -20 and 20
- **Corrupt:** Score <= -20
- **Highly Corrupt:** Score <= -50

**Key Methods:**
- `RecordChoice(string id, string description, float change)` - Record a moral choice
- `GetCurrentAlignment()` - Get current alignment enum
- `IsSkillUnlocked(string skillID, float required, bool lawful)` - Check skill availability
- `MoralityScore` - Current score (property)

**Debug Methods (Right-click in Inspector):**
- Debug: Add Lawful Choice (+10)
- Debug: Add Corrupt Choice (-10)
- Debug: Reset Morality

---

### CaseManager
**Location:** Singleton, persists across scenes
**Purpose:** Handle case progression and evidence

**Key Methods:**
- `StartCase(Case case)` - Begin a new case
- `CompleteCase(CaseResolution resolution)` - Finish current case
- `CollectEvidence(Evidence evidence)` - Add evidence to case
- `HasEvidence(string evidenceID)` - Check if evidence collected
- `GetEvidenceCount()` - Number of collected evidence

**Properties:**
- `CurrentCase` - Active case (null if none)
- `CompletedCases` - List of finished cases

---

### SaveManager
**Location:** Singleton, persists across scenes
**Purpose:** Save and load game state

**Save Location:** `Application.persistentDataPath/saves/`
- Windows: `C:/Users/[Username]/AppData/LocalLow/[CompanyName]/[ProductName]/saves/`
- Mac: `~/Library/Application Support/[CompanyName]/[ProductName]/saves/`

**Key Methods:**
- `SaveGame(int slot)` - Save to specified slot (0-9)
- `LoadGame(int slot)` - Load from specified slot
- `SaveExists(int slot)` - Check if save file exists
- `DeleteSave(int slot)` - Delete save file

**Debug Methods (Right-click in Inspector):**
- Debug: Save to Slot 0
- Debug: Load from Slot 0

---

## 📦 Data Structures

### Case
```csharp
{
    string caseID;
    string caseName;
    string description;
    CaseState state; // NotStarted, Active, Completed
    List<Evidence> collectedEvidence;
    CaseResolution resolution;
    DateTime startTime;
    DateTime endTime;
}
```

### Evidence
```csharp
{
    string evidenceID;
    string name;
    string description;
    Sprite icon;
    bool isExamined;
}
```

### MoralChoice
```csharp
{
    string choiceID;
    string description;
    float moralityChange;
    DateTime timestamp;
}
```

---

## 🎭 Interactable System

### IInteractable Interface
Any object the player can interact with should implement this:

```csharp
public interface IInteractable
{
    void OnLookAt();           // Called when player looks at object
    void OnLookAway();         // Called when player looks away
    void Interact(GameObject player); // Called when player presses E
    string GetInteractionPrompt(); // Text to display
}
```

### Example: EvidenceItem
Pre-built interactable for collecting evidence.

**Setup:**
1. Add EvidenceItem script to object
2. Fill in Evidence ID, Name, Description
3. Ensure object has Collider component
4. Optionally assign highlight visual effect

---

## 🧪 Debug & Testing

### Test Case Starter
**Purpose:** Automatically start a test case in development scenes

**Usage:**
1. Create empty GameObject: "TestCaseStarter"
2. Add `TestCaseStarter` script
3. Configure case ID and name
4. Play scene - case starts automatically

**This enables:**
- Evidence collection
- Case progression testing
- Feature development without full case setup

---

## 🎨 Scene Structure Best Practices

### Recommended Hierarchy:
```
=== MANAGERS ===
  ├─ GameManager
  ├─ MoralityManager
  ├─ CaseManager
  └─ SaveManager

=== ENVIRONMENT ===
  ├─ Ground
  ├─ Walls
  └─ Props

=== INTERACTABLES ===
  ├─ Evidence_Item1
  ├─ Evidence_Item2
  └─ Door

=== LIGHTING ===
  ├─ Directional Light
  └─ Point Lights

=== PLAYER ===
  └─ Camera

=== DEBUG ===
  └─ TestCaseStarter
```

---

## 📝 Naming Conventions

### Scripts
- **PascalCase:** `GameManager.cs`
- **Interfaces:** `IInteractable.cs`
- **Descriptive:** `PlayerController.cs` not `PC.cs`

### GameObjects in Scene
- **PascalCase:** `DirectionalLight`
- **Prefixed categories:** `=== MANAGERS ===`
- **Descriptive:** `Evidence_BloodyKnife` not `Cube (17)`

### Variables in Code
- **camelCase:** `currentCase`, `moralityScore`
- **Private fields:** `_instance` or `instance`
- **Constants:** `UPPER_SNAKE_CASE`

---

## 🔍 Common Workflows

### Workflow 1: Adding New Evidence
1. Create 3D object or import model
2. Add `EvidenceItem` script
3. Configure evidenceID (unique!), name, description
4. Add Collider if not present
5. Place in scene
6. Test collection

### Workflow 2: Creating Moral Choice
```csharp
// In your dialogue or event code:
MoralityManager.Instance.RecordChoice(
    "CHOICE_ID_001",
    "Accepted bribe from suspect",
    -15f  // Negative = corrupt
);
```

### Workflow 3: Starting a Case
```csharp
Case newCase = new Case
{
    caseID = "CH1_CASE01",
    caseName = "The Missing Person",
    description = "A wealthy businessman has vanished...",
    state = CaseState.Active
};

CaseManager.Instance.StartCase(newCase);
```

### Workflow 4: Checking Player State
```csharp
// Check morality
MoralAlignment alignment = MoralityManager.Instance.GetCurrentAlignment();

if (alignment == MoralAlignment.Corrupt)
{
    // Unlock corrupt dialogue option
}

// Check evidence
if (CaseManager.Instance.HasEvidence("BLOODY_KNIFE"))
{
    // Enable interrogation path
}
```

---

## 🐛 Debug Console Commands

### In Inspector (Right-click on component):

**MoralityManager:**
- Debug: Add Lawful Choice
- Debug: Add Corrupt Choice
- Debug: Reset Morality

**SaveManager:**
- Debug: Save to Slot 0
- Debug: Load from Slot 0

**TestCaseStarter:**
- Debug: Complete Test Case

---

## 📊 Events System

### Subscribe to Events:
```csharp
void OnEnable()
{
    // Morality events
    MoralityManager.Instance.OnMoralityChanged += HandleMoralityChange;

    // Case events
    CaseManager.Instance.OnEvidenceCollected += HandleEvidenceCollected;
    CaseManager.Instance.OnCaseCompleted += HandleCaseComplete;
}

void OnDisable()
{
    // Always unsubscribe!
    MoralityManager.Instance.OnMoralityChanged -= HandleMoralityChange;
    CaseManager.Instance.OnEvidenceCollected -= HandleEvidenceCollected;
    CaseManager.Instance.OnCaseCompleted -= HandleCaseComplete;
}
```

---

## 🎯 Performance Tips

1. **Use Object Pooling** for frequently spawned objects
2. **Disable ShowDebugLogs** in managers for release builds
3. **Use Addressables** for large asset loading (future)
4. **Profile regularly** with Unity Profiler (Window > Analysis > Profiler)

---

## ⚙️ Build Settings

### Development Build
1. File > Build Settings
2. Check "Development Build"
3. Check "Script Debugging"
4. Use for testing and debugging

### Release Build
1. Uncheck "Development Build"
2. Set optimization level
3. Remove debug scripts from scenes

---

**Quick Reference Complete!**

Keep this document handy while developing. Update it as you add new systems and features.
