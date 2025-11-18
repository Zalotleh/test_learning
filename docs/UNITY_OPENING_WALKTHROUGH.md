# Opening Unity for the First Time
## Screen-Share Style Walkthrough

**Time Required:** 30-60 minutes
**Difficulty:** Complete Beginner Friendly

---

## 🎯 What We're Doing

By the end of this guide, Unity will be open, you'll understand the interface, and you'll have created your first GameObject.

---

## Part 1: Installing Unity Hub (10-15 minutes)

### Step 1: Download Unity Hub

1. **Open your web browser**
2. Go to: `unity.com`
3. Click **"Get Started"** or **"Download Unity"**
4. You'll see options - click **"Download Unity Hub"**

**What is Unity Hub?**
Think of it like Steam for Unity - it manages different Unity versions and projects.

---

### Step 2: Install Unity Hub

**On Windows:**
1. Open the downloaded `UnityHubSetup.exe`
2. Click **"Yes"** if Windows asks for permission
3. Follow the installer (all defaults are fine)
4. Click **"Install"** → Wait → **"Finish"**

**On Mac:**
1. Open the downloaded `.dmg` file
2. Drag Unity Hub to Applications folder
3. Open Applications, double-click Unity Hub
4. If Mac says "can't open" - go to System Preferences > Security, click "Open Anyway"

---

### Step 3: Create Unity Account (or Sign In)

1. Unity Hub opens (black window with white/blue accents)
2. You'll see a **"Sign In"** button
3. Click it
4. **If you have account:** Sign in
5. **If you don't:** Click "Create One" → Fill form → Verify email

**Important:** You need an account to use Unity (it's free!)

---

## Part 2: Installing Unity Editor (15-20 minutes)

### Step 4: Install Unity 2022.3 LTS

**In Unity Hub:**

1. Look at the left sidebar - click **"Installs"**
2. Click the blue **"Install Editor"** button (top right)
3. A list of Unity versions appears

**Find "2022.3.X LTS" (X = any number):**
- LTS means "Long Term Support" = stable!
- Look for: **2022.3.10f1** or similar

4. Click **"Install"** next to 2022.3.X LTS

---

### Step 5: Select Modules to Install

A window appears asking "Add modules":

**Required - CHECK THESE:**
- ✅ **Microsoft Visual Studio Community** (or Visual Studio Code)
- ✅ **Documentation** (optional but helpful)

**For your platform:**
- ✅ **Windows Build Support** (if on Windows)
- ✅ **Mac Build Support** (if on Mac)

**Skip these for now:**
- ❌ Android Build Support (not needed yet)
- ❌ iOS Build Support
- ❌ WebGL Build Support

5. Click **"Continue"**
6. Accept Terms of Service
7. Click **"Install"**

---

### Step 6: Wait for Installation

**This takes 10-20 minutes!**

You'll see:
- Progress bar showing download
- Then extracting
- Then installing Visual Studio (if selected)

**What to do while waiting:**
- Get coffee ☕
- Read the GDD (`docs/design/GDD.md`)
- Watch a Unity intro video on YouTube

---

### Step 7: Installation Complete

When done, you'll see:
- Unity 2022.3.X in your "Installs" list
- A green checkmark next to it

**Unity Editor is now installed!** ✅

---

## Part 3: Opening Your Project (5-10 minutes)

### Step 8: Add Project to Unity Hub

1. In Unity Hub, click **"Projects"** in left sidebar
2. You'll see an empty list (or other projects if you have any)
3. Click **"Add"** button (top right, or **"Open"** dropdown → **"Add project from disk"**)

---

### Step 9: Navigate to Your Project

A file browser opens:

**Where is your project?**
- You cloned the repository to: `/test_learning/`
- Navigate there (look for folders like `Assets`, `Packages`, `ProjectSettings`)

**Important:** Select the ROOT folder `/test_learning/`, NOT the `Assets` folder inside it!

4. Click **"Add"** or **"Select Folder"**

---

### Step 10: Project Appears in List

You should now see:
- Project name: **test_learning** (or whatever you named it)
- Unity version: **2022.3.X**
- Last modified date

**If you see a warning:**
- "Project was created with different version" - this is OK!
- It will upgrade automatically

---

### Step 11: Open the Project

**Click on the project name in the list**

Unity Hub will:
1. Show "Opening Project" message
2. Launch Unity Editor
3. Start importing assets

**You'll see a loading screen with Unity logo**

---

## Part 4: First Import (10-15 minutes)

### Step 12: The Long Wait

**IMPORTANT:** The first time you open a project, Unity creates a `Library` folder. This takes TIME!

**You'll see:**
- "Importing package" messages
- Progress bar (may seem stuck - it's not!)
- "Importing assets X of Y"

**How long?**
- Small project: 5-10 minutes
- This project: 5-15 minutes
- Complex project: 30+ minutes

**The Library folder can be 1-2 GB!**

**What's happening:**
- Unity is processing every file
- Creating metadata
- Compiling scripts
- Building asset database

**DO NOT CLOSE UNITY while this is happening!**

---

### Step 13: While You Wait

Look at what you can see:

**The loading screen shows:**
- Unity logo
- Progress bar
- Messages like:
  - "Importing Assets/Scripts/..."
  - "Compiling scripts..."
  - "Refreshing asset database..."

**If you see warnings (yellow triangles):**
- This is normal!
- They'll appear in Console when Unity opens

**If you see errors (red Xs):**
- Also can be normal for first load
- We'll fix them once Unity opens

---

### Step 14: Unity Editor Opens!

**Finally, you'll see the Unity Editor interface!**

It might look overwhelming - that's normal! Let's break it down.

---

## Part 5: Understanding the Interface (10 minutes)

### Step 15: The Main Windows

**You should see 5 main areas:**

```
┌─────────────────────────────────────────────────────────┐
│  Top Bar (File, Edit, Assets, GameObject, Component...) │
├──────────┬──────────────────────────────────┬───────────┤
│          │                                  │           │
│ Hierarchy│         Scene View               │ Inspector │
│          │                                  │           │
│          │                                  │           │
│          ├──────────────────────────────────┤           │
│          │         Game View                │           │
├──────────┴──────────────────────────────────┴───────────┤
│                                                          │
│              Project Window                              │
│                                                          │
├──────────────────────────────────────────────────────────┤
│              Console Window                              │
└──────────────────────────────────────────────────────────┘
```

**Let's learn each one:**

---

### Step 16: Hierarchy Window (Left Side)

**What is it?**
Lists all objects in your current scene.

**You might see:**
- Main Camera
- Directional Light
- Or nothing (empty scene)

**What you can do:**
- Click on objects to select them
- Right-click to create new objects
- Drag to rearrange (parent/child relationships)

**Think of it as:** The "layers" panel in Photoshop, or file tree in Windows Explorer.

---

### Step 17: Scene View (Center-Top)

**What is it?**
Your 3D workspace where you build the game.

**You see:**
- Grid (if empty scene)
- Any objects in the scene
- Camera icon (represents Main Camera)

**Navigation:**
- **Right-click + drag** = Rotate view (look around)
- **Middle-click + drag** = Pan view (slide camera)
- **Scroll wheel** = Zoom in/out
- **F key** = Focus on selected object

**Try it now:**
1. Right-click and drag mouse around
2. Your view rotates!
3. Scroll wheel to zoom
4. Middle-click and drag to slide view

---

### Step 18: Game View (Center-Bottom Tab)

**What is it?**
Shows what the player sees through the camera.

**You see:**
- What Main Camera sees
- Usually blank or skybox if empty scene

**When you press Play (▶ button at top), this becomes your playable game!**

**Switch between Scene and Game:**
- Click the **"Scene"** or **"Game"** tabs above the view

---

### Step 19: Inspector Window (Right Side)

**What is it?**
Shows properties and components of selected object.

**Try it:**
1. Click on **"Main Camera"** in Hierarchy
2. Look at Inspector - you see:
   - Transform (Position, Rotation, Scale)
   - Camera component (FOV, Clipping Planes, etc.)
   - Audio Listener

**This is where you configure EVERYTHING.**

**Think of it as:** Properties panel in Adobe programs.

---

### Step 20: Project Window (Bottom)

**What is it?**
Your file browser - shows all assets in your project.

**You see:**
- **Assets** folder (your game content)
  - **_Project** folder (our organized structure)
    - Scripts, Scenes, Prefabs, etc.
- **Packages** folder (Unity packages)

**You can:**
- Double-click folders to open
- Right-click to create new assets
- Drag files into Unity to import them
- Search bar at top to find files

**Think of it as:** Windows Explorer or Mac Finder, but for Unity.

---

### Step 21: Console Window (Bottom Tab)

**What is it?**
Shows messages, warnings, and errors from Unity and your scripts.

**Three types of messages:**
- **White** = Info (just FYI)
- **Yellow ⚠** = Warning (might be a problem)
- **Red ❌** = Error (something is broken)

**Click the tab to see console messages**

**You might see:**
- "All compiler errors have to be fixed" (this is GOOD - means code compiled!)
- Some warnings about packages (usually safe to ignore)

---

## Part 6: Creating Your First GameObject (5 minutes)

### Step 22: Create a Cube

Let's create something!

1. **Right-click in Hierarchy** window (left side)
2. Hover over **"3D Object"**
3. Click **"Cube"**

**A cube appears!**

---

### Step 23: Look at Your Cube

**In Scene view:**
- You should see a white/gray cube
- If you don't see it, click cube in Hierarchy, then press **F** key (focus)

**In Inspector:**
- Cube is selected
- You see Transform, Mesh Filter, Mesh Renderer, Box Collider

---

### Step 24: Move Your Cube

**In Inspector, find Transform:**

**Change Position:**
- X: 2
- Y: 1
- Z: 0

**Watch the cube move in Scene view!**

---

### Step 25: Scale Your Cube

**Still in Transform:**

**Change Scale:**
- X: 2
- Y: 0.5
- Z: 1

**Your cube is now a rectangle!**

---

### Step 26: Rotate Your Cube

**Still in Transform:**

**Change Rotation:**
- Y: 45

**Your cube is now rotated!**

---

## Part 7: Testing Play Mode (5 minutes)

### Step 27: Press Play

**At the top center of Unity, you see three buttons:**
- ▶ Play
- ⏸ Pause
- ⏭ Step

**Click the ▶ Play button**

---

### Step 28: Game View Becomes Active

**You're now in "Play Mode":**
- Game tab automatically opens
- You see what the camera sees
- The Play button is now highlighted/tinted

**In Play Mode:**
- Your game is running
- You can test interactions
- Any changes you make are TEMPORARY (won't be saved!)

---

### Step 29: Stop Play Mode

**Click ▶ Play button again to stop**

**IMPORTANT WARNING:**
⚠️ **Any changes made in Play Mode are LOST when you stop!**

This is the #1 beginner mistake:
- You adjust something while playing
- It looks great!
- You stop playing
- It's gone!

**Always edit in Edit Mode (when NOT playing)!**

---

## Part 8: Saving (5 minutes)

### Step 30: Save Your Scene

Your project needs a scene to be saved.

**If you haven't yet:**
1. **File > Save As**
2. Navigate to `Assets/_Project/Scenes/`
3. Name it: **MyFirstScene**
4. Click **Save**

---

### Step 31: Save the Project

**File > Save Project** (or Ctrl+S / Cmd+S)

This saves everything:
- Scene
- Project settings
- Any changes

**Get in the habit:** Ctrl+S after every change!

---

## Part 9: Orientation & Next Steps (5 minutes)

### Step 32: Orient Yourself

**You now know:**
- ✅ How to open Unity
- ✅ What each window does
- ✅ How to navigate Scene view
- ✅ How to create objects
- ✅ How to use Inspector
- ✅ How to enter/exit Play Mode
- ✅ How to save

**This is HUGE! You're ready to start building!**

---

### Step 33: Check Console for Errors

Click on **Console** tab (bottom)

**Do you see red errors?**

**Common first-time errors:**

1. **"Script is missing"**
   - Solution: Unity hasn't compiled scripts yet
   - Wait a moment, or click **Assets > Refresh**

2. **"Namespace or type name could not be found"**
   - Solution: Missing using statements
   - We'll fix these as we go

3. **"UnityEditor.PackageManager errors"**
   - Usually safe to ignore
   - Related to package installation

**If no errors:** You're golden! ✅

---

### Step 34: Explore the Interface

**Spend 5-10 minutes just:**
- Clicking around
- Creating objects (right-click in Hierarchy > 3D Object)
- Moving them in Inspector
- Pressing Play to see Game view
- Navigating Scene view

**Get comfortable! This is your workspace for months.**

---

### Step 35: What's Next?

**Now that Unity is open, you can:**

1. **Follow `FIRST_SCENE_WALKTHROUGH.md`**
   - Build your first playable scene
   - Takes 1-2 hours
   - Results in playable test

2. **Or continue learning Unity basics:**
   - Watch: "Unity Interface Tutorial" on YouTube
   - Practice: Create cubes, spheres, move them around
   - Read: Unity Manual (Help > Unity Manual)

---

## 🎉 Congratulations!

You've successfully:
- ✅ Installed Unity Hub
- ✅ Installed Unity 2022.3 LTS
- ✅ Opened your project
- ✅ Learned the Unity interface
- ✅ Created your first GameObject
- ✅ Tested Play Mode
- ✅ Saved your work

**This is the hardest part for beginners - you did it!**

---

## 🐛 Troubleshooting

### Problem: Unity Won't Open / Crashes

**Solutions:**
1. Restart computer
2. Reinstall Unity 2022.3 LTS through Unity Hub
3. Check system requirements (8GB RAM minimum, 16GB recommended)
4. Update graphics drivers

---

### Problem: Import Takes Forever (30+ minutes)

**This can happen if:**
- First time opening
- Large project
- Slow hard drive (HDD vs SSD)

**Solutions:**
- Be patient! Let it finish
- Close other programs (free up RAM)
- Don't interrupt the process
- If stuck for 1+ hour, restart Unity and try again

---

### Problem: Everything is Pink

**This means:** Shaders aren't loading (URP issue)

**Solution:**
1. **Edit > Render Pipeline > Universal Render Pipeline > Upgrade Project Materials**
2. Wait for upgrade
3. If still pink, select pink material, change shader to "Universal Render Pipeline/Lit"

---

### Problem: "Script compilation failed"

**Solution:**
1. Look at Console (bottom) for specific error
2. Google the error message
3. Check that all scripts are in correct folders
4. Try: **Assets > Reimport All**

---

### Problem: Can't Find Unity Hub

**Windows:**
- Check Start Menu
- Or: `C:\Program Files\Unity Hub\Unity Hub.exe`

**Mac:**
- Check Applications folder
- Or: Spotlight search "Unity Hub"

---

### Problem: Project Doesn't Appear in Unity Hub

**Solution:**
1. Click **"Add"** button
2. Navigate to project folder
3. Make sure you select the ROOT folder (where `Assets` folder is inside)
4. Not the Assets folder itself!

---

## 📚 Additional Resources

### Official Unity Resources
- **Unity Learn:** https://learn.unity.com/ (free tutorials)
- **Unity Manual:** https://docs.unity3d.com/Manual/ (documentation)
- **Unity Scripting Reference:** https://docs.unity3d.com/ScriptReference/

### YouTube Channels
- **Brackeys** (Unity basics - channel archived but great)
- **Code Monkey** (Unity tutorials)
- **Blackthornprod** (Game dev concepts)

### Communities
- **Unity Forums:** https://forum.unity.com/
- **r/Unity3D:** https://reddit.com/r/Unity3D
- **Unity Discord:** https://discord.gg/unity

---

## 🎯 Quick Reference: Unity Shortcuts

**Navigation (Scene View):**
- **Right-click + drag** = Rotate camera
- **Middle-click + drag** = Pan camera
- **Scroll wheel** = Zoom
- **F** = Focus on selected object
- **Alt + Left-click + drag** = Orbit around object

**General:**
- **Ctrl + S** = Save
- **Ctrl + D** = Duplicate
- **Ctrl + Z** = Undo
- **Delete** = Delete selected object
- **Ctrl + P** = Play/Stop
- **F2** = Rename

**Windows:**
- **Ctrl + 1** = Scene view
- **Ctrl + 2** = Game view
- **Ctrl + 3** = Inspector
- **Ctrl + 4** = Hierarchy
- **Ctrl + 5** = Project
- **Ctrl + Shift + C** = Console

---

## ✅ Completion Checklist

By the end of this walkthrough, you should have:

- [ ] Unity Hub installed
- [ ] Unity 2022.3 LTS installed
- [ ] Project opened in Unity
- [ ] Understand Hierarchy, Scene, Inspector, Project, Console
- [ ] Created and moved a GameObject
- [ ] Entered and exited Play Mode
- [ ] Saved your scene
- [ ] No critical errors in Console

**If you checked all boxes: You're ready for the next step!**

---

## 🚀 What's Next?

**Choose your path:**

1. **I want to build immediately:**
   → Go to `FIRST_SCENE_WALKTHROUGH.md`

2. **I want to learn more Unity first:**
   → Watch Unity tutorials for 1-2 hours
   → Then go to walkthrough

3. **I want to understand the code:**
   → Read `CONTROLS_AND_SYSTEMS.md`
   → Open scripts in Visual Studio
   → Then go to walkthrough

**Recommended:** Option 1 - build while you learn!

---

**You're officially a Unity user now! Time to build your detective game!** 🕵️‍♂️🎮
