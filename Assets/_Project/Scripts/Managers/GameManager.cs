using UnityEngine;

/// <summary>
/// Central game manager coordinating all core systems.
/// This persists across scenes and initializes all other managers.
/// </summary>
public class GameManager : Singleton<GameManager>
{
    [Header("Game State")]
    [SerializeField] private bool isGamePaused = false;

    [Header("Debug")]
    [SerializeField] private bool showDebugLogs = true;

    // References to other managers (will be added as we create them)
    private MoralityManager moralityManager;
    private CaseManager caseManager;
    private SaveManager saveManager;

    private void Awake()
    {
        // Ensure singleton instance
        if (Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        DontDestroyOnLoad(gameObject);
        InitializeManagers();
    }

    private void Start()
    {
        Log("GameManager initialized successfully.");
    }

    /// <summary>
    /// Initialize all manager systems
    /// </summary>
    private void InitializeManagers()
    {
        // Get or create manager references
        moralityManager = MoralityManager.Instance;
        caseManager = CaseManager.Instance;
        saveManager = SaveManager.Instance;

        Log("All managers initialized.");
    }

    /// <summary>
    /// Pause or unpause the game
    /// </summary>
    public void SetPauseState(bool paused)
    {
        isGamePaused = paused;
        Time.timeScale = paused ? 0f : 1f;
        Log($"Game {(paused ? "paused" : "unpaused")}");
    }

    /// <summary>
    /// Toggle pause state
    /// </summary>
    public void TogglePause()
    {
        SetPauseState(!isGamePaused);
    }

    public bool IsGamePaused => isGamePaused;

    /// <summary>
    /// Debug logging with toggle
    /// </summary>
    public void Log(string message)
    {
        if (showDebugLogs)
        {
            Debug.Log($"[GameManager] {message}");
        }
    }

    /// <summary>
    /// Called when quitting the game
    /// </summary>
    public void QuitGame()
    {
        Log("Quitting game...");

        #if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
        #else
        Application.Quit();
        #endif
    }
}
