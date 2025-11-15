using UnityEngine;

/// <summary>
/// Example interactable evidence item that can be collected
/// </summary>
public class EvidenceItem : MonoBehaviour, IInteractable
{
    [Header("Evidence Data")]
    [SerializeField] private string evidenceID;
    [SerializeField] private string evidenceName;
    [SerializeField] private string description;
    [SerializeField] private Sprite icon;

    [Header("Visual Feedback")]
    [SerializeField] private GameObject highlightEffect; // Optional highlight visual
    [SerializeField] private Color highlightColor = Color.yellow;

    private Renderer objectRenderer;
    private Color originalColor;
    private bool isCollected = false;

    private void Awake()
    {
        objectRenderer = GetComponent<Renderer>();
        if (objectRenderer != null)
        {
            originalColor = objectRenderer.material.color;
        }
    }

    public void OnLookAt()
    {
        if (isCollected) return;

        // Highlight the object
        if (highlightEffect != null)
        {
            highlightEffect.SetActive(true);
        }
        else if (objectRenderer != null)
        {
            objectRenderer.material.color = highlightColor;
        }
    }

    public void OnLookAway()
    {
        // Remove highlight
        if (highlightEffect != null)
        {
            highlightEffect.SetActive(false);
        }
        else if (objectRenderer != null)
        {
            objectRenderer.material.color = originalColor;
        }
    }

    public void Interact(GameObject player)
    {
        if (isCollected)
        {
            Debug.Log($"Evidence '{evidenceName}' already collected.");
            return;
        }

        CollectEvidence();
    }

    public string GetInteractionPrompt()
    {
        return isCollected ? $"{evidenceName} (Collected)" : $"Collect {evidenceName}";
    }

    private void CollectEvidence()
    {
        // Create Evidence object
        Evidence evidence = new Evidence
        {
            evidenceID = evidenceID,
            name = evidenceName,
            description = description,
            icon = icon,
            isExamined = false
        };

        // Add to Case Manager
        if (CaseManager.Instance != null)
        {
            CaseManager.Instance.CollectEvidence(evidence);
        }

        isCollected = true;

        // Visual feedback
        Debug.Log($"[Evidence] Collected: {evidenceName}");

        // Hide or disable the object
        gameObject.SetActive(false); // Or use a collection animation
    }
}
