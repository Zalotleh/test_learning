using UnityEngine;
using UnityEngine.Events;

/// <summary>
/// Interactive document that can be picked up and read
/// (letters, notes, files, etc.)
/// </summary>
public class InteractableDocument : MonoBehaviour, IInteractable
{
    [Header("Document Content")]
    [SerializeField] private string documentID = "DOC_001";
    [SerializeField] private string documentTitle = "Untitled Document";
    [TextArea(5, 15)]
    [SerializeField] private string documentText = "Document content goes here...";
    [SerializeField] private Sprite documentImage; // Optional: Image of the document

    [Header("Document Type")]
    [SerializeField] private DocumentType docType = DocumentType.Note;

    [Header("Collection Settings")]
    [SerializeField] private bool addToInventory = true; // Add to inventory when read
    [SerializeField] private bool disappearWhenCollected = false; // Remove from world

    [Header("Visual")]
    [SerializeField] private GameObject highlightEffect;
    [SerializeField] private Color highlightColor = Color.yellow;

    [Header("Audio")]
    [SerializeField] private AudioClip pickupSound;

    [Header("Events")]
    [SerializeField] private UnityEvent onDocumentRead;

    private bool hasBeenRead = false;
    private Renderer objectRenderer;
    private Color originalColor;
    private AudioSource audioSource;

    private void Awake()
    {
        objectRenderer = GetComponent<Renderer>();
        if (objectRenderer != null)
        {
            originalColor = objectRenderer.material.color;
        }

        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }
    }

    public void OnLookAt()
    {
        if (hasBeenRead && disappearWhenCollected) return;

        // Highlight document
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
        if (hasBeenRead && disappearWhenCollected)
        {
            Debug.Log("[Document] Already collected.");
            return;
        }

        ReadDocument();
    }

    public string GetInteractionPrompt()
    {
        if (hasBeenRead)
        {
            return $"Re-read {documentTitle}";
        }
        else
        {
            return $"Read {documentTitle}";
        }
    }

    private void ReadDocument()
    {
        hasBeenRead = true;

        // Play pickup sound
        if (pickupSound != null)
        {
            audioSource.PlayOneShot(pickupSound);
        }

        Debug.Log($"[Document] Reading: {documentTitle}");
        Debug.Log($"Content: {documentText}");

        // TODO: Open document reading UI
        // For now, just log content

        // Add to inventory/journal
        if (addToInventory)
        {
            // TODO: Add to document collection system
            Debug.Log($"[Document] Added to journal: {documentTitle}");
        }

        // Trigger event
        onDocumentRead?.Invoke();

        // Handle disappearing
        if (disappearWhenCollected)
        {
            gameObject.SetActive(false);
        }
    }

    // Public getters
    public string DocumentID => documentID;
    public string DocumentTitle => documentTitle;
    public string DocumentText => documentText;
    public DocumentType DocType => docType;
    public bool HasBeenRead => hasBeenRead;
}

/// <summary>
/// Types of documents
/// </summary>
public enum DocumentType
{
    Note,
    Letter,
    Report,
    File,
    Newspaper,
    Photo,
    Evidence,
    Journal,
    Other
}
