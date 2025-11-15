using UnityEngine;

/// <summary>
/// Debug script to start a test case for development and testing.
/// Attach this to a GameObject in your test scene to automatically start a case.
/// This allows evidence collection and other case-dependent features to work.
/// </summary>
public class TestCaseStarter : MonoBehaviour
{
    [Header("Test Case Settings")]
    [SerializeField] private string caseID = "TEST_CASE_001";
    [SerializeField] private string caseName = "Test Investigation";
    [SerializeField] private string caseDescription = "A test case for development and prototyping.";

    private void Start()
    {
        StartTestCase();
    }

    private void StartTestCase()
    {
        // Create a test case
        Case testCase = new Case
        {
            caseID = caseID,
            caseName = caseName,
            description = caseDescription,
            state = CaseState.Active
        };

        // Start the case through CaseManager
        if (CaseManager.Instance != null)
        {
            CaseManager.Instance.StartCase(testCase);
            Debug.Log($"[TestCaseStarter] Test case started: {caseName}");
        }
        else
        {
            Debug.LogError("[TestCaseStarter] CaseManager not found! Make sure CaseManager exists in the scene.");
        }
    }

    [ContextMenu("Debug: Complete Test Case")]
    private void CompleteTestCase()
    {
        if (CaseManager.Instance != null && CaseManager.Instance.CurrentCase != null)
        {
            CaseManager.Instance.CompleteCase(CaseResolution.JusticeServed);
            Debug.Log("[TestCaseStarter] Test case completed!");
        }
    }
}
