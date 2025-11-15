using UnityEngine;
using System.IO;

/// <summary>
/// Handles saving and loading game state
/// </summary>
public class SaveManager : Singleton<SaveManager>
{
    [Header("Settings")]
    [SerializeField] private string saveFileName = "savegame";
    [SerializeField] private bool useEncryption = false; // For future implementation

    [Header("Debug")]
    [SerializeField] private bool showDebugLogs = true;

    private string savePath;

    private void Awake()
    {
        savePath = Application.persistentDataPath + "/saves/";

        // Create saves directory if it doesn't exist
        if (!Directory.Exists(savePath))
        {
            Directory.CreateDirectory(savePath);
            Log($"Created saves directory at: {savePath}");
        }
    }

    /// <summary>
    /// Save game to specified slot
    /// </summary>
    public void SaveGame(int slotNumber = 0)
    {
        SaveData data = CollectSaveData();
        data.saveSlotName = $"Save Slot {slotNumber + 1}";
        data.saveTime = System.DateTime.Now;

        string json = JsonUtility.ToJson(data, true);
        string filePath = savePath + $"{saveFileName}_{slotNumber}.json";

        try
        {
            File.WriteAllText(filePath, json);
            Log($"Game saved to slot {slotNumber} at {filePath}");
        }
        catch (System.Exception e)
        {
            Debug.LogError($"[SaveManager] Failed to save game: {e.Message}");
        }
    }

    /// <summary>
    /// Load game from specified slot
    /// </summary>
    public bool LoadGame(int slotNumber = 0)
    {
        string filePath = savePath + $"{saveFileName}_{slotNumber}.json";

        if (!File.Exists(filePath))
        {
            Debug.LogWarning($"[SaveManager] Save file not found at slot {slotNumber}");
            return false;
        }

        try
        {
            string json = File.ReadAllText(filePath);
            SaveData data = JsonUtility.FromJson<SaveData>(json);

            ApplySaveData(data);
            Log($"Game loaded from slot {slotNumber}");
            return true;
        }
        catch (System.Exception e)
        {
            Debug.LogError($"[SaveManager] Failed to load game: {e.Message}");
            return false;
        }
    }

    /// <summary>
    /// Check if a save exists in specified slot
    /// </summary>
    public bool SaveExists(int slotNumber = 0)
    {
        string filePath = savePath + $"{saveFileName}_{slotNumber}.json";
        return File.Exists(filePath);
    }

    /// <summary>
    /// Delete save from specified slot
    /// </summary>
    public void DeleteSave(int slotNumber = 0)
    {
        string filePath = savePath + $"{saveFileName}_{slotNumber}.json";

        if (File.Exists(filePath))
        {
            File.Delete(filePath);
            Log($"Save deleted from slot {slotNumber}");
        }
    }

    /// <summary>
    /// Collect all game data for saving
    /// </summary>
    private SaveData CollectSaveData()
    {
        SaveData data = new SaveData();

        // Collect data from all managers
        if (MoralityManager.Instance != null)
        {
            data.moralityScore = MoralityManager.Instance.MoralityScore;
        }

        // Add more data collection from other managers here as they're implemented

        return data;
    }

    /// <summary>
    /// Apply loaded data to game systems
    /// </summary>
    private void ApplySaveData(SaveData data)
    {
        // Apply data to all managers
        // This will be expanded as more systems are added

        Log($"Save data applied from {data.saveTime}");
    }

    private void Log(string message)
    {
        if (showDebugLogs)
            Debug.Log($"[SaveManager] {message}");
    }

    // Debug methods
    [ContextMenu("Debug: Save to Slot 0")]
    private void DebugSave()
    {
        SaveGame(0);
    }

    [ContextMenu("Debug: Load from Slot 0")]
    private void DebugLoad()
    {
        LoadGame(0);
    }
}

/// <summary>
/// Complete save data structure
/// </summary>
[System.Serializable]
public class SaveData
{
    // Meta
    public string saveSlotName;
    public System.DateTime saveTime;
    public float playtime;

    // Morality
    public float moralityScore;

    // Add more fields as systems are implemented
    // public string currentCaseID;
    // public List<string> completedCaseIDs;
    // etc.
}
