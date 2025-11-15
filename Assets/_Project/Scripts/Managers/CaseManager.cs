using UnityEngine;
using System.Collections.Generic;

/// <summary>
/// Manages case progression, objectives, and evidence collection
/// </summary>
public class CaseManager : Singleton<CaseManager>
{
    [Header("Current Case")]
    [SerializeField] private Case currentCase;

    [Header("Debug")]
    [SerializeField] private bool showDebugLogs = true;

    private List<Case> completedCases = new List<Case>();

    // Events
    public delegate void CaseEvent(Case case_);
    public event CaseEvent OnCaseStarted;
    public event CaseEvent OnCaseCompleted;

    public delegate void EvidenceEvent(Evidence evidence);
    public event EvidenceEvent OnEvidenceCollected;

    private void Start()
    {
        Log("CaseManager initialized.");
    }

    /// <summary>
    /// Start a new case
    /// </summary>
    public void StartCase(Case newCase)
    {
        if (currentCase != null && currentCase.state != CaseState.Completed)
        {
            Debug.LogWarning($"[CaseManager] Cannot start new case. Current case '{currentCase.caseName}' is still active.");
            return;
        }

        currentCase = newCase;
        currentCase.state = CaseState.Active;
        currentCase.startTime = System.DateTime.Now;

        Log($"Case started: {currentCase.caseName}");
        OnCaseStarted?.Invoke(currentCase);
    }

    /// <summary>
    /// Complete the current case
    /// </summary>
    public void CompleteCase(CaseResolution resolution)
    {
        if (currentCase == null)
        {
            Debug.LogWarning("[CaseManager] No active case to complete.");
            return;
        }

        currentCase.state = CaseState.Completed;
        currentCase.resolution = resolution;
        currentCase.endTime = System.DateTime.Now;

        completedCases.Add(currentCase);

        Log($"Case completed: {currentCase.caseName} - Resolution: {resolution}");
        OnCaseCompleted?.Invoke(currentCase);

        currentCase = null;
    }

    /// <summary>
    /// Add evidence to current case
    /// </summary>
    public void CollectEvidence(Evidence evidence)
    {
        if (currentCase == null)
        {
            Debug.LogWarning("[CaseManager] Cannot collect evidence. No active case.");
            return;
        }

        if (currentCase.collectedEvidence.Contains(evidence))
        {
            Log($"Evidence already collected: {evidence.name}");
            return;
        }

        currentCase.collectedEvidence.Add(evidence);
        Log($"Evidence collected: {evidence.name}");

        OnEvidenceCollected?.Invoke(evidence);
    }

    /// <summary>
    /// Check if specific evidence has been collected
    /// </summary>
    public bool HasEvidence(string evidenceID)
    {
        if (currentCase == null) return false;

        return currentCase.collectedEvidence.Exists(e => e.evidenceID == evidenceID);
    }

    /// <summary>
    /// Get number of collected evidence
    /// </summary>
    public int GetEvidenceCount()
    {
        return currentCase?.collectedEvidence.Count ?? 0;
    }

    // Getters
    public Case CurrentCase => currentCase;
    public List<Case> CompletedCases => new List<Case>(completedCases);

    private void Log(string message)
    {
        if (showDebugLogs)
            Debug.Log($"[CaseManager] {message}");
    }
}

/// <summary>
/// Case data structure
/// </summary>
[System.Serializable]
public class Case
{
    public string caseID;
    public string caseName;
    public string description;
    public CaseState state;
    public List<Evidence> collectedEvidence = new List<Evidence>();
    public CaseResolution resolution;
    public System.DateTime startTime;
    public System.DateTime endTime;
}

/// <summary>
/// Evidence data structure
/// </summary>
[System.Serializable]
public class Evidence
{
    public string evidenceID;
    public string name;
    public string description;
    public Sprite icon;
    public bool isExamined;
}

public enum CaseState
{
    NotStarted,
    Active,
    Completed
}

public enum CaseResolution
{
    None,
    JusticeServed,
    CorruptDeal,
    GrayEnding,
    Failed
}
