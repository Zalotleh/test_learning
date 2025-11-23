# Case 1 Implementation Guide: "The Last Call"
## Complete A-to-Z Unity Setup for Beginners

**Estimated Time:** 20-30 hours (spread over 2-3 weeks)
**Prerequisites:** Completed FIRST_SCENE_WALKTHROUGH.md
**What You'll Build:** A fully playable detective case with investigation, dialogue, puzzles, and moral choices

---

## 📋 Table of Contents

- [Part 1: Project Setup & Overview](#part-1-project-setup--overview)
- [Part 2: David's Apartment Scene](#part-2-davids-apartment-scene)
- [Part 3: Evidence System](#part-3-evidence-system)
- [Part 4: Dialogue System with Ink](#part-4-dialogue-system-with-ink)
- [Part 5: NPC Setup](#part-5-npc-setup)
- [Part 6: Computer Password Puzzle](#part-6-computer-password-puzzle)
- [Part 7: UI Systems](#part-7-ui-systems)
- [Part 8: Moral Choice Implementation](#part-8-moral-choice-implementation)
- [Part 9: Endings](#part-9-endings)
- [Part 10: Testing & Polish](#part-10-testing--polish)

---

## Part 1: Project Setup & Overview

### What We're Building

**"The Last Call"** - Chapter 1, Case 1

**Story:** David Chen, an accountant, is found dead from apparent suicide. His sister Sarah hires you to investigate. You'll discover embezzlement, corporate corruption, and murder - then face a moral choice: accept a $50,000 bribe or pursue justice.

**Key Features:**
- 4 scenes (Your Office, David's Apartment, Accounting Firm, Endings)
- 12+ evidence items to collect
- 3 NPCs with branching dialogue (Sarah, Rebecca, Marcus Webb)
- 1 password puzzle
- Major moral choice (the bribe)
- 3 different endings

---

### Step 1.1: Read the Case Design

**Before coding, understand the story:**

```bash
cd ~/Desktop/GameDev/YourCallVideoGame
gedit docs/design/cases/CH1_CASE01_TheLastCall.md &
```

**Read these sections:**
- Case Summary (understand the mystery)
- Characters (know who's who)
- Evidence List (what players will find)
- Key Dialogues (important conversations)

**Don't memorize it - just get familiar!**

---

### Step 1.2: Create Folder Organization

**In Unity's Project window:**

1. Navigate to `Assets/_Project/Scenes/`
2. Right-click → **Create → Folder**
3. Name it: **Chapter1**

4. Navigate to `Assets/_Project/Art/Materials/`
5. Create folder: **Chapter1**

6. Navigate to `Assets/_Project/Prefabs/`
7. Create folders:
   - **Chapter1**
   - **Chapter1/Evidence**
   - **Chapter1/NPCs**

**Your structure should look like:**
```
Assets/_Project/
├── Scenes/
│   └── Chapter1/
├── Art/
│   └── Materials/
│       └── Chapter1/
├── Prefabs/
│   └── Chapter1/
│       ├── Evidence/
│       └── NPCs/
```

---

### Step 1.3: Set Up Scene Template

**Create base scene for the case:**

1. **File → Save As**
2. Navigate to `Assets/_Project/Scenes/Chapter1/`
3. Name it: **CH1_YourOffice**
4. Click **Save**

**We'll build this scene first (Sarah meeting scene).**

---

## Part 2: David's Apartment Scene

### Overview

David's apartment is where most investigation happens. Players will:
- Explore the crime scene
- Find evidence
- Solve the computer password puzzle
- Piece together what happened

---

### Step 2.1: Create New Scene

**In Unity:**

1. **File → New Scene**
2. Select **Basic (Built-in)** or **3D**
3. **File → Save As**
4. Navigate to: `Assets/_Project/Scenes/Chapter1/`
5. Name it: **CH1_DavidApartment**
6. Click **Save**

---

### Step 2.2: Build the Apartment Layout

**We'll use simple geometric shapes (cubes, planes) to build the apartment.**

#### 2.2.1: Create the Floor

1. **Right-click in Hierarchy → 3D Object → Plane**
2. Rename to: **Floor**
3. **Transform:**
   - Position: X: 0, Y: 0, Z: 0
   - Rotation: X: 0, Y: 0, Z: 0
   - Scale: X: 2, Y: 1, Z: 3

**This creates a rectangular floor approximately 20m x 30m.**

---

#### 2.2.2: Create Walls

**We'll create 4 walls to enclose the apartment.**

**Wall 1 - North:**

1. **Right-click Floor → 3D Object → Cube**
2. Rename to: **Wall_North**
3. **Transform:**
   - Position: X: 0, Y: 1.5, Z: 15
   - Rotation: X: 0, Y: 0, Z: 0
   - Scale: X: 20, Y: 3, Z: 0.2

**Wall 2 - South:**

1. **Duplicate Wall_North** (select it, press Ctrl+D)
2. Rename to: **Wall_South**
3. **Transform:**
   - Position: X: 0, Y: 1.5, Z: -15
   - (Keep rotation and scale same)

**Wall 3 - East:**

1. **Duplicate Wall_North**
2. Rename to: **Wall_East**
3. **Transform:**
   - Position: X: 10, Y: 1.5, Z: 0
   - Rotation: X: 0, Y: 90, Z: 0
   - Scale: X: 30, Y: 3, Z: 0.2

**Wall 4 - West:**

1. **Duplicate Wall_East**
2. Rename to: **Wall_West**
3. **Transform:**
   - Position: X: -10, Y: 1.5, Z: 0
   - (Keep rotation and scale)

---

#### 2.2.3: Create Ceiling

1. **Duplicate Floor**
2. Rename to: **Ceiling**
3. **Transform:**
   - Position: X: 0, Y: 3, Z: 0
   - (Keep scale same as Floor)

---

#### 2.2.4: Organize Hierarchy

**Create containers for organization:**

1. **Right-click in Hierarchy → Create Empty**
2. Rename to: **=== ENVIRONMENT ===**
3. Set Position: X: 0, Y: 0, Z: 0

4. **Drag these objects into === ENVIRONMENT ===:**
   - Floor
   - Ceiling
   - Wall_North
   - Wall_South
   - Wall_East
   - Wall_West

**Your Hierarchy should look like:**
```
=== ENVIRONMENT ===
├── Floor
├── Ceiling
├── Wall_North
├── Wall_South
├── Wall_East
└── Wall_West
```

---

### Step 2.3: Add Furniture (Using Basic Shapes)

We'll create simple furniture using cubes and cylinders.

#### 2.3.1: Create the Desk

1. **Right-click in Hierarchy → 3D Object → Cube**
2. Rename to: **Desk**
3. **Transform:**
   - Position: X: -5, Y: 0.4, Z: 10
   - Scale: X: 2.5, Y: 0.8, Z: 1.2

**This is David's desk where the computer will be.**

---

#### 2.3.2: Create the Bed

1. **Create Cube**
2. Rename to: **Bed**
3. **Transform:**
   - Position: X: 6, Y: 0.3, Z: 10
   - Scale: X: 2, Y: 0.6, Z: 3

---

#### 2.3.3: Create Bookshelf

1. **Create Cube**
2. Rename to: **Bookshelf**
3. **Transform:**
   - Position: X: -8, Y: 1, Z: 5
   - Scale: X: 0.4, Y: 2, Z: 2

**This is where the USB drive will be hidden.**

---

#### 2.3.4: Create Kitchen Counter

1. **Create Cube**
2. Rename to: **KitchenCounter**
3. **Transform:**
   - Position: X: 8, Y: 0.5, Z: -5
   - Scale: X: 3, Y: 1, Z: 1.5

---

#### 2.3.5: Create Small Table (for tea cup)

1. **Create Cube**
2. Rename to: **SideTable**
3. **Transform:**
   - Position: X: 7, Y: 0.3, Z: 8
   - Scale: X: 0.8, Y: 0.6, Z: 0.8

---

#### 2.3.6: Organize Furniture

1. **Create Empty GameObject**
2. Rename to: **=== FURNITURE ===**
3. **Drag all furniture into it:**
   - Desk
   - Bed
   - Bookshelf
   - KitchenCounter
   - SideTable

---

### Step 2.4: Add the Player

**Copy the Player from your TestScene:**

**Option A: Copy from TestScene**

1. **File → Open Scene**
2. Open your **TestScene**
3. **Select Player** in Hierarchy
4. **Edit → Copy** (or Ctrl+C)
5. **File → Open Scene → CH1_DavidApartment**
6. **Edit → Paste** (or Ctrl+V)

**Option B: Create Fresh Player**

1. **Create Empty GameObject**
2. Rename to: **Player**
3. Add **CharacterController** component
4. Add **PlayerController** script
5. Add **PlayerInteraction** script
6. **Create Camera as child** (Position: 0, 0.6, 0)
7. **Configure components** (same as TestScene walkthrough)

**Position Player at apartment entrance:**
- Position: X: 0, Y: 1, Z: -12

---

### Step 2.5: Add Managers

**Same as TestScene:**

1. **Create Empty → "=== MANAGERS ==="**
2. Add child GameObjects with scripts:
   - GameManager
   - MoralityManager
   - CaseManager
   - SaveManager
   - TestCaseStarter

---

### Step 2.6: Add Lighting

#### 2.6.1: Configure Directional Light

1. **Select Directional Light** in Hierarchy
2. **Transform → Rotation:**
   - X: 50, Y: -30, Z: 0
3. **Light component:**
   - Color: Slight blue tint (R: 210, G: 220, B: 255)
   - Intensity: 0.5 (darker for crime scene mood)

#### 2.6.2: Add Point Light (Desk Lamp)

1. **Right-click → Light → Point Light**
2. Rename to: **DeskLamp**
3. **Transform:**
   - Position: X: -5, Y: 1.5, Z: 10 (above desk)
4. **Light component:**
   - Color: Warm yellow
   - Range: 6
   - Intensity: 1.5

#### 2.6.3: Add Ceiling Light

1. **Create Point Light**
2. Rename to: **CeilingLight**
3. **Transform:**
   - Position: X: 0, Y: 2.8, Z: 0
4. **Light component:**
   - Color: White
   - Range: 15
   - Intensity: 1

---

### Step 2.7: Materials and Colors

**Let's add some color to distinguish objects.**

#### Create Materials:

1. **Navigate to:** `Assets/_Project/Art/Materials/Chapter1/`
2. **Right-click → Create → Material**
3. Name it: **Mat_Floor**
4. **In Inspector:**
   - Base Map color: Dark gray (R: 100, G: 100, B: 100)

**Repeat to create:**
- **Mat_Wall** (Light gray: R: 200, G: 200, B: 200)
- **Mat_Furniture** (Brown: R: 139, G: 90, B: 60)
- **Mat_Evidence** (Yellow: R: 255, G: 255, B: 100)

#### Apply Materials:

**Select objects and drag materials onto them:**
- **Floor** → Mat_Floor
- **All Walls** → Mat_Wall
- **All Furniture** → Mat_Furniture

---

### Step 2.8: Test the Scene

**Press Play and test:**

1. ✅ Can you move around with WASD?
2. ✅ Can you look around with mouse?
3. ✅ Do the walls block movement?
4. ✅ Is the lighting moody and atmospheric?

**If everything works - great! Save the scene (Ctrl+S).**

---

## Part 3: Evidence System

Now we'll add evidence items that players can collect.

### Step 3.1: Create Evidence Container

**In Hierarchy:**

1. **Create Empty GameObject**
2. Rename to: **=== EVIDENCE ===**
3. Position: X: 0, Y: 0, Z: 0

---

### Step 3.2: Create First Evidence - Empty Pill Bottles

**According to the case design, empty pill bottles are found near the bed.**

1. **Right-click → 3D Object → Cylinder**
2. Rename to: **Evidence_PillBottles**
3. **Transform:**
   - Position: X: 7, Y: 0.7, Z: 11 (on the bed area)
   - Scale: X: 0.1, Y: 0.2, Z: 0.1

4. **Add Component → Evidence Item**

5. **Configure EvidenceItem component:**
   - Evidence ID: **CH1C1_EV01**
   - Evidence Name: **Empty Pill Bottles**
   - Evidence Description: **Multiple prescription bottles, all empty, found near body**
   - Icon: Leave empty for now

6. **Ensure it has Box Collider** (should auto-add)

7. **Apply material:**
   - Drag **Mat_Evidence** onto it (makes it yellow)

---

### Step 3.3: Create More Evidence Items

**Follow the same process for each evidence item from the case design:**

#### Evidence 2: Tea Cup

1. **Create Cylinder**
2. Rename to: **Evidence_TeaCup**
3. **Transform:**
   - Position: X: 8, Y: 1.1, Z: -5 (on kitchen counter)
   - Scale: X: 0.15, Y: 0.1, Z: 0.15
4. **Add EvidenceItem component:**
   - ID: **CH1C1_EV02**
   - Name: **Washed Tea Cup**
   - Description: **Recently washed cup - unusual for David's habits**
5. **Add Box Collider**
6. **Apply Mat_Evidence**

#### Evidence 3: Phone

1. **Create Cube**
2. Rename to: **Evidence_Phone**
3. **Transform:**
   - Position: X: -5.5, Y: 0.85, Z: 10 (on desk)
   - Scale: X: 0.1, Y: 0.02, Z: 0.15
4. **Configure:**
   - ID: **CH1C1_EV04**
   - Name: **David's Phone**
   - Description: **Last call made to Sarah, never connected**

#### Evidence 4: Sticky Note

1. **Create Cube** (very thin)
2. Rename to: **Evidence_StickyNote**
3. **Transform:**
   - Position: X: -5.2, Y: 0.85, Z: 9.8 (on desk)
   - Scale: X: 0.08, Y: 0.001, Z: 0.08
4. **Configure:**
   - ID: **CH1C1_EV07**
   - Name: **Sticky Note**
   - Description: **Partial account numbers and date**

---

### Step 3.4: Hide USB Drive in Bookshelf

**The USB drive is hidden and requires investigation to find.**

**We'll make this a special interactable that reveals evidence when examined.**

1. **Create Cube**
2. Rename to: **Evidence_USBDrive**
3. **Transform:**
   - Position: X: -8, Y: 1.5, Z: 5 (inside/behind bookshelf)
   - Scale: X: 0.02, Y: 0.01, Z: 0.05
4. **Configure:**
   - ID: **CH1C1_EV04**
   - Name: **Hidden USB Drive**
   - Description: **Encrypted drive hidden behind books**
5. **In Inspector, uncheck the box next to the object name**
   - This **disables** the object initially
   - Player must examine bookshelf to reveal it

---

### Step 3.5: Make Bookshelf Interactable

**When player examines bookshelf, reveal the USB drive.**

**Create a simple script:**

1. **Navigate to:** `Assets/_Project/Scripts/Gameplay/Investigation/`
2. **Right-click → Create → C# Script**
3. Name it: **ExaminableObject**

4. **Double-click to open in code editor**

5. **Replace ALL content with:**

```csharp
using UnityEngine;

public class ExaminableObject : MonoBehaviour, IInteractable
{
    [Header("Examination Settings")]
    [SerializeField] private string objectName = "Object";
    [SerializeField] private string examinationText = "Nothing unusual.";
    [SerializeField] private GameObject[] objectsToReveal;
    [SerializeField] private bool hasBeenExamined = false;

    public void OnLookAt()
    {
        // Visual feedback when looking at object
    }

    public void OnLookAway()
    {
        // Remove highlight
    }

    public void Interact(GameObject player)
    {
        Examine();
    }

    public string GetInteractionPrompt()
    {
        return hasBeenExamined ? $"Re-examine {objectName}" : $"Examine {objectName}";
    }

    private void Examine()
    {
        Debug.Log($"[Examinable] {examinationText}");

        if (!hasBeenExamined)
        {
            // Reveal hidden objects
            foreach (GameObject obj in objectsToReveal)
            {
                if (obj != null)
                {
                    obj.SetActive(true);
                    Debug.Log($"[Examinable] Revealed: {obj.name}");
                }
            }

            hasBeenExamined = true;
        }
    }
}
```

6. **Save and close**

---

### Step 3.6: Configure Bookshelf

1. **Select Bookshelf** in Hierarchy
2. **Add Component → Examinable Object**
3. **Configure:**
   - Object Name: **Bookshelf**
   - Examination Text: **You notice books slightly out of place. Behind them, a USB drive!**
   - Objects To Reveal: **Set size to 1**
     - Element 0: Drag **Evidence_USBDrive** from Hierarchy

4. **Ensure Bookshelf has Box Collider**

**Now when player presses E on bookshelf, the USB drive appears!**

---

### Step 3.7: Organize Evidence in Hierarchy

**Drag all evidence into === EVIDENCE === container:**

- Evidence_PillBottles
- Evidence_TeaCup
- Evidence_Phone
- Evidence_StickyNote
- Evidence_USBDrive

---

### Step 3.8: Test Evidence Collection

**Press Play and test:**

1. Walk around apartment
2. Look at yellow evidence items
3. Press **E** to collect them
4. Check **Console** - should say "Evidence collected: [name]"
5. Examine **Bookshelf** - USB drive should appear

**Working? Great! Save the scene.**

---

## Part 4: Dialogue System with Ink

Now we'll set up the dialogue system so NPCs can talk to the player.

### Step 4.1: Verify Ink is Installed

**Check if Ink Unity Integration is installed:**

1. **In Unity, go to:** `Assets/`
2. Look for **"Ink"** folder (might be in Assets root or Assets/Plugins/)

**If you DON'T see it:**

Follow the Ink installation from UNITY_SETUP_GUIDE.md:
- Download Ink Unity Integration from GitHub
- Import the .unitypackage
- Restart Unity

---

### Step 4.2: Import Your Ink Dialogue Files

**The dialogue scripts are already in your repository:**

```
Assets/_Project/Ink/Cases/
├── CH1_CASE01_SarahChen_Opening.ink
├── CH1_CASE01_MarcusWebb_Confrontation.ink
└── CH1_CASE01_Rebecca_Interrogation.ink
```

**Unity should auto-compile these to .json files.**

**Check:**

1. Navigate to: `Assets/_Project/Ink/Cases/`
2. You should see **both** .ink and .json files for each dialogue

**If you only see .ink files (no .json):**
- Right-click on the .ink file
- Select **"Recompile Ink"**
- Wait for .json to generate

---

### Step 4.3: Create Dialogue Manager Script

**This script will display dialogue and handle choices.**

1. **Navigate to:** `Assets/_Project/Scripts/Dialogue/`
   - If folder doesn't exist, create it

2. **Right-click → Create → C# Script**
3. Name it: **DialogueManager**

4. **Double-click to open, paste this code:**

```csharp
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;
using System.Collections.Generic;

public class DialogueManager : MonoBehaviour
{
    [Header("Ink JSON")]
    [SerializeField] private TextAsset inkJSON;

    [Header("UI References")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private TextMeshProUGUI characterNameText;
    [SerializeField] private GameObject choicesContainer;
    [SerializeField] private Button choiceButtonPrefab;

    private Story currentStory;
    private List<Button> choiceButtons = new List<Button>();

    public bool IsDialoguePlaying { get; private set; }

    private void Start()
    {
        IsDialoguePlaying = false;
        dialoguePanel.SetActive(false);
    }

    public void StartDialogue(TextAsset inkFile, string characterName = "")
    {
        currentStory = new Story(inkFile.text);

        // Set external variables if needed
        if (MoralityManager.Instance != null)
        {
            currentStory.variablesState["morality"] = (int)MoralityManager.Instance.MoralityScore;
        }

        characterNameText.text = characterName;
        IsDialoguePlaying = true;
        dialoguePanel.SetActive(true);

        ContinueStory();
    }

    private void ContinueStory()
    {
        if (currentStory.canContinue)
        {
            string text = currentStory.Continue();
            dialogueText.text = text.Trim();

            DisplayChoices();
        }
        else
        {
            EndDialogue();
        }
    }

    private void DisplayChoices()
    {
        // Clear old choices
        foreach (Button button in choiceButtons)
        {
            Destroy(button.gameObject);
        }
        choiceButtons.Clear();

        // Create new choice buttons
        foreach (Choice choice in currentStory.currentChoices)
        {
            Button button = Instantiate(choiceButtonPrefab, choicesContainer.transform);
            TextMeshProUGUI buttonText = button.GetComponentInChildren<TextMeshProUGUI>();
            buttonText.text = choice.text;

            int choiceIndex = choice.index;
            button.onClick.AddListener(() => MakeChoice(choiceIndex));

            choiceButtons.Add(button);
        }

        // If no choices, show Continue button
        if (currentStory.currentChoices.Count == 0 && currentStory.canContinue)
        {
            Button continueButton = Instantiate(choiceButtonPrefab, choicesContainer.transform);
            TextMeshProUGUI buttonText = continueButton.GetComponentInChildren<TextMeshProUGUI>();
            buttonText.text = "Continue";
            continueButton.onClick.AddListener(() => ContinueStory());
            choiceButtons.Add(continueButton);
        }
    }

    private void MakeChoice(int choiceIndex)
    {
        currentStory.ChooseChoiceIndex(choiceIndex);

        // Update morality if changed
        if (currentStory.variablesState.Contains("morality") && MoralityManager.Instance != null)
        {
            float newMorality = (float)(int)currentStory.variablesState["morality"];
            float oldMorality = MoralityManager.Instance.MoralityScore;
            float change = newMorality - oldMorality;

            if (change != 0)
            {
                MoralityManager.Instance.RecordChoice("DIALOGUE", "Dialogue choice", change);
            }
        }

        ContinueStory();
    }

    private void EndDialogue()
    {
        IsDialoguePlaying = false;
        dialoguePanel.SetActive(false);

        // Unlock cursor
        if (FindObjectOfType<PlayerController>() != null)
        {
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
        }
    }
}
```

5. **Save and close**

---

### Step 4.4: Create Dialogue UI

**Now we need to create the UI that displays dialogue.**

**This is the longest part but follow carefully!**

---

#### 4.4.1: Create Canvas

1. **Right-click in Hierarchy → UI → Canvas**
2. Rename to: **DialogueCanvas**
3. **Canvas component settings:**
   - Render Mode: **Screen Space - Overlay**
   - (Leave other settings default)

---

#### 4.4.2: Create Dialogue Panel

1. **Right-click DialogueCanvas → UI → Panel**
2. Rename to: **DialoguePanel**
3. **Rect Transform:**
   - Anchor: Bottom (click the anchor box, hold Alt+Shift, click bottom-center preset)
   - Pos X: 0, Pos Y: 100
   - Width: 1200, Height: 300

4. **Image component:**
   - Color: Semi-transparent black (R: 0, G: 0, B: 0, A: 200)

---

#### 4.4.3: Create Character Name Text

1. **Right-click DialoguePanel → UI → Text - TextMeshPro**
   - (If prompted about TMP Essentials, click Import)
2. Rename to: **CharacterNameText**
3. **Rect Transform:**
   - Anchor: Top-Left
   - Pos X: 20, Pos Y: -20
   - Width: 300, Height: 40

4. **TextMeshPro component:**
   - Text: "Character Name"
   - Font Size: 24
   - Color: Yellow
   - Alignment: Left, Top

---

#### 4.4.4: Create Dialogue Text

1. **Right-click DialoguePanel → UI → Text - TextMeshPro**
2. Rename to: **DialogueText**
3. **Rect Transform:**
   - Anchor: Stretch (Alt+Shift, click bottom-right preset)
   - Left: 20, Right: 20, Top: 70, Bottom: 100

4. **TextMeshPro component:**
   - Text: "Dialogue text will appear here..."
   - Font Size: 20
   - Color: White
   - Alignment: Left, Top
   - Enable: **Wrapping**

---

#### 4.4.5: Create Choices Container

1. **Right-click DialoguePanel → UI → Vertical Layout Group**
2. Rename to: **ChoicesContainer**
3. **Rect Transform:**
   - Anchor: Bottom-Stretch
   - Left: 20, Right: 20, Bottom: 10
   - Height: 80

4. **Vertical Layout Group component:**
   - Child Alignment: Lower Center
   - Spacing: 10
   - Check: Child Force Expand Width
   - Check: Child Force Expand Height

---

#### 4.4.6: Create Choice Button Prefab

1. **Right-click ChoicesContainer → UI → Button - TextMeshPro**
2. Rename to: **ChoiceButton**
3. **Rect Transform:**
   - Width: 1100, Height: 60

4. **Button component:**
   - Leave settings default

5. **Select the child "Text (TMP)":**
   - Font Size: 18
   - Alignment: Center
   - Text: "[Choice text]"

6. **Drag ChoiceButton to Project window** to create prefab:
   - Navigate to `Assets/_Project/Prefabs/Chapter1/`
   - Drag **ChoiceButton** from Hierarchy to this folder
   - You've created a prefab!

7. **Delete ChoiceButton from Hierarchy** (we'll spawn it via script)

---

#### 4.4.7: Disable DialoguePanel Initially

1. **Select DialoguePanel** in Hierarchy
2. **Uncheck the box next to its name** (at top of Inspector)
   - This disables it so it's hidden when game starts

---

### Step 4.5: Configure DialogueManager

1. **Select DialogueCanvas** in Hierarchy
2. **Add Component → Dialogue Manager**

3. **Configure the references:**
   - **Dialogue Panel:** Drag **DialoguePanel** from Hierarchy
   - **Dialogue Text:** Drag **DialogueText** from Hierarchy
   - **Character Name Text:** Drag **CharacterNameText** from Hierarchy
   - **Choices Container:** Drag **ChoicesContainer** from Hierarchy
   - **Choice Button Prefab:** Drag **ChoiceButton** from Project window (the prefab you created)

**Don't assign Ink JSON yet - we'll do that per-NPC.**

---

### Step 4.6: Test Setup

**Make sure there are no errors in Console.**

**If everything compiled - you're ready for NPCs!**

**Save the scene (Ctrl+S).**

---

## Part 5: NPC Setup

Now we'll create Sarah Chen, the client who hires you.

### Step 5.1: Create Your Office Scene

**This is where you'll meet Sarah.**

1. **File → New Scene**
2. Save as: `Assets/_Project/Scenes/Chapter1/CH1_YourOffice`

3. **Build a simple office:**
   - Floor (Plane, scaled 1.5 x 1.5)
   - 4 Walls
   - Desk
   - 2 Chairs (one for player, one for Sarah)
   - Lighting (directional + desk lamp)

**Quick setup (5 minutes):**
- Copy environment from DavidApartment scene
- Scale it down to 15x15 room
- Add desk in center, two chairs opposite each other
- Add warm lighting (office atmosphere)

---

### Step 5.2: Create Sarah NPC

1. **Right-click in Hierarchy → 3D Object → Capsule**
2. Rename to: **NPC_Sarah**
3. **Transform:**
   - Position: X: 0, Y: 1, Z: 3 (across desk from player)
   - Scale: X: 1, Y: 1, Z: 1

4. **Add Component → Box Collider**
   - Check: **Is Trigger**

**This is a placeholder - later you can replace with a 3D model.**

---

### Step 5.3: Create NPC Dialogue Trigger Script

**This script starts dialogue when player interacts with NPC.**

1. **Navigate to:** `Assets/_Project/Scripts/Dialogue/`
2. **Create → C# Script**
3. Name it: **NPCDialogueTrigger**

4. **Paste this code:**

```csharp
using UnityEngine;

public class NPCDialogueTrigger : MonoBehaviour, IInteractable
{
    [Header("NPC Info")]
    [SerializeField] private string npcName = "NPC";

    [Header("Dialogue")]
    [SerializeField] private TextAsset inkDialogue;
    [SerializeField] private bool hasBeenTalkedTo = false;
    [SerializeField] private bool canRepeatDialogue = false;

    private DialogueManager dialogueManager;

    private void Start()
    {
        dialogueManager = FindObjectOfType<DialogueManager>();

        if (dialogueManager == null)
        {
            Debug.LogError($"[NPCDialogueTrigger] No DialogueManager found in scene!");
        }
    }

    public void OnLookAt()
    {
        // Visual feedback - could add highlight here
    }

    public void OnLookAway()
    {
        // Remove highlight
    }

    public void Interact(GameObject player)
    {
        if (hasBeenTalkedTo && !canRepeatDialogue)
        {
            Debug.Log($"[NPC] {npcName} has nothing new to say.");
            return;
        }

        StartDialogue();
    }

    public string GetInteractionPrompt()
    {
        if (hasBeenTalkedTo && canRepeatDialogue)
        {
            return $"Talk to {npcName} again";
        }
        else if (hasBeenTalkedTo)
        {
            return $"{npcName} (already talked)";
        }
        else
        {
            return $"Talk to {npcName}";
        }
    }

    private void StartDialogue()
    {
        if (dialogueManager != null && inkDialogue != null)
        {
            dialogueManager.StartDialogue(inkDialogue, npcName);
            hasBeenTalkedTo = true;

            // Lock player movement during dialogue
            PlayerController player = FindObjectOfType<PlayerController>();
            if (player != null)
            {
                player.enabled = false;
            }

            // Unlock cursor for UI interaction
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
        }
        else
        {
            Debug.LogError($"[NPC] Missing DialogueManager or Ink file!");
        }
    }
}
```

5. **Save and close**

---

### Step 5.4: Configure Sarah

1. **Select NPC_Sarah**
2. **Add Component → NPC Dialogue Trigger**

3. **Configure:**
   - NPC Name: **Sarah Chen**
   - Ink Dialogue: **Drag** `CH1_CASE01_SarahChen_Opening.json` from `Assets/_Project/Ink/Cases/`
   - Can Repeat Dialogue: Unchecked

**Sarah is now ready to talk!**

---

### Step 5.5: Add Player and Managers to Office Scene

**Copy from DavidApartment scene:**

1. Open **CH1_DavidApartment**
2. **Copy:**
   - Player
   - === MANAGERS ===
   - DialogueCanvas

3. **Open CH1_YourOffice**
4. **Paste** these objects

5. **Position Player:**
   - Position: X: 0, Y: 1, Z: 0 (facing Sarah)

---

### Step 5.6: Test Dialogue

**Press Play:**

1. Walk up to Sarah (capsule)
2. Look at her - should see interaction prompt
3. Press **E**
4. Dialogue UI should appear!
5. Read dialogue, make choices
6. See morality change in console

**Is it working? Excellent!**

**If not working, check:**
- Console for errors
- DialogueManager has all references assigned
- Ink .json file exists
- NPCDialogueTrigger has ink file assigned

---

## Part 6: Computer Password Puzzle

Now let's create the password puzzle on David's computer.

### Step 6.1: Open DavidApartment Scene

```
File → Open Scene → CH1_DavidApartment
```

---

### Step 6.2: Create Computer Object

1. **Create Cube**
2. Rename to: **Computer**
3. **Transform:**
   - Position: X: -5, Y: 1.2, Z: 10.2 (on desk)
   - Scale: X: 0.5, Y: 0.4, Z: 0.03 (thin like monitor)

4. **Add Component → Interactable Computer**

5. **Configure:**
   - Is Locked: **Checked**
   - Password: **0824** (mother's birthday - MMDD format)
   - Password Case Sensitive: **Unchecked**
   - Locked Prompt: **Computer (Password Required)**
   - Unlocked Prompt: **Access Computer**

---

### Step 6.3: Create Password Input UI

**We need a UI popup for password entry.**

#### 6.3.1: Create Password Panel

1. **Right-click DialogueCanvas → UI → Panel**
2. Rename to: **PasswordPanel**
3. **Rect Transform:**
   - Anchor: Center
   - Pos X: 0, Pos Y: 0
   - Width: 400, Height: 250

4. **Image:** Semi-transparent dark (R: 20, G: 20, B: 20, A: 240)

---

#### 6.3.2: Create Title Text

1. **Right-click PasswordPanel → UI → Text - TextMeshPro**
2. Rename to: **PasswordTitle**
3. **Rect Transform:**
   - Anchor: Top-Stretch
   - Pos Y: -30
   - Height: 40

4. **TextMeshPro:**
   - Text: "Enter Password"
   - Font Size: 24
   - Alignment: Center
   - Color: White

---

#### 6.3.3: Create Input Field

1. **Right-click PasswordPanel → UI → Input Field - TextMeshPro**
2. Rename to: **PasswordInputField**
3. **Rect Transform:**
   - Anchor: Middle-Stretch
   - Pos Y: 0
   - Height: 50
   - Left: 50, Right: 50

4. **TMP InputField component:**
   - Placeholder: "Enter password..."
   - Character Limit: 20

---

#### 6.3.4: Create Submit Button

1. **Right-click PasswordPanel → UI → Button - TextMeshPro**
2. Rename to: **SubmitButton**
3. **Rect Transform:**
   - Anchor: Bottom
   - Pos Y: 40
   - Width: 200, Height: 50

4. **Child Text:**
   - Text: "Submit"
   - Font Size: 20

---

#### 6.3.5: Create Cancel Button

1. **Duplicate SubmitButton** (Ctrl+D)
2. Rename to: **CancelButton**
3. **Position:**
   - Pos Y: -30

4. **Child Text:**
   - Text: "Cancel"

---

#### 6.3.6: Create Error Text

1. **Right-click PasswordPanel → UI → Text - TextMeshPro**
2. Rename to: **ErrorText**
3. **Rect Transform:**
   - Below input field
   - Height: 30

4. **TextMeshPro:**
   - Text: "" (empty initially)
   - Font Size: 16
   - Color: Red
   - Alignment: Center

---

#### 6.3.7: Disable PasswordPanel

**Select PasswordPanel, uncheck the box next to its name.**

---

### Step 6.4: Create Password UI Controller Script

1. **Navigate to:** `Assets/_Project/Scripts/UI/`
2. **Create → C# Script**
3. Name it: **PasswordUIController**

4. **Paste this:**

```csharp
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PasswordUIController : MonoBehaviour
{
    [Header("UI References")]
    [SerializeField] private GameObject passwordPanel;
    [SerializeField] private TMP_InputField passwordInput;
    [SerializeField] private Button submitButton;
    [SerializeField] private Button cancelButton;
    [SerializeField] private TextMeshProUGUI errorText;

    private InteractableComputer currentComputer;

    private void Start()
    {
        submitButton.onClick.AddListener(OnSubmit);
        cancelButton.onClick.AddListener(OnCancel);
        passwordPanel.SetActive(false);
    }

    public void ShowPasswordPrompt(InteractableComputer computer)
    {
        currentComputer = computer;
        passwordPanel.SetActive(true);
        passwordInput.text = "";
        errorText.text = "";

        passwordInput.Select();
        passwordInput.ActivateInputField();

        // Unlock cursor
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }

    private void OnSubmit()
    {
        if (currentComputer != null)
        {
            bool correct = currentComputer.TryPassword(passwordInput.text);

            if (correct)
            {
                errorText.text = "Access Granted!";
                errorText.color = Color.green;
                Invoke("ClosePanel", 1f);
            }
            else
            {
                errorText.text = "Incorrect Password";
                errorText.color = Color.red;
                passwordInput.text = "";
                passwordInput.Select();
            }
        }
    }

    private void OnCancel()
    {
        ClosePanel();
    }

    private void ClosePanel()
    {
        passwordPanel.SetActive(false);
        currentComputer = null;

        // Re-lock cursor
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }
}
```

5. **Save**

---

### Step 6.5: Configure Password UI

1. **Select DialogueCanvas**
2. **Add Component → Password UI Controller**

3. **Configure:**
   - Password Panel: Drag **PasswordPanel**
   - Password Input: Drag **PasswordInputField**
   - Submit Button: Drag **SubmitButton**
   - Cancel Button: Drag **CancelButton**
   - Error Text: Drag **ErrorText**

---

### Step 6.6: Update InteractableComputer to Use UI

**We need to modify the InteractableComputer script to show our UI.**

**Open:** `Assets/_Project/Scripts/Gameplay/Investigation/InteractableComputer.cs`

**Find the `Interact` method and replace it with:**

```csharp
public void Interact(GameObject player)
{
    if (isLocked)
    {
        // Show password UI
        PasswordUIController passwordUI = FindObjectOfType<PasswordUIController>();
        if (passwordUI != null)
        {
            passwordUI.ShowPasswordPrompt(this);
        }
        else
        {
            Debug.LogError("[Computer] No PasswordUIController found!");
        }
    }
    else
    {
        AccessComputer();
    }
}
```

**Save the file.**

**Wait for Unity to recompile.**

---

### Step 6.7: Test the Password Puzzle

**Press Play:**

1. Walk to the computer (cube on desk)
2. Press **E**
3. Password panel should appear!
4. Try wrong password - see error
5. Try correct password: **0824**
6. See "Access Granted!"
7. Computer unlocks!

**Working? Perfect!**

---

## Part 7: UI Systems - Evidence List & Menus

Now let's create the remaining UI systems players need.

---

### Step 7.1: Create Evidence List UI

**Players need to see what evidence they've collected.**

#### 7.1.1: Create Evidence Panel

1. **Right-click DialogueCanvas → UI → Panel**
2. Rename to: **EvidencePanel**
3. **Rect Transform:**
   - Anchor: Right side (Alt+Shift, click middle-right preset)
   - Pivot: X: 1, Y: 0.5
   - Pos X: 0, Pos Y: 0
   - Width: 400, Height: 600

4. **Image component:**
   - Color: Semi-transparent dark (R: 20, G: 20, B: 30, A: 220)

---

#### 7.1.2: Create Evidence Panel Header

1. **Right-click EvidencePanel → UI → Text - TextMeshPro**
2. Rename to: **EvidencePanelTitle**
3. **Rect Transform:**
   - Anchor: Top-Stretch
   - Pos Y: -30
   - Height: 60
   - Left: 20, Right: 20

4. **TextMeshPro:**
   - Text: "Evidence Collected"
   - Font Size: 28
   - Alignment: Center
   - Color: Yellow

---

#### 7.1.3: Create Evidence Scroll View

1. **Right-click EvidencePanel → UI → Scroll View**
2. Rename to: **EvidenceScrollView**
3. **Rect Transform:**
   - Anchor: Stretch (fill panel)
   - Left: 20, Right: 20, Top: 90, Bottom: 20

4. **Scroll Rect component:**
   - Vertical: **Checked**
   - Horizontal: **Unchecked**

5. **Select child "Viewport → Content":**
   - Add **Vertical Layout Group** component:
     - Spacing: 10
     - Child Force Expand Height: **Unchecked**
     - Padding: Top: 10, Left: 10, Right: 10, Bottom: 10

---

#### 7.1.4: Create Evidence Item Prefab

1. **Right-click Content → UI → Panel**
2. Rename to: **EvidenceItemUI**
3. **Rect Transform:**
   - Width: 340, Height: 100

4. **Image:**
   - Color: Dark gray (R: 60, G: 60, B: 70, A: 255)

**Add evidence name text:**

5. **Right-click EvidenceItemUI → UI → Text - TextMeshPro**
6. Rename to: **EvidenceName**
7. **Rect Transform:**
   - Anchor: Top-Stretch
   - Pos Y: -15
   - Height: 30
   - Left: 10, Right: 10

8. **TextMeshPro:**
   - Text: "Evidence Name"
   - Font Size: 18
   - Alignment: Left, Middle
   - Color: White
   - Font Style: Bold

**Add description text:**

9. **Right-click EvidenceItemUI → UI → Text - TextMeshPro**
10. Rename to: **EvidenceDescription**
11. **Rect Transform:**
    - Anchor: Stretch
    - Top: 45, Bottom: 10
    - Left: 10, Right: 10

12. **TextMeshPro:**
    - Text: "Evidence description goes here..."
    - Font Size: 14
    - Alignment: Left, Top
    - Color: Light gray (R: 200, G: 200, B: 200)
    - Wrapping: Enabled

**Create prefab:**

13. **Drag EvidenceItemUI** from Hierarchy to `Assets/_Project/Prefabs/Chapter1/`
14. **Delete EvidenceItemUI** from Hierarchy (we'll spawn via script)

---

#### 7.1.5: Disable Evidence Panel Initially

**Select EvidencePanel, uncheck the box next to its name.**

---

### Step 7.2: Create Evidence UI Controller Script

1. **Navigate to:** `Assets/_Project/Scripts/UI/`
2. **Create → C# Script**
3. Name it: **EvidenceUIController**

4. **Paste this code:**

```csharp
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections.Generic;

public class EvidenceUIController : MonoBehaviour
{
    [Header("UI References")]
    [SerializeField] private GameObject evidencePanel;
    [SerializeField] private Transform evidenceContent;
    [SerializeField] private GameObject evidenceItemPrefab;
    [SerializeField] private KeyCode toggleKey = KeyCode.Tab;

    private List<GameObject> spawnedItems = new List<GameObject>();
    private bool isPanelOpen = false;

    private void Start()
    {
        evidencePanel.SetActive(false);

        // Subscribe to evidence collection events
        if (CaseManager.Instance != null)
        {
            CaseManager.Instance.OnEvidenceCollected += OnEvidenceCollected;
        }
    }

    private void Update()
    {
        // Toggle evidence panel with Tab key
        if (Input.GetKeyDown(toggleKey))
        {
            TogglePanel();
        }
    }

    private void TogglePanel()
    {
        isPanelOpen = !isPanelOpen;
        evidencePanel.SetActive(isPanelOpen);

        if (isPanelOpen)
        {
            RefreshEvidenceList();

            // Unlock cursor
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
        }
        else
        {
            // Re-lock cursor
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
        }
    }

    private void RefreshEvidenceList()
    {
        // Clear old items
        foreach (GameObject item in spawnedItems)
        {
            Destroy(item);
        }
        spawnedItems.Clear();

        // Get collected evidence from CaseManager
        if (CaseManager.Instance != null && CaseManager.Instance.CurrentCase != null)
        {
            foreach (Evidence evidence in CaseManager.Instance.CurrentCase.CollectedEvidence)
            {
                CreateEvidenceItem(evidence);
            }
        }
    }

    private void CreateEvidenceItem(Evidence evidence)
    {
        GameObject item = Instantiate(evidenceItemPrefab, evidenceContent);

        // Find text components
        TextMeshProUGUI nameText = item.transform.Find("EvidenceName").GetComponent<TextMeshProUGUI>();
        TextMeshProUGUI descText = item.transform.Find("EvidenceDescription").GetComponent<TextMeshProUGUI>();

        if (nameText != null)
        {
            nameText.text = evidence.EvidenceName;
        }

        if (descText != null)
        {
            descText.text = evidence.Description;
        }

        spawnedItems.Add(item);
    }

    private void OnEvidenceCollected(Evidence evidence)
    {
        // If panel is open, refresh immediately
        if (isPanelOpen)
        {
            RefreshEvidenceList();
        }
    }

    private void OnDestroy()
    {
        // Unsubscribe from events
        if (CaseManager.Instance != null)
        {
            CaseManager.Instance.OnEvidenceCollected -= OnEvidenceCollected;
        }
    }
}
```

5. **Save and close**

---

### Step 7.3: Configure Evidence UI Controller

1. **Select DialogueCanvas**
2. **Add Component → Evidence UI Controller**

3. **Configure:**
   - Evidence Panel: Drag **EvidencePanel**
   - Evidence Content: Drag **Content** (child of Scroll View)
   - Evidence Item Prefab: Drag **EvidenceItemUI** prefab from Project window
   - Toggle Key: **Tab**

---

### Step 7.4: Create Pause Menu

**Let players pause the game, access settings, and quit.**

#### 7.4.1: Create Pause Panel

1. **Right-click DialogueCanvas → UI → Panel**
2. Rename to: **PausePanel**
3. **Rect Transform:**
   - Anchor: Stretch (fill screen)
   - Left: 0, Right: 0, Top: 0, Bottom: 0

4. **Image:**
   - Color: Very dark transparent (R: 0, G: 0, B: 0, A: 200)

---

#### 7.4.2: Create Menu Container

1. **Right-click PausePanel → UI → Panel**
2. Rename to: **PauseMenuContainer**
3. **Rect Transform:**
   - Anchor: Center
   - Pos X: 0, Pos Y: 0
   - Width: 500, Height: 600

4. **Image:**
   - Color: Dark (R: 30, G: 30, B: 40, A: 255)

---

#### 7.4.3: Create Pause Title

1. **Right-click PauseMenuContainer → UI → Text - TextMeshPro**
2. Rename to: **PauseTitle**
3. **Rect Transform:**
   - Anchor: Top-Stretch
   - Pos Y: -40
   - Height: 80

4. **TextMeshPro:**
   - Text: "PAUSED"
   - Font Size: 48
   - Alignment: Center
   - Color: White

---

#### 7.4.4: Create Menu Buttons

**Resume Button:**

1. **Right-click PauseMenuContainer → UI → Button - TextMeshPro**
2. Rename to: **ResumeButton**
3. **Rect Transform:**
   - Anchor: Top-Center
   - Pos X: 0, Pos Y: -150
   - Width: 300, Height: 60

4. **Child Text:**
   - Text: "Resume"
   - Font Size: 24

**Evidence Button:**

5. **Duplicate ResumeButton**
6. Rename to: **EvidenceButton**
7. **Pos Y: -240**
8. **Text:** "View Evidence"

**Save Button:**

9. **Duplicate ResumeButton**
10. Rename to: **SaveButton**
11. **Pos Y: -330**
12. **Text:** "Save Game"

**Settings Button:**

13. **Duplicate ResumeButton**
14. Rename to: **SettingsButton**
15. **Pos Y: -420**
16. **Text:** "Settings"

**Quit Button:**

17. **Duplicate ResumeButton**
18. Rename to: **QuitButton**
19. **Pos Y: -510**
20. **Text:** "Quit to Main Menu"

---

#### 7.4.5: Disable Pause Panel

**Select PausePanel, uncheck the box next to its name.**

---

### Step 7.5: Create Pause Menu Controller Script

1. **Navigate to:** `Assets/_Project/Scripts/UI/`
2. **Create → C# Script**
3. Name it: **PauseMenuController**

4. **Paste this code:**

```csharp
using UnityEngine;
using UnityEngine.UI;

public class PauseMenuController : MonoBehaviour
{
    [Header("UI References")]
    [SerializeField] private GameObject pausePanel;
    [SerializeField] private Button resumeButton;
    [SerializeField] private Button evidenceButton;
    [SerializeField] private Button saveButton;
    [SerializeField] private Button settingsButton;
    [SerializeField] private Button quitButton;

    [Header("Settings")]
    [SerializeField] private KeyCode pauseKey = KeyCode.Escape;

    private bool isPaused = false;
    private EvidenceUIController evidenceUI;

    private void Start()
    {
        pausePanel.SetActive(false);

        // Hook up buttons
        resumeButton.onClick.AddListener(ResumeGame);
        evidenceButton.onClick.AddListener(OpenEvidence);
        saveButton.onClick.AddListener(SaveGame);
        settingsButton.onClick.AddListener(OpenSettings);
        quitButton.onClick.AddListener(QuitToMenu);

        evidenceUI = GetComponent<EvidenceUIController>();
    }

    private void Update()
    {
        // Toggle pause with Escape key
        if (Input.GetKeyDown(pauseKey))
        {
            if (isPaused)
            {
                ResumeGame();
            }
            else
            {
                PauseGame();
            }
        }
    }

    public void PauseGame()
    {
        isPaused = true;
        pausePanel.SetActive(true);
        Time.timeScale = 0f; // Freeze game time

        // Unlock cursor
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        // Disable player controls
        PlayerController player = FindObjectOfType<PlayerController>();
        if (player != null)
        {
            player.enabled = false;
        }
    }

    public void ResumeGame()
    {
        isPaused = false;
        pausePanel.SetActive(false);
        Time.timeScale = 1f; // Resume game time

        // Re-lock cursor
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;

        // Enable player controls
        PlayerController player = FindObjectOfType<PlayerController>();
        if (player != null)
        {
            player.enabled = true;
        }
    }

    private void OpenEvidence()
    {
        // Close pause menu
        pausePanel.SetActive(false);

        // Open evidence panel
        if (evidenceUI != null)
        {
            // Evidence UI will handle its own display
            SendMessage("TogglePanel", SendMessageOptions.DontRequireReceiver);
        }
    }

    private void SaveGame()
    {
        if (SaveManager.Instance != null)
        {
            SaveManager.Instance.SaveGame(0);
            Debug.Log("[Pause] Game saved!");
        }
    }

    private void OpenSettings()
    {
        Debug.Log("[Pause] Settings not yet implemented");
        // TODO: Create settings panel
    }

    private void QuitToMenu()
    {
        Debug.Log("[Pause] Quit to menu");
        ResumeGame(); // Reset time scale
        // TODO: Load main menu scene
        // UnityEngine.SceneManagement.SceneManager.LoadScene("MainMenu");
    }
}
```

5. **Save and close**

---

### Step 7.6: Configure Pause Menu Controller

1. **Select DialogueCanvas**
2. **Add Component → Pause Menu Controller**

3. **Configure:**
   - Pause Panel: Drag **PausePanel**
   - Resume Button: Drag **ResumeButton**
   - Evidence Button: Drag **EvidenceButton**
   - Save Button: Drag **SaveButton**
   - Settings Button: Drag **SettingsButton**
   - Quit Button: Drag **QuitButton**
   - Pause Key: **Escape**

---

### Step 7.7: Test UI Systems

**Press Play and test:**

1. **Collect some evidence**
2. Press **Tab** - Evidence panel should open showing collected items
3. Press **Tab** again - Panel closes
4. Press **Escape** - Pause menu opens
5. Click **View Evidence** - Opens evidence list
6. Click **Resume** - Game resumes
7. Press **Escape** again - Game pauses

**All working? Great!**

---

## Part 8: Moral Choice Implementation - The Bribe Scene

Now we'll create the pivotal scene where Marcus Webb offers you $50,000.

### Step 8.1: Create Bribe Scene

1. **File → New Scene**
2. **Save as:** `Assets/_Project/Scenes/Chapter1/CH1_BribeConfrontation`

---

### Step 8.2: Build the Scene

**Quick setup for confrontation location (parking garage or office):**

1. **Create basic environment:**
   - Floor (scaled plane)
   - Walls (optional - can be open parking area)
   - Dim lighting (single spotlight)
   - Marcus NPC position
   - Player starting position

**Simple version:**

1. **Create Plane → Floor** (Scale: 2, 1, 2)
2. **Create Directional Light** (Intensity: 0.3, bluish tint)
3. **Create Point Light** (Position above confrontation area, warm color)

---

### Step 8.3: Create Marcus Webb NPC

1. **Create Capsule**
2. Rename to: **NPC_MarcusWebb**
3. **Position:** X: 0, Y: 1, Z: 5
4. **Add Component → NPC Dialogue Trigger**
5. **Configure:**
   - NPC Name: **Marcus Webb**
   - Ink Dialogue: Drag **CH1_CASE01_MarcusWebb_Confrontation.json**
   - Can Repeat Dialogue: **Unchecked**

---

### Step 8.4: Add Player and Managers

**Copy from previous scenes:**
- Player (Position: 0, 1, 0)
- === MANAGERS ===
- DialogueCanvas (with all UI systems)

---

### Step 8.5: Create Moral Choice UI

**The bribe dialogue needs special UI to show consequences.**

#### 8.5.1: Create Choice Impact Panel

1. **Right-click DialogueCanvas → UI → Panel**
2. Rename to: **ChoiceImpactPanel**
3. **Rect Transform:**
   - Anchor: Top-Center
   - Pos X: 0, Pos Y: -150
   - Width: 600, Height: 200

4. **Image:**
   - Color: Dark red/orange (R: 100, G: 40, B: 20, A: 220)

---

#### 8.5.2: Create Impact Title

1. **Right-click ChoiceImpactPanel → UI → Text - TextMeshPro**
2. Rename to: **ImpactTitle**
3. **Rect Transform:**
   - Top-Stretch
   - Height: 40

4. **TextMeshPro:**
   - Text: "⚠ MAJOR CHOICE ⚠"
   - Font Size: 24
   - Alignment: Center
   - Color: Yellow

---

#### 8.5.3: Create Impact Description

1. **Right-click ChoiceImpactPanel → UI → Text - TextMeshPro**
2. Rename to: **ImpactDescription**
3. **Rect Transform:**
   - Stretch (fill remaining space)
   - Top: 50, Bottom: 10, Left: 20, Right: 20

4. **TextMeshPro:**
   - Text: "This choice will significantly affect your morality and the case outcome."
   - Font Size: 18
   - Alignment: Center, Middle
   - Color: White
   - Wrapping: Enabled

---

#### 8.5.4: Create Morality Impact Display

1. **Right-click ChoiceImpactPanel → UI → Text - TextMeshPro**
2. Rename to: **MoralityImpact**
3. **Rect Transform:**
   - Bottom-Center
   - Pos Y: 20
   - Width: 500, Height: 40

4. **TextMeshPro:**
   - Text: "Morality: +25 (Lawful) / -35 (Corrupt)"
   - Font Size: 16
   - Alignment: Center
   - Color: Light blue

---

#### 8.5.5: Disable Impact Panel

**Select ChoiceImpactPanel, uncheck the box.**

---

### Step 8.6: Create Moral Choice Controller Script

1. **Navigate to:** `Assets/_Project/Scripts/Gameplay/`
2. **Create → C# Script**
3. Name it: **MoralChoiceController**

4. **Paste this code:**

```csharp
using UnityEngine;
using TMPro;

public class MoralChoiceController : MonoBehaviour
{
    [Header("UI References")]
    [SerializeField] private GameObject impactPanel;
    [SerializeField] private TextMeshProUGUI impactTitle;
    [SerializeField] private TextMeshProUGUI impactDescription;
    [SerializeField] private TextMeshProUGUI moralityImpact;

    [Header("Choice Settings")]
    [SerializeField] private bool showMajorChoiceWarning = true;

    private void Start()
    {
        if (impactPanel != null)
        {
            impactPanel.SetActive(false);
        }
    }

    public void ShowMajorChoiceWarning(string description, string moralityText)
    {
        if (!showMajorChoiceWarning) return;

        if (impactPanel != null)
        {
            impactPanel.SetActive(true);

            if (impactDescription != null)
            {
                impactDescription.text = description;
            }

            if (moralityImpact != null)
            {
                moralityImpact.text = moralityText;
            }

            // Auto-hide after 5 seconds
            Invoke("HideWarning", 5f);
        }
    }

    public void HideWarning()
    {
        if (impactPanel != null)
        {
            impactPanel.SetActive(false);
        }
    }

    // Called from Ink dialogue via Unity event
    public void OnBribeChoice(string choice)
    {
        switch (choice)
        {
            case "ACCEPT":
                AcceptBribe();
                break;
            case "REFUSE":
                RefuseBribe();
                break;
            case "NEGOTIATE":
                NegotiateBribe();
                break;
        }
    }

    private void AcceptBribe()
    {
        Debug.Log("[Moral Choice] Accepted bribe - Corrupt path");

        if (MoralityManager.Instance != null)
        {
            MoralityManager.Instance.RecordChoice(
                "BRIBE_ACCEPT",
                "Accepted $50,000 bribe from Marcus Webb",
                -35f
            );
        }

        // Set case resolution
        if (CaseManager.Instance != null && CaseManager.Instance.CurrentCase != null)
        {
            CaseManager.Instance.CurrentCase.Resolution = CaseResolution.CorruptDeal;
        }
    }

    private void RefuseBribe()
    {
        Debug.Log("[Moral Choice] Refused bribe - Lawful path");

        if (MoralityManager.Instance != null)
        {
            MoralityManager.Instance.RecordChoice(
                "BRIBE_REFUSE",
                "Refused bribe and pursued justice",
                +25f
            );
        }

        if (CaseManager.Instance != null && CaseManager.Instance.CurrentCase != null)
        {
            CaseManager.Instance.CurrentCase.Resolution = CaseResolution.JusticeServed;
        }
    }

    private void NegotiateBribe()
    {
        Debug.Log("[Moral Choice] Negotiated - Gray path");

        if (MoralityManager.Instance != null)
        {
            MoralityManager.Instance.RecordChoice(
                "BRIBE_NEGOTIATE",
                "Negotiated compromise with Marcus Webb",
                -10f
            );
        }

        if (CaseManager.Instance != null && CaseManager.Instance.CurrentCase != null)
        {
            CaseManager.Instance.CurrentCase.Resolution = CaseResolution.Compromise;
        }
    }
}
```

5. **Save and close**

---

### Step 8.7: Configure Moral Choice Controller

1. **Select DialogueCanvas**
2. **Add Component → Moral Choice Controller**

3. **Configure:**
   - Impact Panel: Drag **ChoiceImpactPanel**
   - Impact Title: Drag **ImpactTitle**
   - Impact Description: Drag **ImpactDescription**
   - Morality Impact: Drag **MoralityImpact**
   - Show Major Choice Warning: **Checked**

---

### Step 8.8: Test the Bribe Scene

**Press Play:**

1. Walk up to Marcus Webb
2. Press **E** to start dialogue
3. Read through conversation
4. When choice appears - warning panel should show
5. Make your choice
6. Check Console - morality should change
7. Check case resolution is set

**Working? Excellent!**

---

## Part 9: Endings - Three Paths

Now create the three possible endings based on player choices.

### Step 9.1: Create Ending Scene Template

1. **File → New Scene**
2. **Save as:** `Assets/_Project/Scenes/Chapter1/CH1_Ending`

---

### Step 9.2: Build Ending Environment

**Simple setup - focus on UI:**

1. **Create Camera**
2. **Create Directional Light**
3. **Optional: Simple background (desk, office, newspaper)**

---

### Step 9.3: Create Ending UI

#### 9.3.1: Create Ending Canvas

1. **Create UI → Canvas**
2. Rename to: **EndingCanvas**
3. **Render Mode:** Screen Space - Overlay

---

#### 9.3.2: Create Ending Panel

1. **Right-click EndingCanvas → UI → Panel**
2. Rename to: **EndingPanel**
3. **Rect Transform:** Stretch (fill screen)
4. **Image:** Dark background (R: 10, G: 10, B: 15, A: 255)

---

#### 9.3.3: Create Ending Title

1. **Right-click EndingPanel → UI → Text - TextMeshPro**
2. Rename to: **EndingTitle**
3. **Rect Transform:**
   - Top-Center
   - Pos Y: -100
   - Width: 1200, Height: 120

4. **TextMeshPro:**
   - Text: "JUSTICE SERVED"
   - Font Size: 72
   - Alignment: Center
   - Color: Yellow

---

#### 9.3.4: Create Ending Description

1. **Right-click EndingPanel → UI → Text - TextMeshPro**
2. Rename to: **EndingDescription**
3. **Rect Transform:**
   - Center
   - Width: 1000, Height: 400

4. **TextMeshPro:**
   - Text: "Ending description will appear here..."
   - Font Size: 24
   - Alignment: Center, Top
   - Color: White
   - Wrapping: Enabled

---

#### 9.3.5: Create Statistics Panel

1. **Right-click EndingPanel → UI → Panel**
2. Rename to: **StatisticsPanel**
3. **Rect Transform:**
   - Bottom-Center
   - Pos Y: 150
   - Width: 800, Height: 300

4. **Image:**
   - Color: Semi-transparent (R: 30, G: 30, B: 40, A: 200)

---

#### 9.3.6: Create Statistics Text

1. **Right-click StatisticsPanel → UI → Text - TextMeshPro**
2. Rename to: **StatisticsText**
3. **Rect Transform:** Stretch (fill panel)
4. **TextMeshPro:**
   - Text: "Statistics will appear here..."
   - Font Size: 20
   - Alignment: Center, Middle
   - Color: Light gray

---

#### 9.3.7: Create Continue Button

1. **Right-click EndingPanel → UI → Button - TextMeshPro**
2. Rename to: **ContinueButton**
3. **Rect Transform:**
   - Bottom-Center
   - Pos Y: 50
   - Width: 300, Height: 70

4. **Text:** "Continue"

---

### Step 9.4: Create Ending Controller Script

1. **Navigate to:** `Assets/_Project/Scripts/Gameplay/`
2. **Create → C# Script**
3. Name it: **EndingController**

4. **Paste this code:**

```csharp
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class EndingController : MonoBehaviour
{
    [Header("UI References")]
    [SerializeField] private TextMeshProUGUI endingTitle;
    [SerializeField] private TextMeshProUGUI endingDescription;
    [SerializeField] private TextMeshProUGUI statisticsText;
    [SerializeField] private Button continueButton;

    [Header("Ending Configurations")]
    [SerializeField] private EndingConfig lawfulEnding;
    [SerializeField] private EndingConfig corruptEnding;
    [SerializeField] private EndingConfig grayEnding;

    private void Start()
    {
        continueButton.onClick.AddListener(OnContinue);
        DisplayEnding();
    }

    private void DisplayEnding()
    {
        // Determine which ending based on case resolution
        CaseResolution resolution = CaseResolution.Unknown;

        if (CaseManager.Instance != null && CaseManager.Instance.CurrentCase != null)
        {
            resolution = CaseManager.Instance.CurrentCase.Resolution;
        }

        EndingConfig ending = null;

        switch (resolution)
        {
            case CaseResolution.JusticeServed:
                ending = lawfulEnding;
                break;
            case CaseResolution.CorruptDeal:
                ending = corruptEnding;
                break;
            case CaseResolution.Compromise:
                ending = grayEnding;
                break;
            default:
                ending = lawfulEnding; // Default
                break;
        }

        if (ending != null)
        {
            endingTitle.text = ending.title;
            endingDescription.text = ending.description;
            endingTitle.color = ending.titleColor;
        }

        DisplayStatistics();
    }

    private void DisplayStatistics()
    {
        string stats = "=== CASE STATISTICS ===\n\n";

        // Morality score
        if (MoralityManager.Instance != null)
        {
            float morality = MoralityManager.Instance.MoralityScore;
            MoralAlignment alignment = MoralityManager.Instance.GetCurrentAlignment();

            stats += $"Final Morality: {morality:F1}\n";
            stats += $"Alignment: {alignment}\n\n";
        }

        // Evidence collected
        if (CaseManager.Instance != null && CaseManager.Instance.CurrentCase != null)
        {
            int evidenceCount = CaseManager.Instance.CurrentCase.CollectedEvidence.Count;
            stats += $"Evidence Collected: {evidenceCount}\n\n";
        }

        // Choices made
        if (MoralityManager.Instance != null)
        {
            int choicesMade = MoralityManager.Instance.ChoicesMade.Count;
            stats += $"Decisions Made: {choicesMade}\n\n";
        }

        stats += "===================";

        statisticsText.text = stats;
    }

    private void OnContinue()
    {
        Debug.Log("[Ending] Continue clicked");
        // TODO: Load next case or return to menu
    }
}

[System.Serializable]
public class EndingConfig
{
    public string title;
    [TextArea(5, 10)]
    public string description;
    public Color titleColor = Color.yellow;
}
```

5. **Save and close**

---

### Step 9.5: Configure Ending Controller

1. **Create Empty GameObject** in scene
2. Rename to: **EndingManager**
3. **Add Component → Ending Controller**

4. **Configure UI references:**
   - Ending Title: Drag **EndingTitle**
   - Ending Description: Drag **EndingDescription**
   - Statistics Text: Drag **StatisticsText**
   - Continue Button: Drag **ContinueButton**

5. **Configure endings (expand the three sections):**

**Lawful Ending:**
- Title: "JUSTICE SERVED"
- Description: "You refused the bribe and brought Marcus Webb to justice. David Chen's murder is solved, Rebecca Martinez testifies against Webb, and justice prevails. Though the money was tempting, you upheld your principles. Sarah Chen thanks you with tears in her eyes - her brother can finally rest in peace."
- Title Color: Green (R: 50, G: 255, B: 50)

**Corrupt Ending:**
- Title: "BOUGHT SILENCE"
- Description: "You accepted Marcus Webb's $50,000 bribe. The case is closed as suicide, Rebecca walks free, and Sarah Chen never learns the truth about her brother's murder. The money sits heavy in your account. You're $50,000 richer, but at what cost to your soul?"
- Title Color: Red (R: 255, G: 50, B: 50)

**Gray Ending:**
- Title: "PRAGMATIC JUSTICE"
- Description: "You negotiated with Marcus Webb - taking a smaller payment in exchange for evidence that will bring down the corrupt accounting firm but let Webb slip away. It's not perfect justice, but sometimes the world doesn't allow for perfect solutions. Sarah learns the truth, though the killer escapes."
- Title Color: Orange (R: 255, G: 165, B: 0)

---

### Step 9.6: Test the Endings

**To test each ending:**

**Test Lawful Ending:**
1. Play through case
2. Refuse bribe
3. Scene should show "JUSTICE SERVED"

**Test Corrupt Ending:**
1. Play through case
2. Accept bribe
3. Scene should show "BOUGHT SILENCE"

**Test Gray Ending:**
1. Play through case
2. Negotiate with Webb
3. Scene should show "PRAGMATIC JUSTICE"

---

## Part 10: Testing & Polish

Final steps to complete Case 1.

### Step 10.1: Create Scene Flow

**Connect all scenes in sequence:**

1. **Open GameManager.cs**
2. **Add scene loading methods**

Add this to GameManager:

```csharp
using UnityEngine.SceneManagement;

public void LoadScene(string sceneName)
{
    SceneManager.LoadScene(sceneName);
}

public void LoadNextScene()
{
    int currentIndex = SceneManager.GetActiveScene().buildIndex;
    SceneManager.LoadScene(currentIndex + 1);
}
```

3. **Add scenes to Build Settings:**
   - File → Build Settings
   - Click **Add Open Scenes** for each scene:
     - CH1_YourOffice (index 0)
     - CH1_DavidApartment (index 1)
     - CH1_BribeConfrontation (index 2)
     - CH1_Ending (index 3)

---

### Step 10.2: Add Scene Transitions

**Create trigger zones to move between scenes:**

1. **In DavidApartment scene:**
   - Create **Cube** at door
   - Scale: X: 2, Y: 3, Z: 0.5
   - Add **Box Collider** (Is Trigger: checked)
   - Add this script:

```csharp
using UnityEngine;

public class SceneTransitionTrigger : MonoBehaviour
{
    [SerializeField] private string sceneToLoad;
    [SerializeField] private string interactionPrompt = "Leave area";

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            // Show prompt
            Debug.Log($"[Transition] Press E to {interactionPrompt}");
        }
    }

    private void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player") && Input.GetKeyDown(KeyCode.E))
        {
            LoadScene();
        }
    }

    private void LoadScene()
    {
        if (!string.IsNullOrEmpty(sceneToLoad))
        {
            UnityEngine.SceneManagement.SceneManager.LoadScene(sceneToLoad);
        }
    }
}
```

---

### Step 10.3: Complete Playthrough Testing

**Full playthrough checklist:**

1. **Start in YourOffice:**
   - ✅ Talk to Sarah
   - ✅ Dialogue works
   - ✅ Morality changes register

2. **Move to DavidApartment:**
   - ✅ Player can move
   - ✅ Evidence collection works
   - ✅ Examine bookshelf reveals USB
   - ✅ Computer password puzzle works (0824)
   - ✅ Press Tab to view evidence
   - ✅ Press Escape to pause

3. **Move to BribeConfrontation:**
   - ✅ Marcus Webb dialogue starts
   - ✅ Choice warning appears
   - ✅ Make choice
   - ✅ Morality changes
   - ✅ Case resolution set

4. **Move to Ending:**
   - ✅ Correct ending displays
   - ✅ Statistics show correctly
   - ✅ Continue button works

**Run through ALL three paths (lawful, corrupt, gray)!**

---

### Step 10.4: Bug Fixing Checklist

**Common issues to check:**

**UI Issues:**
- ❌ UI doesn't appear → Check panels are enabled and Canvas is set to Screen Space Overlay
- ❌ Buttons don't work → Check EventSystem exists in scene
- ❌ Text overlaps → Adjust Rect Transform anchors and sizes

**Gameplay Issues:**
- ❌ Can't collect evidence → Check Box Collider and EvidenceItem component
- ❌ Dialogue doesn't start → Check .json files exist and are assigned
- ❌ Password puzzle broken → Check PasswordUIController has all references

**Performance Issues:**
- Run Profiler (Window → Analysis → Profiler)
- Check for memory leaks in scripts
- Optimize materials and lighting

---

### Step 10.5: Polish Pass

**Add these finishing touches:**

**Visual Polish:**
- Add particle effects for evidence collection
- Add sound effects (footsteps, door opening, evidence pickup)
- Improve lighting in each scene
- Add background music (low, atmospheric)

**Gameplay Polish:**
- Add tutorial hints for first-time players
- Add objective markers showing where to go
- Add journal system showing case progress
- Add dialogue skip option (hold Space)

**UI Polish:**
- Add fade transitions between scenes
- Add button hover effects
- Add typing effect for dialogue text
- Add morality meter visualization

---

### Step 10.6: Final Build

**Create a playable build:**

1. **File → Build Settings**
2. **Select platform:** PC, Mac & Linux Standalone
3. **Click Build**
4. **Choose output folder:** ~/Desktop/GameDev/YourCallVideoGame/Builds/
5. **Name it:** YourCall_Case1_v1.0
6. **Click Save**

**Test the build on your machine!**

---

### Step 10.7: Commit Everything

**Save your completed work:**

```bash
cd ~/Desktop/GameDev/YourCallVideoGame
git add -A
git commit -m "Complete Case 1 implementation - The Last Call

- Implemented all 4 scenes (Office, Apartment, Bribe, Ending)
- Evidence collection system working
- Dialogue system with Ink integration
- Password puzzle functional
- Three endings based on moral choices
- Complete UI systems (Evidence, Pause Menu, Endings)
- Full playthrough tested"
git push -u origin claude/build-game-foundation-01EghQJpjSafUF8z8FT6J5ce
```

---

## 🎯 What You've Accomplished

**Congratulations!** If you've followed this guide to completion, you now have:

✅ **4 Complete Scenes:**
- Your Office (Sarah meeting)
- David's Apartment (crime scene investigation)
- Bribe Confrontation (moral choice)
- Ending Scene (three branching paths)

✅ **Core Gameplay Systems:**
- First-person player movement and interaction
- Evidence collection system
- Password puzzle mechanics
- Scene transitions

✅ **Dialogue & Story:**
- Ink dialogue integration
- NPC interaction system
- Branching conversations
- Character development

✅ **UI Systems:**
- Dialogue display with choices
- Evidence list (Tab key)
- Pause menu (Escape key)
- Password entry UI
- Moral choice warning system
- Ending statistics display

✅ **Moral System:**
- Morality tracking (-100 to +100)
- Choice recording
- Alignment calculation
- Three distinct endings based on choices

✅ **Complete Narrative:**
- Full murder mystery case
- 3 NPCs (Sarah, Marcus, Rebecca)
- Major moral dilemma
- Satisfying resolution

**You've completed 100% of Case 1 implementation!**

---

## 📊 Case 1: "The Last Call" - Summary

**What you built:**

- **Total Scenes:** 4
- **Playable NPCs:** 3 (Sarah Chen, Marcus Webb, Rebecca Martinez)
- **Evidence Items:** 12+
- **Puzzles:** 1 (computer password)
- **Major Choices:** 1 (the bribe)
- **Endings:** 3 (Lawful, Corrupt, Gray)
- **Estimated Playtime:** 45-60 minutes

**Lines of code written:** ~2,000+
**Implementation time:** 20-30 hours

---

## 🎓 What You've Learned

By completing this guide, you've gained experience with:

**Unity Fundamentals:**
- Scene management
- GameObject hierarchy
- Component-based architecture
- Transform manipulation
- Lighting and materials

**C# Programming:**
- MonoBehaviour lifecycle
- Interfaces (IInteractable)
- Events and delegates
- Singleton pattern
- Serialization

**Game Systems:**
- State management
- Save/load systems
- UI frameworks
- Input handling
- Scene transitions

**Narrative Design:**
- Branching dialogue
- Moral choice systems
- Multiple endings
- Environmental storytelling

---

## 🚀 What's Next?

**Option 1: Polish Case 1**
- Add 3D models (replace capsule NPCs)
- Add sound effects and music
- Improve lighting and atmosphere
- Add particle effects
- Create proper apartment furnishings

**Option 2: Start Case 2**
- Follow the same pattern from this guide
- Create new scenes
- Design new evidence
- Write new dialogue
- Introduce new mechanics

**Option 3: Enhance Systems**
- Add inventory UI with drag-and-drop
- Create journal system with notes
- Add objective markers
- Implement minimap
- Add accessibility options

**Option 4: Add Features**
- Create main menu
- Add settings panel (volume, graphics, controls)
- Implement dialogue skip
- Add subtitle system
- Create tutorial sequence

---

## 🆘 Troubleshooting Guide

### Common Issues and Solutions

**Issue: Dialogue doesn't appear**
- ✅ Check DialogueManager has all UI references assigned
- ✅ Verify .json files exist alongside .ink files
- ✅ Check Console for compilation errors
- ✅ Ensure DialoguePanel is child of Canvas
- ✅ Verify Canvas is set to Screen Space - Overlay

**Issue: Evidence can't be collected**
- ✅ Check object has Box Collider component
- ✅ Verify EvidenceItem component is attached
- ✅ Ensure TestCaseStarter has started a case
- ✅ Check player has PlayerInteraction script
- ✅ Verify interaction range is sufficient

**Issue: Password UI doesn't work**
- ✅ Ensure PasswordPanel is disabled initially
- ✅ Check all UI references in PasswordUIController
- ✅ Verify InteractableComputer has correct script
- ✅ Check TMP InputField is properly configured
- ✅ Ensure buttons have onClick listeners

**Issue: UI doesn't show at all**
- ✅ Check EventSystem exists in scene
- ✅ Verify Canvas Render Mode is correct
- ✅ Ensure UI panels are children of Canvas
- ✅ Check panel RectTransform anchors
- ✅ Verify objects are enabled in Inspector

**Issue: Scene transitions don't work**
- ✅ Add all scenes to Build Settings
- ✅ Verify scene names match exactly
- ✅ Check SceneTransitionTrigger has correct scene name
- ✅ Ensure Player has correct tag ("Player")
- ✅ Check trigger collider settings

**Issue: Morality system not working**
- ✅ Verify MoralityManager exists in scene
- ✅ Check Singleton pattern is correct
- ✅ Ensure choices call RecordChoice()
- ✅ Check morality score range (-100 to +100)
- ✅ Verify alignment calculation

**Issue: Endings don't display correctly**
- ✅ Check case resolution is being set
- ✅ Verify EndingController has all UI references
- ✅ Ensure ending configs are filled out
- ✅ Check CaseManager.CurrentCase exists
- ✅ Verify statistics display code

---

## 💡 Tips for Success

**Development Best Practices:**
- Save scene frequently (Ctrl+S)
- Commit to git after completing each part
- Test after every major change
- Use Console to debug issues
- Comment your code for clarity

**Organization Tips:**
- Keep Hierarchy clean with separators (=== NAME ===)
- Name objects clearly and consistently
- Use folders in Project window
- Group related components together
- Delete unused assets

**Testing Strategy:**
- Test each system individually before integration
- Play through complete case regularly
- Test all three endings
- Check edge cases (what if player skips evidence?)
- Get feedback from others

---

## 📚 Additional Resources

**Unity Documentation:**
- Unity Manual: https://docs.unity3d.com/Manual/
- C# Scripting Reference: https://docs.unity3d.com/ScriptReference/
- UI System Guide: https://docs.unity3d.com/Packages/com.unity.ugui@latest

**Ink Documentation:**
- Official Ink Guide: https://github.com/inkle/ink/blob/master/Documentation/WritingWithInk.md
- Ink Unity Integration: https://github.com/inkle/ink-unity-integration

**Game Development:**
- Your project docs in `docs/` folder
- GDD (Game Design Document)
- Technical Specifications
- Case designs

---

## ✅ Final Checklist

Before considering Case 1 complete, verify:

- [ ] All 4 scenes load without errors
- [ ] Player movement works in all scenes
- [ ] All evidence is collectible
- [ ] All dialogue displays correctly
- [ ] Password puzzle can be solved
- [ ] All three endings are accessible
- [ ] UI systems work (Tab, Escape)
- [ ] Morality tracking works
- [ ] Statistics display at end
- [ ] No console errors during playthrough
- [ ] Game can be built successfully
- [ ] All changes committed to git

---

## 🎉 Congratulations!

**You've successfully implemented your first complete detective case!**

This is a major milestone in your game development journey. You now have:
- A fully playable game prototype
- Experience with Unity fundamentals
- Understanding of narrative game systems
- A foundation to build upon

**Your game has:**
- A compelling murder mystery
- Meaningful player choices
- Multiple endings
- Professional game systems

**Keep going!** You're now ready to:
- Create more cases
- Add polish and refinement
- Expand your game world
- Build toward your full vision

---

## 📝 Save Your Work

**Final commit:**

```bash
cd ~/Desktop/GameDev/YourCallVideoGame
git add -A
git commit -m "Complete Case 1 implementation - The Last Call

- Implemented all 4 scenes (Office, Apartment, Bribe, Ending)
- Evidence collection system fully functional
- Dialogue system with Ink integration working
- Password puzzle implemented and tested
- Three endings based on moral choices
- Complete UI systems (Evidence, Pause Menu, Endings)
- Morality tracking and alignment system
- Full playthrough tested on all paths
- All systems integrated and working

Case 1 is now 100% complete and playable!"

git push -u origin claude/build-game-foundation-01EghQJpjSafUF8z8FT6J5ce
```

---

**Good luck with your game development journey, detective! 🕵️**

**You've got this!**
