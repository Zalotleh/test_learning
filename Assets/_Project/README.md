# Project Assets Organization

This folder contains all game-specific assets for the Detective Game project.

## Folder Structure

### 📁 Scenes/
Contains all Unity scenes for the game.
- `MainMenu.unity` - Main menu scene
- `DetectiveOffice.unity` - Player's office (hub)
- `TestScene.unity` - Prototype/testing scene
- Chapter folders for case scenes

### 📁 Scripts/
All C# scripts organized by functionality.

#### Managers/
Core game systems and singleton managers:
- `GameManager.cs` - Central game coordinator
- `MoralityManager.cs` - Tracks player morality
- `CaseManager.cs` - Handles case progression
- `SaveManager.cs` - Save/load functionality
- `DialogueManager.cs` - Ink integration
- `RelationshipManager.cs` - NPC relationships
- `MemoryManager.cs` - Memory fragment system

#### Dialogue/
Dialogue-related scripts:
- Ink integration helpers
- Dialogue UI controllers
- Choice handlers

#### Gameplay/
Core gameplay scripts:
- **Evidence/** - Evidence collection and management
- **Investigation/** - Investigation mechanics
- **Player/** - Player controller and interactions

#### UI/
All UI-related scripts:
- Menu controllers
- HUD elements
- Case file UI
- Notebook UI

#### Utilities/
Helper scripts and tools:
- Singleton pattern
- Extension methods
- Debugging tools

### 📁 Prefabs/
Reusable game objects:
- **Characters/** - NPC prefabs
- **Props/** - Interactive objects
- **UI/** - UI prefab components

### 📁 Art/
Visual assets:
- **Models/** - 3D models (.fbx, .obj)
- **Materials/** - Material files
- **Textures/** - Texture files
- **Animations/** - Animation clips

### 📁 Audio/
Sound assets:
- **Music/** - Background music
- **SFX/** - Sound effects
- **VO/** - Voice over files

### 📁 Ink/
Dialogue and narrative files:
- **Cases/** - Case-specific dialogue
- **Characters/** - Character dialogue trees

### 📁 Resources/
Unity Resources folder for runtime loading.
Use sparingly - consider Addressables for larger projects.

---

## Naming Conventions

### Scripts
- PascalCase: `GameManager.cs`, `PlayerController.cs`
- Interfaces: `IInteractable.cs`
- Abstract classes: `BaseManager.cs`

### Scenes
- PascalCase: `DetectiveOffice.unity`
- Prefix with chapter: `CH1_CrimeScene.unity`

### Prefabs
- PascalCase: `NPC_Clara.prefab`
- Descriptive: `Evidence_BloodyKnife.prefab`

### Assets
- snake_case for textures: `wall_brick_diffuse.png`
- PascalCase for materials: `WallBrick.mat`
- Descriptive names: `detective_office_desk.fbx`

---

## Best Practices

1. **Keep it organized** - Always place files in the correct folder
2. **Use prefabs** - Don't duplicate objects, use prefabs
3. **Name clearly** - Future you will thank you
4. **Document scripts** - Add XML comments to public methods
5. **Test in TestScene** - Don't break main scenes during testing

---

**Questions?** Check the main documentation in `/docs`
