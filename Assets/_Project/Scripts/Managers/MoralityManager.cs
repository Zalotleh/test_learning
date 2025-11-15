using UnityEngine;
using System.Collections.Generic;

/// <summary>
/// Manages the player's morality system tracking choices and alignment.
/// Morality ranges from -100 (Corrupt) to +100 (Lawful)
/// </summary>
public class MoralityManager : Singleton<MoralityManager>
{
    [Header("Morality Score")]
    [SerializeField] private float moralityScore = 0f; // -100 to +100

    [Header("Thresholds")]
    [SerializeField] private float highlyLawfulThreshold = 50f;
    [SerializeField] private float lawfulThreshold = 20f;
    [SerializeField] private float corruptThreshold = -20f;
    [SerializeField] private float highlyCorruptThreshold = -50f;

    [Header("Debug")]
    [SerializeField] private bool showDebugLogs = true;

    // Track choice history
    private List<MoralChoice> choiceHistory = new List<MoralChoice>();

    // Events for other systems to react to morality changes
    public delegate void MoralityChanged(float newScore, MoralAlignment newAlignment);
    public event MoralityChanged OnMoralityChanged;

    private void Start()
    {
        Log($"MoralityManager initialized. Starting score: {moralityScore}");
    }

    /// <summary>
    /// Record a moral choice and update score
    /// </summary>
    public void RecordChoice(string choiceID, string description, float moralityChange)
    {
        MoralChoice choice = new MoralChoice
        {
            choiceID = choiceID,
            description = description,
            moralityChange = moralityChange,
            timestamp = System.DateTime.Now
        };

        choiceHistory.Add(choice);

        float oldScore = moralityScore;
        moralityScore = Mathf.Clamp(moralityScore + moralityChange, -100f, 100f);

        Log($"Choice recorded: {description} ({moralityChange:+0;-0}) | Score: {oldScore:F1} -> {moralityScore:F1}");

        // Trigger event
        OnMoralityChanged?.Invoke(moralityScore, GetCurrentAlignment());
    }

    /// <summary>
    /// Get current morality alignment
    /// </summary>
    public MoralAlignment GetCurrentAlignment()
    {
        if (moralityScore >= highlyLawfulThreshold)
            return MoralAlignment.HighlyLawful;
        else if (moralityScore >= lawfulThreshold)
            return MoralAlignment.Lawful;
        else if (moralityScore <= highlyCorruptThreshold)
            return MoralAlignment.HighlyCorrupt;
        else if (moralityScore <= corruptThreshold)
            return MoralAlignment.Corrupt;
        else
            return MoralAlignment.Neutral;
    }

    /// <summary>
    /// Check if a skill is unlocked based on morality
    /// </summary>
    public bool IsSkillUnlocked(string skillID, float requiredMorality, bool requireLawful)
    {
        if (requireLawful)
            return moralityScore >= requiredMorality;
        else
            return moralityScore <= requiredMorality;
    }

    /// <summary>
    /// Get morality as normalized value (0 to 1)
    /// </summary>
    public float GetNormalizedMorality()
    {
        return (moralityScore + 100f) / 200f; // Convert -100 to 100 range to 0 to 1
    }

    // Getters
    public float MoralityScore => moralityScore;
    public List<MoralChoice> ChoiceHistory => new List<MoralChoice>(choiceHistory);

    private void Log(string message)
    {
        if (showDebugLogs)
            Debug.Log($"[MoralityManager] {message}");
    }

    // Debug method
    [ContextMenu("Debug: Add Lawful Choice")]
    private void DebugAddLawful()
    {
        RecordChoice("DEBUG", "Debug lawful choice", 10f);
    }

    [ContextMenu("Debug: Add Corrupt Choice")]
    private void DebugAddCorrupt()
    {
        RecordChoice("DEBUG", "Debug corrupt choice", -10f);
    }

    [ContextMenu("Debug: Reset Morality")]
    private void DebugReset()
    {
        moralityScore = 0f;
        choiceHistory.Clear();
        Log("Morality reset to 0");
    }
}

/// <summary>
/// Morality alignment categories
/// </summary>
public enum MoralAlignment
{
    HighlyLawful,
    Lawful,
    Neutral,
    Corrupt,
    HighlyCorrupt
}

/// <summary>
/// Data structure for individual moral choices
/// </summary>
[System.Serializable]
public class MoralChoice
{
    public string choiceID;
    public string description;
    public float moralityChange;
    public System.DateTime timestamp;
}
