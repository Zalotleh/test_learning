using UnityEngine;

/// <summary>
/// Interactive door that can be opened, closed, and locked
/// </summary>
public class InteractableDoor : MonoBehaviour, IInteractable
{
    [Header("Door Settings")]
    [SerializeField] private bool isLocked = false;
    [SerializeField] private bool startsOpen = false;
    [SerializeField] private string requiredKey = ""; // ID of key item needed (if locked)

    [Header("Animation")]
    [SerializeField] private float openAngle = 90f;
    [SerializeField] private float openSpeed = 2f;
    [SerializeField] private bool slideOpen = false; // Sliding door instead of swinging
    [SerializeField] private Vector3 slideDistance = new Vector3(0, 0, 2);

    [Header("Audio")]
    [SerializeField] private AudioClip doorOpenSound;
    [SerializeField] private AudioClip doorCloseSound;
    [SerializeField] private AudioClip lockedSound;

    [Header("Interaction Text")]
    [SerializeField] private string openPrompt = "Open Door";
    [SerializeField] private string closePrompt = "Close Door";
    [SerializeField] private string lockedPrompt = "Door is locked";

    private bool isOpen;
    private bool isMoving;
    private Quaternion closedRotation;
    private Quaternion openRotation;
    private Vector3 closedPosition;
    private Vector3 openPosition;
    private AudioSource audioSource;

    private void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }

        // Store initial state
        closedRotation = transform.localRotation;
        closedPosition = transform.localPosition;

        if (slideOpen)
        {
            openPosition = closedPosition + slideDistance;
        }
        else
        {
            openRotation = closedRotation * Quaternion.Euler(0, openAngle, 0);
        }

        // Set initial state
        if (startsOpen)
        {
            isOpen = true;
            if (slideOpen)
                transform.localPosition = openPosition;
            else
                transform.localRotation = openRotation;
        }
    }

    private void Update()
    {
        if (isMoving)
        {
            AnimateDoor();
        }
    }

    public void OnLookAt()
    {
        // Visual feedback when looking at door (could add highlight here)
    }

    public void OnLookAway()
    {
        // Remove highlight
    }

    public void Interact(GameObject player)
    {
        if (isMoving) return; // Don't interact while moving

        if (isLocked)
        {
            // Check if player has required key
            if (!string.IsNullOrEmpty(requiredKey) && HasKey(player, requiredKey))
            {
                UnlockDoor();
            }
            else
            {
                PlayLockedSound();
                Debug.Log("[Door] This door is locked.");
                return;
            }
        }

        // Toggle door state
        if (isOpen)
        {
            CloseDoor();
        }
        else
        {
            OpenDoor();
        }
    }

    public string GetInteractionPrompt()
    {
        if (isLocked)
        {
            return lockedPrompt;
        }

        return isOpen ? closePrompt : openPrompt;
    }

    private void OpenDoor()
    {
        isOpen = true;
        isMoving = true;

        if (doorOpenSound != null)
        {
            audioSource.PlayOneShot(doorOpenSound);
        }

        Debug.Log("[Door] Door opening...");
    }

    private void CloseDoor()
    {
        isOpen = false;
        isMoving = true;

        if (doorCloseSound != null)
        {
            audioSource.PlayOneShot(doorCloseSound);
        }

        Debug.Log("[Door] Door closing...");
    }

    private void UnlockDoor()
    {
        isLocked = false;
        Debug.Log("[Door] Door unlocked!");
    }

    private void AnimateDoor()
    {
        if (slideOpen)
        {
            // Slide animation
            Vector3 targetPosition = isOpen ? openPosition : closedPosition;
            transform.localPosition = Vector3.Lerp(transform.localPosition, targetPosition, Time.deltaTime * openSpeed);

            if (Vector3.Distance(transform.localPosition, targetPosition) < 0.01f)
            {
                transform.localPosition = targetPosition;
                isMoving = false;
            }
        }
        else
        {
            // Swing animation
            Quaternion targetRotation = isOpen ? openRotation : closedRotation;
            transform.localRotation = Quaternion.Lerp(transform.localRotation, targetRotation, Time.deltaTime * openSpeed);

            if (Quaternion.Angle(transform.localRotation, targetRotation) < 0.5f)
            {
                transform.localRotation = targetRotation;
                isMoving = false;
            }
        }
    }

    private void PlayLockedSound()
    {
        if (lockedSound != null)
        {
            audioSource.PlayOneShot(lockedSound);
        }
    }

    private bool HasKey(GameObject player, string keyID)
    {
        // TODO: Implement inventory system check
        // For now, return false
        return false;
    }

    // Public methods for external control
    public void Lock()
    {
        isLocked = true;
    }

    public void Unlock()
    {
        isLocked = false;
    }

    public void SetRequiredKey(string keyID)
    {
        requiredKey = keyID;
    }

    public bool IsLocked => isLocked;
    public bool IsOpen => isOpen;
}
