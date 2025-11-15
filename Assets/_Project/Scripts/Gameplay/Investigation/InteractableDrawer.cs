using UnityEngine;
using System.Collections.Generic;

/// <summary>
/// Interactive drawer that can be opened to reveal contents
/// </summary>
public class InteractableDrawer : MonoBehaviour, IInteractable
{
    [Header("Drawer Settings")]
    [SerializeField] private bool isLocked = false;
    [SerializeField] private bool startsOpen = false;
    [SerializeField] private string requiredKey = "";

    [Header("Animation")]
    [SerializeField] private float openDistance = 0.5f; // How far drawer slides out
    [SerializeField] private float openSpeed = 3f;

    [Header("Contents")]
    [SerializeField] private List<GameObject> contents = new List<GameObject>(); // Objects inside drawer
    [SerializeField] private bool hideContentsWhenClosed = true;

    [Header("Audio")]
    [SerializeField] private AudioClip openSound;
    [SerializeField] private AudioClip closeSound;
    [SerializeField] private AudioClip lockedSound;

    [Header("Interaction Text")]
    [SerializeField] private string openPrompt = "Open Drawer";
    [SerializeField] private string closePrompt = "Close Drawer";
    [SerializeField] private string lockedPrompt = "Drawer is locked";
    [SerializeField] private string emptyPrompt = "Empty drawer";

    private bool isOpen;
    private bool isMoving;
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

        closedPosition = transform.localPosition;
        openPosition = closedPosition + (transform.forward * openDistance);

        // Set initial state
        if (startsOpen)
        {
            isOpen = true;
            transform.localPosition = openPosition;
        }
        else
        {
            if (hideContentsWhenClosed)
            {
                HideContents();
            }
        }
    }

    private void Update()
    {
        if (isMoving)
        {
            AnimateDrawer();
        }
    }

    public void OnLookAt()
    {
        // Visual feedback
    }

    public void OnLookAway()
    {
        // Remove highlight
    }

    public void Interact(GameObject player)
    {
        if (isMoving) return;

        if (isLocked)
        {
            if (!string.IsNullOrEmpty(requiredKey) && HasKey(player, requiredKey))
            {
                UnlockDrawer();
            }
            else
            {
                PlayLockedSound();
                Debug.Log("[Drawer] This drawer is locked.");
                return;
            }
        }

        if (isOpen)
        {
            CloseDrawer();
        }
        else
        {
            OpenDrawer();
        }
    }

    public string GetInteractionPrompt()
    {
        if (isLocked)
            return lockedPrompt;

        if (isOpen && contents.Count == 0)
            return emptyPrompt;

        return isOpen ? closePrompt : openPrompt;
    }

    private void OpenDrawer()
    {
        isOpen = true;
        isMoving = true;

        if (openSound != null)
        {
            audioSource.PlayOneShot(openSound);
        }

        if (hideContentsWhenClosed)
        {
            ShowContents();
        }

        Debug.Log($"[Drawer] Opening drawer. Contains {contents.Count} items.");
    }

    private void CloseDrawer()
    {
        isOpen = false;
        isMoving = true;

        if (closeSound != null)
        {
            audioSource.PlayOneShot(closeSound);
        }

        if (hideContentsWhenClosed)
        {
            HideContents();
        }

        Debug.Log("[Drawer] Closing drawer.");
    }

    private void UnlockDrawer()
    {
        isLocked = false;
        Debug.Log("[Drawer] Drawer unlocked!");
    }

    private void AnimateDrawer()
    {
        Vector3 targetPosition = isOpen ? openPosition : closedPosition;
        transform.localPosition = Vector3.Lerp(transform.localPosition, targetPosition, Time.deltaTime * openSpeed);

        if (Vector3.Distance(transform.localPosition, targetPosition) < 0.01f)
        {
            transform.localPosition = targetPosition;
            isMoving = false;
        }
    }

    private void ShowContents()
    {
        foreach (GameObject item in contents)
        {
            if (item != null)
            {
                item.SetActive(true);
            }
        }
    }

    private void HideContents()
    {
        foreach (GameObject item in contents)
        {
            if (item != null)
            {
                item.SetActive(false);
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
        // TODO: Implement inventory check
        return false;
    }

    // Public methods
    public void AddContent(GameObject item)
    {
        if (!contents.Contains(item))
        {
            contents.Add(item);

            if (!isOpen && hideContentsWhenClosed)
            {
                item.SetActive(false);
            }
        }
    }

    public void RemoveContent(GameObject item)
    {
        contents.Remove(item);
    }

    public void Lock()
    {
        isLocked = true;
    }

    public void Unlock()
    {
        isLocked = false;
    }

    public bool IsLocked => isLocked;
    public bool IsOpen => isOpen;
    public int ContentCount => contents.Count;
}
