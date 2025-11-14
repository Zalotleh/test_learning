# Quick Start Guide
## Getting Started with Your Detective Game

This guide will help you get started with development immediately.

---

## 📋 Prerequisites

Before you begin, make sure you have:

- [ ] **Unity Hub** installed
- [ ] **Unity 2022.3 LTS** downloaded via Unity Hub
- [ ] **Visual Studio** or **Rider** (for C# coding)
- [ ] **Git** installed and configured
- [ ] **Inky** editor (for Ink dialogue) - Download from: https://github.com/inkle/inky

---

## 🚀 Step 1: Set Up Unity Project

### 1.1 Create New Unity Project

1. Open **Unity Hub**
2. Click **New Project**
3. Select **3D (URP)** template
4. **Project Name:** DetectiveGame (or your preferred name)
5. **Location:** Choose your repository folder
6. Click **Create Project**

### 1.2 Configure Project Settings

Once Unity opens:

1. **Edit > Project Settings > Player**
   - Set **Company Name** to your studio name
   - Set **Product Name** to "Trial by Fire" (or your title)

2. **Edit > Project Settings > Quality**
   - Delete all quality presets except "High" and "Medium"
   - Set default quality for PC to "High"

3. **Edit > Project Settings > Graphics**
   - Verify URP asset is assigned

---

## 📦 Step 2: Install Essential Packages

### 2.1 Via Unity Package Manager

1. **Window > Package Manager**
2. Install the following packages:

**Required Packages:**
- ✅ **TextMeshPro** (Unity Registry)
- ✅ **Cinemachine** (Unity Registry)
- ✅ **Input System** (Unity Registry)
- ✅ **Universal RP** (should already be installed)

**How to Install:**
- Click the **+** button in top-left
- Select "Add package from git URL" for git packages
- Or find in "Unity Registry" list

### 2.2 Install Ink

1. Download **Ink Unity Integration**:
   - Go to: https://github.com/inkle/ink-unity-integration/releases
   - Download latest `.unitypackage` file

2. In Unity:
   - **Assets > Import Package > Custom Package**
   - Select the downloaded `.unitypackage`
   - Click **Import All**

### 2.3 Optional but Recommended

Install from Asset Store or GitHub:
- **DOTween** (free) - For UI animations
- **Post Processing** (included with URP)

---

## 📁 Step 3: Create Project Structure

### 3.1 Create Folder Structure

In Unity's Project window, create this structure:

```
Assets/
├── _Project/
│   ├── Scenes/
│   ├── Scripts/
│   │   ├── Managers/
│   │   ├── Dialogue/
│   │   ├── Gameplay/
│   │   │   ├── Evidence/
│   │   │   ├── Investigation/
│   │   │   └── Player/
│   │   ├── UI/
│   │   └── Utilities/
│   ├── Prefabs/
│   │   ├── Characters/
│   │   ├── Props/
│   │   └── UI/
│   ├── Art/
│   │   ├── Models/
│   │   ├── Materials/
│   │   ├── Textures/
│   │   └── Animations/
│   ├── Audio/
│   │   ├── Music/
│   │   ├── SFX/
│   │   └── VO/
│   ├── Ink/
│   │   ├── Cases/
│   │   └── Characters/
│   └── Resources/
├── Plugins/
└── Settings/
```

**Why `_Project/` folder?**
- Keeps your assets separate from packages
- Underscore keeps it at the top of the list

---

## 🎮 Step 4: Create First Test Scene

### 4.1 Set Up Main Scene

1. **File > New Scene**
2. Save as: `Assets/_Project/Scenes/TestScene.unity`
3. Add basic objects:
   - **Right-click in Hierarchy > 3D Object > Plane** (floor)
   - Scale to (5, 1, 5)
   - **Right-click > 3D Object > Cube** (test interactable)

### 4.2 Set Up Lighting

1. **Window > Rendering > Lighting**
2. **Environment Tab:**
   - Set **Skybox Material** to a darker one (for noir feel)
3. **Add a Directional Light** if not present
4. Adjust for moody atmosphere

---

## 👤 Step 5: Create Basic First-Person Controller

### 5.1 Create Player GameObject

1. **Hierarchy > Right-click > Create Empty**
2. Rename to "Player"
3. **Reset Transform** (position 0, 0, 0)

### 5.2 Add Camera

1. **Right-click on Player > Camera**
2. Position at (0, 1.6, 0) - eye height
3. This is your first-person view

### 5.3 Create Player Movement Script

1. In `Assets/_Project/Scripts/Player/`, create new C# script: **PlayerController.cs**

```csharp
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [Header("Movement")]
    public float moveSpeed = 5f;
    public float mouseSensitivity = 2f;

    private CharacterController controller;
    private Camera playerCamera;
    private float verticalRotation = 0f;

    void Start()
    {
        // Add CharacterController component
        controller = gameObject.AddComponent<CharacterController>();
        controller.height = 2f;
        controller.radius = 0.5f;

        // Get camera
        playerCamera = GetComponentInChildren<Camera>();

        // Lock cursor
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    void Update()
    {
        HandleMovement();
        HandleMouseLook();

        // ESC to unlock cursor
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
        }
    }

    void HandleMovement()
    {
        float horizontal = Input.GetAxis("Horizontal");
        float vertical = Input.GetAxis("Vertical");

        Vector3 move = transform.right * horizontal + transform.forward * vertical;
        controller.Move(move * moveSpeed * Time.deltaTime);

        // Simple gravity
        controller.Move(Vector3.down * 9.81f * Time.deltaTime);
    }

    void HandleMouseLook()
    {
        float mouseX = Input.GetAxis("Mouse X") * mouseSensitivity;
        float mouseY = Input.GetAxis("Mouse Y") * mouseSensitivity;

        // Rotate player horizontally
        transform.Rotate(Vector3.up * mouseX);

        // Rotate camera vertically
        verticalRotation -= mouseY;
        verticalRotation = Mathf.Clamp(verticalRotation, -90f, 90f);
        playerCamera.transform.localRotation = Quaternion.Euler(verticalRotation, 0f, 0f);
    }
}
```

2. **Attach script to Player** GameObject
3. **Play the scene** - you should be able to move and look around!

---

## 💬 Step 6: Test Ink Dialogue

### 6.1 Create Test Ink File

1. Open **Inky** (the Ink editor you downloaded)
2. Create a new file: `test_dialogue.ink`
3. Write simple test dialogue:

```ink
=== start ===
You approach the mysterious stranger.

"Can I help you, detective?"

* [Ask about the case]
  -> ask_case
* [Leave]
  -> leave

=== ask_case ===
"The case? Which one? There are so many crimes in this city..."

The stranger looks nervous.

* [Press harder]
  "Don't play games with me."
  -> press_harder
* [Show empathy]
  "I understand. Take your time."
  -> empathy

=== press_harder ===
The stranger backs away. "I don't have to talk to you!"

They storm off.

-> END

=== empathy ===
The stranger relaxes slightly.

"Alright... maybe I can help. What do you need to know?"

-> END

=== leave ===
You decide to come back later.

-> END
```

4. **Save** the file
5. **Export as JSON**: File > Export > Export story.json as...
6. Save to `Assets/_Project/Ink/` folder as `test_dialogue.json`

### 6.2 Import to Unity

1. Return to Unity
2. The JSON file should appear in the Project window
3. Unity's Ink integration automatically recognizes `.ink` files

**Note:** You can also place `.ink` files directly in the Unity project, and they'll compile to JSON automatically.

---

## 🧪 Step 7: Verify Everything Works

### Checklist

- [ ] Unity project opens without errors
- [ ] URP is working (scene has proper lighting)
- [ ] All packages installed (check Package Manager)
- [ ] Folder structure created
- [ ] First-person controller works (WASD + mouse)
- [ ] Ink file imported successfully

---

## 📚 Next Steps

Now that your project is set up, you can:

1. **Read the full [Game Design Document](design/GDD.md)**
2. **Review [Technical Specifications](technical/TECHNICAL_SPECS.md)**
3. **Follow the [Development Roadmap](ROADMAP.md)**

### Recommended First Tasks

1. **Create an Interaction System**
   - Raycast from camera to detect objects
   - Highlight interactable objects
   - Show interaction prompts

2. **Build a Simple Dialogue UI**
   - TextMeshPro text for dialogue
   - Buttons for choices
   - Connect to Ink system

3. **Prototype Evidence Collection**
   - Click to collect evidence
   - Add to inventory/list
   - Display in a simple UI

---

## 🆘 Common Issues

### Issue: "URP not rendering correctly"
**Solution:**
- Check if URP asset is assigned in **Edit > Project Settings > Graphics**
- Ensure all materials use URP shaders

### Issue: "Ink integration not working"
**Solution:**
- Make sure you imported the `.unitypackage` correctly
- Check for errors in Console
- Restart Unity

### Issue: "Player controller not moving"
**Solution:**
- Ensure CharacterController component is added
- Check that script is attached to Player GameObject
- Verify Input settings (Edit > Project Settings > Input)

### Issue: "Git conflicts with Unity"
**Solution:**
- Make sure `.gitignore` is set up correctly (see below)
- Only commit Assets, Packages, and ProjectSettings folders
- Never commit Library or Temp folders

---

## 📌 Git Setup

### .gitignore for Unity

Make sure you have a proper Unity `.gitignore` file in your repository.

**Quick setup:**
1. Go to: https://github.com/github/gitignore/blob/main/Unity.gitignore
2. Copy the contents
3. Create `.gitignore` in your repository root
4. Paste and save

**Key exclusions:**
- `/Library/` - Unity's cache (NEVER commit this)
- `/Temp/` - Temporary files
- `/Logs/` - Log files
- `*.csproj`, `*.sln` - Generated project files

---

## 🎯 Your First Goal: Playable Prototype

**Target:** Create a simple scene where you can:
1. Walk around in first-person
2. Click on an object to examine it
3. Trigger a dialogue with an NPC
4. Make a choice that shows different text

**Time estimate:** 1-2 days

Once you achieve this, you'll have proven all core systems work, and you can move on to building the first full case!

---

## 📖 Resources

### Official Documentation
- **Unity Manual:** https://docs.unity3d.com/Manual/index.html
- **Ink Documentation:** https://github.com/inkle/ink/blob/master/Documentation/WritingWithInk.md
- **URP Guide:** https://docs.unity3d.com/Packages/com.unity.render-pipelines.universal@latest

### Tutorials
- Unity First-Person Controller: https://www.youtube.com/results?search_query=unity+first+person+controller
- Ink + Unity Integration: https://www.youtube.com/results?search_query=unity+ink+integration

### Communities
- Unity Forums: https://forum.unity.com/
- Ink Discord: https://discord.gg/inkle
- r/gamedev: https://reddit.com/r/gamedev
- r/Unity3D: https://reddit.com/r/Unity3D

---

**Good luck with development! You've got a solid foundation to build an amazing detective game.**

If you get stuck, refer back to the technical documentation or reach out to gamedev communities.
