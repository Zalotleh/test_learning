# Unity Project Setup Guide
## Complete Step-by-Step Instructions

**Time Required:** 30-60 minutes
**Difficulty:** Beginner-friendly

---

## 📋 Prerequisites Checklist

Before starting, ensure you have:

- [ ] **Unity Hub** installed (download from unity.com)
- [ ] **Unity 2022.3 LTS** installed via Unity Hub
- [ ] **Visual Studio** or **Rider** (IDE for C# coding)
- [ ] **Git** installed and configured
- [ ] This repository cloned to your local machine

---

## Part 1: Opening the Project in Unity

### Step 1: Add Project to Unity Hub

1. Open **Unity Hub**
2. Click **Projects** tab (left sidebar)
3. Click **Add** button (top-right)
4. Navigate to your cloned repository folder: `/test_learning`
5. Select the folder and click **Add Project**

**Note:** Unity may not recognize it as a Unity project yet - that's OK!

---

### Step 2: Open Project in Unity

1. In Unity Hub, click on your newly added project
2. Unity will open and start importing assets
3. **First Import Takes Time:** This can take 5-15 minutes as Unity generates the Library folder

**Wait for:** The Unity Editor to fully load and console to show "All compiler errors have to be fixed"

---

## Part 2: Configure Unity Project Settings

### Step 3: Verify URP is Set Up

1. In Unity, go to **Edit > Project Settings**
2. Select **Graphics** (left panel)
3. Check if **Scriptable Render Pipeline Settings** has a URP asset assigned
   - If **NOT assigned**, we'll create one in the next step

#### Creating URP Asset (if needed):

1. In Project window, navigate to `Assets/Settings`
2. **Right-click > Create > Rendering > URP Asset (with Universal Renderer)**
3. Name it: `UniversalRenderPipelineAsset`
4. Go back to **Edit > Project Settings > Graphics**
5. Drag the created URP asset into **Scriptable Render Pipeline Settings**

---

### Step 4: Configure Quality Settings

1. **Edit > Project Settings > Quality**
2. Delete all quality levels except **Medium** and **High**
3. Set default quality for PC to **High**

---

### Step 5: Set Up Input System (New)

1. **Edit > Project Settings > Player**
2. Scroll down to **Other Settings**
3. Find **Active Input Handling**
4. Change to **Both** (or **Input System Package (New)** if you want)
5. Unity will prompt to restart - click **Yes**

**Wait for Unity to restart**

---

## Part 3: Install Required Packages

### Step 6: Open Package Manager

1. **Window > Package Manager**
2. In the top-left dropdown, select **Unity Registry**

---

### Step 7: Install Core Packages

Install these packages one by one:

#### 1. TextMeshPro
- Search for "TextMeshPro"
- Click **Install**
- When prompted "Import TMP Essentials", click **Import**

#### 2. Cinemachine
- Search for "Cinemachine"
- Click **Install**

#### 3. Input System
- Search for "Input System"
- Click **Install** (if not already installed)

#### 4. Universal RP
- Search for "Universal RP"
- Should already be installed, verify it's there

---

### Step 8: Install Ink Unity Integration

1. Download Ink Unity Integration:
   - Go to: https://github.com/inkle/ink-unity-integration/releases
   - Download latest `ink-unity-integration-xxx.unitypackage` file

2. In Unity:
   - **Assets > Import Package > Custom Package**
   - Select the downloaded `.unitypackage` file
   - Click **Import** (import everything)

**Wait for import to complete**

---

## Part 4: Create Your First Test Scene

### Step 9: Create New Scene

1. **File > New Scene**
2. Select **Basic (Built-in)** or **URP** template
3. **File > Save As**
4. Navigate to `Assets/_Project/Scenes/`
5. Name it: `TestScene`
6. Click **Save**

---

### Step 10: Set Up Ground

1. **Right-click in Hierarchy > 3D Object > Plane**
2. Rename to "Ground"
3. In Inspector, set **Transform > Scale** to **(10, 1, 10)**
4. **Right-click on Ground > 3D Object > Cube** (creates child cube)
5. Rename cube to "TestWall"
6. Set **Transform > Position** to **(0, 0.5, 5)**
7. Set **Transform > Scale** to **(5, 1, 0.5)**

---

### Step 11: Create Player

#### 11.1 Create Player GameObject

1. **Right-click in Hierarchy > Create Empty**
2. Rename to "Player"
3. Set **Transform > Position** to **(0, 1, 0)**

#### 11.2 Add Camera to Player

1. **Right-click on Player > Camera**
2. The camera is now a child of Player
3. Set **Camera Transform > Position** to **(0, 0.6, 0)** (eye height)
4. Set **Camera Transform > Rotation** to **(0, 0, 0)**

#### 11.3 Add Player Scripts

1. Select **Player** GameObject in Hierarchy
2. In Inspector, click **Add Component**
3. Search for "PlayerController" and add it
4. Click **Add Component** again
5. Search for "PlayerInteraction" and add it

#### 11.4 Configure Player Scripts

**PlayerController:**
- Most settings are good by default
- **Player Camera:** Drag the Camera child object into this field

**PlayerInteraction:**
- **Player Camera:** Drag the Camera child object into this field
- **Interactable Layer:** Set to "Default" for now (we'll make a layer later)

---

### Step 12: Create a Test Evidence Item

#### 12.1 Create Evidence Object

1. **Right-click in Hierarchy > 3D Object > Cube**
2. Rename to "Evidence_TestItem"
3. Set **Transform > Position** to **(2, 0.5, 3)**
4. Set **Transform > Scale** to **(0.3, 0.3, 0.3)**

#### 12.2 Add Evidence Script

1. Select **Evidence_TestItem**
2. **Add Component > Evidence Item**

#### 12.3 Configure Evidence

Fill in the fields:
- **Evidence ID:** TEST_001
- **Evidence Name:** Mysterious Note
- **Description:** A crumpled piece of paper with strange writing

#### 12.4 Change Color (Visual Feedback)

1. In Inspector, find **Mesh Renderer > Materials**
2. Click the circle next to **Element 0** (Default-Material)
3. Select **Create > Material**
4. Name it "Evidence_Material"
5. Change **Base Map** color to yellow or gold

---

### Step 13: Set Up Manager Objects

#### 13.1 Create Managers Container

1. **Right-click in Hierarchy > Create Empty**
2. Rename to "=== MANAGERS ==="
3. Set **Transform > Position** to **(0, 0, 0)**

#### 13.2 Add Manager Scripts

1. **Right-click on === MANAGERS === > Create Empty**
2. Rename to "GameManager"
3. **Add Component > Game Manager** script

Repeat for:
4. Create "MoralityManager", add **Morality Manager** script
5. Create "CaseManager", add **Case Manager** script
6. Create "SaveManager", add **Save Manager** script

**Your Hierarchy should look like:**
```
=== MANAGERS ===
  ├─ GameManager
  ├─ MoralityManager
  ├─ CaseManager
  └─ SaveManager
Player
  └─ Camera
Ground
  └─ TestWall
Evidence_TestItem
Directional Light
```

---

### Step 14: Create a Test Case

#### 14.1 Create Test Case in CaseManager

1. Select **CaseManager** in Hierarchy
2. In Inspector, expand **Current Case** section
3. This will be set via code or ScriptableObject later

For now, we'll test evidence collection without an active case.

---

### Step 15: Set Up Lighting (Neo-Noir Atmosphere)

#### 15.1 Configure Directional Light

1. Select **Directional Light** in Hierarchy
2. Set **Transform > Rotation** to **(50, -30, 0)** (moody angle)
3. Set **Color** to a slightly blue-ish white (R: 200, G: 210, B: 255)
4. Set **Intensity** to **0.8** (darker, moodier)

#### 15.2 Add Fog (Optional)

1. **Window > Rendering > Lighting**
2. Select **Environment** tab
3. Check **Fog**
4. Set **Fog Color** to dark blue-gray
5. Set **Fog Mode** to **Linear**
6. Start: 10, End: 50

---

## Part 5: Test Your Setup!

### Step 16: Play Test

1. Click **Play** button (top center of Unity Editor)
2. **You should be able to:**
   - ✅ Move with **WASD**
   - ✅ Look around with **Mouse**
   - ✅ Walk up to the yellow cube (evidence)
   - ✅ See console message when close to evidence
   - ✅ Press **E** to collect evidence
   - ✅ See "Evidence collected" in Console

3. Press **ESC** to unlock mouse cursor
4. Click **Play** again to stop

---

### Step 17: Check Console for Errors

1. **Window > General > Console** (if not open)
2. Look for any **red errors**
3. **Common first-time errors:**

**"CharacterController component required"**
- Solution: Player needs CharacterController component
- Fix: Select Player > Add Component > Character Controller

**"No camera assigned"**
- Solution: Camera not assigned in PlayerController
- Fix: Drag Camera child into Player Camera field

**"NullReferenceException in CaseManager"**
- This is OK for now - we haven't started a case yet
- Evidence collection won't work until we create a case system

---

## Part 6: Save and Organize

### Step 18: Create a Scene Prefab

1. In Project window, navigate to `Assets/_Project/Prefabs/`
2. Drag **Player** from Hierarchy to Prefabs folder
3. This creates a reusable Player prefab

---

### Step 19: Save Everything

1. **File > Save** (or Ctrl+S)
2. **File > Save Project**

---

### Step 20: Build Settings (Optional)

1. **File > Build Settings**
2. Click **Add Open Scenes** (adds TestScene)
3. Close the window

---

## Part 7: Next Steps - Create Your First Interactive Scene

### Recommended Next Tasks:

#### Task 1: Make Evidence Collection Work Properly

Right now, evidence collection might not work because there's no active case. Let's fix that:

**Create a simple case starter script:**

```csharp
// File: Assets/_Project/Scripts/Debug/TestCaseStarter.cs
using UnityEngine;

public class TestCaseStarter : MonoBehaviour
{
    private void Start()
    {
        // Create a test case
        Case testCase = new Case
        {
            caseID = "TEST_CASE",
            caseName = "Test Investigation",
            description = "A test case for development",
            state = CaseState.Active
        };

        // Start the case
        if (CaseManager.Instance != null)
        {
            CaseManager.Instance.StartCase(testCase);
            Debug.Log("Test case started!");
        }
    }
}
```

**To use:**
1. Create this script in `Assets/_Project/Scripts/Debug/`
2. Create empty GameObject in scene: "TestCaseStarter"
3. Add TestCaseStarter script to it
4. Play scene - evidence collection should now work!

---

#### Task 2: Create a Simple Dialogue Test

1. Install Inky (Ink editor)
2. Write a simple test dialogue
3. Create a DialogueManager to display it
4. Create an NPC that triggers dialogue

---

#### Task 3: Create More Interactable Objects

Ideas:
- Door that opens when clicked
- Drawer that can be searched
- Computer terminal with information
- Light switch that toggles lights

---

#### Task 4: Build a Small Investigation Scene

Create a small crime scene:
- Body outline (flat texture on ground)
- 3-5 evidence items scattered around
- Police tape boundaries
- Moody lighting

---

## 🐛 Troubleshooting Common Issues

### Issue: "Scripts are not compiling"

**Symptoms:** Red errors in Console, scripts show as "Missing" in Inspector

**Solution:**
1. **Window > General > Console**
2. Read error messages carefully
3. Common causes:
   - Missing using statements
   - Typos in class names
   - Missing semicolons
4. Fix errors one by one from top to bottom

---

### Issue: "Player controller not moving"

**Checklist:**
- [ ] CharacterController component added to Player?
- [ ] PlayerController script attached?
- [ ] Ground has a collider?
- [ ] No errors in Console?

**Fix:**
1. Select Player
2. Add Component > Character Controller
3. Set CharacterController height to 2, radius to 0.5

---

### Issue: "Interaction not working"

**Checklist:**
- [ ] PlayerInteraction script attached?
- [ ] Camera assigned in PlayerInteraction?
- [ ] Evidence object has EvidenceItem script?
- [ ] Evidence object has a Collider component?

**Fix:**
1. Select Evidence object
2. Ensure it has Box Collider (Add Component > Box Collider)
3. Check that it's on the right layer

---

### Issue: "Black screen when playing"

**Solution:**
- Camera might not be set up correctly
- Check Camera is child of Player
- Check Camera is positioned at (0, 0.6, 0) relative to Player
- Check Main Camera tag is set

---

### Issue: "URP not working / Materials are pink"

**Solution:**
1. Edit > Render Pipeline > Universal Render Pipeline > Upgrade Project Materials
2. Wait for upgrade to complete
3. If still pink:
   - Select material
   - Change Shader to "Universal Render Pipeline/Lit"

---

## ✅ Setup Complete Checklist

You're done when you can check all these boxes:

- [ ] Unity 2022.3 LTS project opens without errors
- [ ] All packages installed (TextMeshPro, Cinemachine, Input System, Ink)
- [ ] URP is configured and working
- [ ] TestScene created with player and ground
- [ ] Player can move and look around
- [ ] Evidence item can be collected
- [ ] All manager scripts are in the scene
- [ ] No errors in Console
- [ ] Scene is saved

---

## 🎯 What You've Accomplished!

You now have:

✅ **Working Unity Project** with all core packages
✅ **First-Person Player Controller** with movement and look
✅ **Interaction System** for picking up objects
✅ **Core Manager Systems** (Game, Morality, Case, Save)
✅ **Evidence Collection** system ready to expand
✅ **Test Scene** to prototype in

---

## 📚 What's Next?

**Recommended learning order:**

1. **Week 1:** Get comfortable with Unity basics
   - Learn Unity interface
   - Understand Hierarchy, Inspector, Project windows
   - Practice moving objects, changing properties

2. **Week 2:** Expand the test scene
   - Add more evidence items
   - Create different types of interactables
   - Experiment with lighting and atmosphere

3. **Week 3:** Learn Ink dialogue system
   - Write your first dialogue in Inky
   - Integrate with Unity
   - Create an NPC that talks

4. **Week 4:** Start designing Case 1
   - Use the Case Template (docs/design/cases/CASE_TEMPLATE.md)
   - Write the mystery
   - Plan evidence and locations

---

## 🆘 Need Help?

**Resources:**
- Unity Learn: https://learn.unity.com/
- Unity Manual: https://docs.unity3d.com/Manual/
- Ink Documentation: https://github.com/inkle/ink/blob/master/Documentation/WritingWithInk.md

**Communities:**
- Unity Forums: https://forum.unity.com/
- r/Unity3D: https://reddit.com/r/Unity3D
- r/gamedev: https://reddit.com/r/gamedev

---

**Congratulations on setting up your detective game project! 🎉**

You're now ready to start building your narrative-driven detective adventure. Take it one step at a time, and don't hesitate to experiment!
