# Your First Scene - Complete Walkthrough
## From Opening Unity to Playable Prototype

**Time Required:** 1-2 hours
**Goal:** Create a fully playable test scene with player, evidence, and interactables

---

## Part 1: Opening Unity (First Time)

### Step 1: Launch Unity Hub

1. Open **Unity Hub** application
2. If you don't see your project listed:
   - Click **Add** (top-right corner)
   - Navigate to your repository folder: `/test_learning`
   - Click **Select Folder**

### Step 2: Open the Project

1. In Unity Hub, click on **test_learning** project
2. Unity will start loading...

**⏱️ WAIT TIME: 5-15 minutes (first time only)**

Unity is creating the **Library** folder - this is normal!

**What you'll see:**
- "Opening Project" dialog
- Progress bar showing "Importing packages"
- Console may show some warnings (yellow) - this is OK
- Wait for "All compiler errors have to be fixed" message

### Step 3: Unity Editor Opens

**Your Unity Editor should now show:**
- **Scene view** (center) - 3D viewport
- **Hierarchy** (left) - List of objects in scene
- **Inspector** (right) - Properties of selected object
- **Project** (bottom) - All your files
- **Console** (bottom tab) - Messages and errors

**If you see errors in Console:**
- Red errors = problem, needs fixing
- Yellow warnings = usually OK, can ignore for now

---

## Part 2: Understanding the Unity Interface

### Quick Tour (2 minutes)

**Hierarchy Window (Left)**
- Lists all objects in current scene
- Currently empty or has default objects (Main Camera, Directional Light)

**Scene View (Center)**
- 3D view of your game world
- **Navigation:**
  - **Right-click + drag** = Look around
  - **Middle-click + drag** = Pan
  - **Scroll wheel** = Zoom
  - **F key** = Focus on selected object

**Inspector (Right)**
- Shows properties of selected object
- This is where you'll configure everything

**Project Window (Bottom)**
- File browser for your assets
- Navigate to `Assets/_Project/` - this is your main folder

**Console (Bottom Tab)**
- Shows messages, warnings, errors
- Keep this visible - it helps debug!

---

## Part 3: Creating Your First Scene

### Step 4: Create New Scene

1. **File > New Scene**
2. A dialog appears - select **Basic (Built-in)** or just **Basic**
3. Click **Create**

You now have an empty scene with:
- Main Camera
- Directional Light

### Step 5: Save Your Scene

1. **File > Save As...**
2. Navigate to `Assets/_Project/Scenes/`
3. Name it: **`TestScene`**
4. Click **Save**

**Your scene is now saved!** ✅

---

## Part 4: Building the Environment

### Step 6: Create the Ground

1. **Right-click in Hierarchy**
2. **3D Object > Plane**
3. This creates a flat ground plane
4. Rename it to **"Ground"**:
   - Select the plane
   - Press **F2** or click the name
   - Type "Ground"

5. **Scale it bigger:**
   - In Inspector, find **Transform > Scale**
   - Set to: **X: 10, Y: 1, Z: 10**

**Now you have a large floor!**

---

### Step 7: Create Some Walls

1. **Right-click on Ground in Hierarchy**
2. **3D Object > Cube**
3. This creates a cube as a child of Ground
4. Rename to **"Wall_North"**

5. **Position and scale it:**
   - **Transform > Position:** X: 0, Y: 1, Z: 5
   - **Transform > Scale:** X: 10, Y: 2, Z: 0.2

6. **Duplicate for more walls:**
   - Select Wall_North
   - Press **Ctrl+D** (Cmd+D on Mac) to duplicate
   - Rename to **"Wall_South"**
   - Position: X: 0, Y: 1, Z: -5

7. **Create side walls:**
   - Duplicate again for **"Wall_East"**
   - Position: X: 5, Y: 1, Z: 0
   - Scale: X: 0.2, Y: 2, Z: 10

   - Duplicate for **"Wall_West"**
   - Position: X: -5, Y: 1, Z: 0

**You now have a walled room!**

---

### Step 8: Add Some Props (Table, Desk)

1. **Right-click in Hierarchy > 3D Object > Cube**
2. Rename to **"Desk"**
3. **Position:** X: 3, Y: 0.4, Z: 2
4. **Scale:** X: 2, Y: 0.8, Z: 1

5. Create another cube for **"Chair"**
6. **Position:** X: 3, Y: 0.25, Z: 1
7. **Scale:** X: 0.5, Y: 0.5, Z: 0.5

**Simple office scene taking shape!**

---

## Part 5: Creating the Player

### Step 9: Create Player GameObject

1. **Right-click in Hierarchy > Create Empty**
2. Rename to **"Player"**
3. **Position:** X: 0, Y: 1, Z: 0 (standing on ground)

### Step 10: Add Camera to Player

1. **Right-click on Player > Camera**
2. The camera becomes a child of Player
3. Rename to **"PlayerCamera"** (optional)
4. **Position (relative to Player):** X: 0, Y: 0.6, Z: 0

**This positions the camera at eye height!**

5. **Delete the old "Main Camera"** from the scene (we don't need it)

### Step 11: Add Player Components

#### Add CharacterController

1. Select **Player** in Hierarchy
2. In Inspector, click **Add Component**
3. Type "Character Controller"
4. Click **Character Controller**

5. **Configure it:**
   - **Height:** 2
   - **Radius:** 0.5
   - **Center:** X: 0, Y: 1, Z: 0

#### Add PlayerController Script

1. Still on Player, click **Add Component**
2. Type "PlayerController"
3. Select it (our custom script!)

4. **Configure it:**
   - **Move Speed:** 5
   - **Sprint Multiplier:** 1.5
   - **Player Camera:** Drag **PlayerCamera** from Hierarchy into this field

#### Add PlayerInteraction Script

1. Click **Add Component** again
2. Type "PlayerInteraction"
3. Select it

4. **Configure it:**
   - **Interaction Range:** 3
   - **Interactable Layer:** Default (for now)
   - **Interact Key:** E
   - **Player Camera:** Drag **PlayerCamera** into this field
   - **Interaction Prompt:** Leave empty for now (we'll add UI later)

---

### Step 12: Test Player Movement

1. Click **Play** button (top center, triangle icon)
2. **Click in the Game view** to lock cursor
3. **Try moving:**
   - WASD to move
   - Mouse to look
   - Shift to sprint
   - ESC to unlock cursor

4. Click **Play** again to stop

**If it's not working, check the Troubleshooting section below!**

---

## Part 6: Adding Manager Systems

### Step 13: Create Managers Container

1. **Right-click in Hierarchy > Create Empty**
2. Rename to **"=== MANAGERS ==="**
3. **Position:** 0, 0, 0

This is just for organization!

### Step 14: Add All Managers

1. **Right-click on === MANAGERS === > Create Empty**
2. Rename to **"GameManager"**
3. **Add Component > Game Manager**

**Repeat for:**
4. **"MoralityManager"** → Add **Morality Manager** component
5. **"CaseManager"** → Add **Case Manager** component
6. **"SaveManager"** → Add **Save Manager** component

### Step 15: Add Test Case Starter

1. **Right-click on === MANAGERS === > Create Empty**
2. Rename to **"TestCaseStarter"**
3. **Add Component > Test Case Starter**

4. **Configure it:**
   - **Case ID:** TEST_CASE_001
   - **Case Name:** Test Investigation
   - **Case Description:** A test case for learning the systems

**This will auto-start a case when the scene loads!**

---

## Part 7: Creating Evidence Items

### Step 16: Create First Evidence Item

1. **Right-click in Hierarchy > 3D Object > Cube**
2. Rename to **"Evidence_Note"**
3. **Position:** X: 3.5, Y: 1, Z: 2.5 (on the desk!)
4. **Scale:** X: 0.2, Y: 0.01, Z: 0.3 (thin, like paper)

### Step 17: Add Evidence Script

1. Select **Evidence_Note**
2. **Add Component > Evidence Item**

3. **Fill in the details:**
   - **Evidence ID:** NOTE_001
   - **Evidence Name:** Mysterious Note
   - **Description:** A hastily written note with a cryptic message
   - **Icon:** Leave empty for now

### Step 18: Add a Collider (Important!)

1. Still on Evidence_Note
2. Check if **Box Collider** component exists
   - If not: **Add Component > Box Collider**

### Step 19: Make it Visually Distinct

Let's make evidence items yellow so they stand out:

1. Select **Evidence_Note**
2. In Inspector, find **Mesh Renderer > Materials**
3. Click the circle next to **Element 0**
4. At the top, click **Create > Material**
5. Navigate to `Assets/_Project/Art/Materials/`
6. Name it **"Mat_Evidence"**
7. Click **Create**

8. **Configure the material:**
   - **Base Map color:** Yellow (R: 255, G: 255, B: 0)
   - Or use gold: (R: 255, G: 215, B: 0)

**Now your evidence is yellow!**

---

### Step 20: Create More Evidence

**Duplicate Evidence_Note** to create more:

1. Select Evidence_Note
2. Press **Ctrl+D** to duplicate
3. Rename to **"Evidence_Knife"**
4. **Position:** X: -2, Y: 0.1, Z: 3 (on the floor)
5. **Scale:** X: 0.1, Y: 0.5, Z: 0.02

6. **Configure EvidenceItem component:**
   - **Evidence ID:** KNIFE_001
   - **Evidence Name:** Bloody Knife
   - **Description:** A kitchen knife with dried blood

7. **Change material color to red** (for blood)

**Create one more:**
8. Duplicate again: **"Evidence_Photo"**
9. Position on desk or floor
10. Configure with your own details!

---

## Part 8: Testing Everything

### Step 21: Complete Playtest

1. **Save your scene:** Ctrl+S
2. Click **Play**
3. **Test checklist:**
   - ✅ Can move with WASD
   - ✅ Can look with mouse
   - ✅ Can walk up to yellow cube (evidence)
   - ✅ Press E to collect evidence
   - ✅ See console message "Evidence collected"

4. **Open Console** (Window > General > Console)
5. You should see:
   - "Test case started: Test Investigation"
   - "Evidence collected: Mysterious Note" (when you pick it up)

---

### Step 22: Test Morality System

Let's test the morality system with a quick script:

1. Stop playing
2. Select **MoralityManager** in Hierarchy
3. **Right-click on the component in Inspector**
4. Select **Debug: Add Lawful Choice**
5. Check the **Morality Score** field - it should increase!
6. Try **Debug: Add Corrupt Choice** - score decreases!

**The morality system is working!** ✅

---

## Part 9: Improving the Scene

### Step 23: Add Atmosphere - Lighting

Let's make it moody (neo-noir style):

1. Select **Directional Light** in Hierarchy
2. **Rotate it:** Set Rotation to X: 50, Y: -30, Z: 0
3. **Change color:**
   - Click the **Color** box
   - Set to slightly blue-ish: R: 200, G: 210, B: 255
4. **Reduce intensity:** Set to **0.7** (darker = moodier)

### Step 24: Add Point Lights

1. **Right-click > Light > Point Light**
2. Rename to **"DeskLamp"**
3. **Position:** X: 3, Y: 1.5, Z: 2 (above desk)
4. **Color:** Warm yellow
5. **Range:** 5
6. **Intensity:** 2

**Create another:**
7. Duplicate for ceiling light
8. Position at X: 0, Y: 3, Z: 0
9. **Range:** 10

**Now your scene has atmosphere!**

---

### Step 25: Add Fog (Optional)

1. **Window > Rendering > Lighting**
2. **Environment tab**
3. Check **Fog**
4. **Fog Color:** Dark blue-gray
5. **Fog Mode:** Linear
6. **Start:** 5
7. **End:** 20

**Moody fog effect!**

---

## Part 10: Organization & Polish

### Step 26: Organize Your Hierarchy

Make it clean and easy to navigate:

```
=== MANAGERS ===
  ├─ GameManager
  ├─ MoralityManager
  ├─ CaseManager
  ├─ SaveManager
  └─ TestCaseStarter

=== PLAYER ===
  └─ PlayerCamera

=== ENVIRONMENT ===
  ├─ Ground
  │   ├─ Wall_North
  │   ├─ Wall_South
  │   ├─ Wall_East
  │   └─ Wall_West
  ├─ Desk
  └─ Chair

=== EVIDENCE ===
  ├─ Evidence_Note
  ├─ Evidence_Knife
  └─ Evidence_Photo

=== LIGHTING ===
  ├─ Directional Light
  ├─ DeskLamp
  └─ CeilingLight
```

**To create folders:**
- Right-click > Create Empty
- Rename with "=== NAME ==="
- Drag objects into them

---

### Step 27: Final Save

1. **File > Save** (Ctrl+S)
2. **File > Save Project**

---

## Part 11: Build Settings

### Step 28: Add Scene to Build

1. **File > Build Settings**
2. Click **Add Open Scenes**
3. TestScene should appear in the list
4. Close the window

**Your scene is now ready for builds!**

---

## 🎉 Congratulations!

### What You've Built:

✅ **Playable first-person scene**
✅ **Working player controller**
✅ **Interactive evidence system**
✅ **All manager systems active**
✅ **Atmospheric lighting**
✅ **Organized hierarchy**

---

## 🐛 Troubleshooting

### Problem: Player won't move

**Solutions:**
1. Check CharacterController is added to Player
2. Check PlayerController script has Camera assigned
3. Check ground has a collider
4. Look for red errors in Console

### Problem: Can't collect evidence

**Solutions:**
1. Check TestCaseStarter is in scene
2. Check evidence has Box Collider
3. Check evidence has EvidenceItem script
4. Check Console for errors

### Problem: Camera is weird

**Solutions:**
1. Make sure old Main Camera is deleted
2. Check PlayerCamera is child of Player
3. Check PlayerCamera position is (0, 0.6, 0) relative to Player
4. Check PlayerController has Camera assigned

### Problem: Everything is pink

**Solution:** URP materials need conversion
1. Edit > Render Pipeline > Universal Render Pipeline > Upgrade Project Materials
2. Wait for upgrade
3. If still pink, change material shader to "Universal Render Pipeline/Lit"

---

## 📚 What's Next?

Now that you have a working scene, you can:

1. **Add more interactables** (doors, drawers, computers)
2. **Design your first case** (using the template)
3. **Add dialogue system** (Ink integration)
4. **Create more complex scenes**
5. **Build actual investigation locations**

---

## 💾 Save Your Work!

**IMPORTANT:** Before closing Unity:

1. **File > Save** (scene)
2. **File > Save Project** (project)
3. **Commit to Git:**

```bash
git add -A
git commit -m "Create first playable test scene"
git push
```

---

**You now have a fully functional prototype scene! Well done! 🎮**

Next: Let's design your first real case!
