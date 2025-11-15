using UnityEngine;
using UnityEngine.Events;

/// <summary>
/// Interactive computer terminal that can be examined, require passwords, etc.
/// </summary>
public class InteractableComputer : MonoBehaviour, IInteractable
{
    [Header("Computer Settings")]
    [SerializeField] private bool isLocked = true;
    [SerializeField] private string password = "1234";
    [SerializeField] private bool passwordCaseSensitive = false;

    [Header("Screen Display")]
    [SerializeField] private Material screenMaterial; // Material for computer screen
    [SerializeField] private Texture2D lockedScreenTexture;
    [SerializeField] private Texture2D unlockedScreenTexture;
    [SerializeField] private GameObject screenObject; // The actual screen mesh

    [Header("Interaction Text")]
    [SerializeField] private string lockedPrompt = "Computer (Locked)";
    [SerializeField] private string unlockedPrompt = "Access Computer";
    [SerializeField] private string examinePrompt = "Examine Computer";

    [Header("Events")]
    [SerializeField] private UnityEvent onComputerUnlocked;
    [SerializeField] private UnityEvent onComputerAccessed;
    [SerializeField] private UnityEvent onFailedPasswordAttempt;

    [Header("Audio")]
    [SerializeField] private AudioClip keyboardSound;
    [SerializeField] private AudioClip unlockSound;
    [SerializeField] private AudioClip errorSound;
    [SerializeField] private AudioClip bootupSound;

    private AudioSource audioSource;
    private int failedAttempts = 0;
    private bool hasBeenAccessed = false;

    private void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }

        UpdateScreenDisplay();
    }

    public void OnLookAt()
    {
        // Visual feedback when looking at computer
        // Could add screen glow here
    }

    public void OnLookAway()
    {
        // Remove highlight
    }

    public void Interact(GameObject player)
    {
        if (isLocked)
        {
            // TODO: Open password entry UI
            // For now, just log
            Debug.Log("[Computer] Password required. Hint: Try using the puzzle system.");
            PlayErrorSound();

            // Temporary: Auto-unlock for testing
            // Remove this in production
            #if UNITY_EDITOR
            Debug.Log($"[DEBUG] Password is: {password}");
            #endif
        }
        else
        {
            AccessComputer();
        }
    }

    public string GetInteractionPrompt()
    {
        if (isLocked)
            return lockedPrompt;
        else if (hasBeenAccessed)
            return examinePrompt;
        else
            return unlockedPrompt;
    }

    /// <summary>
    /// Attempt to unlock computer with password
    /// </summary>
    public bool TryPassword(string attemptedPassword)
    {
        string comparePassword = passwordCaseSensitive ? password : password.ToLower();
        string compareAttempt = passwordCaseSensitive ? attemptedPassword : attemptedPassword.ToLower();

        if (comparePassword == compareAttempt)
        {
            UnlockComputer();
            return true;
        }
        else
        {
            failedAttempts++;
            PlayErrorSound();
            onFailedPasswordAttempt?.Invoke();

            Debug.Log($"[Computer] Incorrect password. Attempts: {failedAttempts}");
            return false;
        }
    }

    private void UnlockComputer()
    {
        isLocked = false;
        UpdateScreenDisplay();
        PlayUnlockSound();

        Debug.Log("[Computer] Access granted!");

        onComputerUnlocked?.Invoke();
    }

    private void AccessComputer()
    {
        hasBeenAccessed = true;

        PlayBootupSound();
        Debug.Log("[Computer] Accessing computer files...");

        onComputerAccessed?.Invoke();

        // TODO: Open computer file browser UI
        // For now, just trigger event
    }

    private void UpdateScreenDisplay()
    {
        if (screenObject != null && screenMaterial != null)
        {
            Renderer renderer = screenObject.GetComponent<Renderer>();
            if (renderer != null)
            {
                Material instanceMaterial = renderer.material;

                if (isLocked && lockedScreenTexture != null)
                {
                    instanceMaterial.mainTexture = lockedScreenTexture;
                }
                else if (!isLocked && unlockedScreenTexture != null)
                {
                    instanceMaterial.mainTexture = unlockedScreenTexture;
                }
            }
        }
    }

    private void PlayUnlockSound()
    {
        if (unlockSound != null)
        {
            audioSource.PlayOneShot(unlockSound);
        }
    }

    private void PlayErrorSound()
    {
        if (errorSound != null)
        {
            audioSource.PlayOneShot(errorSound);
        }
    }

    private void PlayBootupSound()
    {
        if (bootupSound != null)
        {
            audioSource.PlayOneShot(bootupSound);
        }
    }

    // Public methods for external control
    public void SetPassword(string newPassword)
    {
        password = newPassword;
    }

    public void Lock()
    {
        isLocked = true;
        UpdateScreenDisplay();
    }

    public void Unlock()
    {
        UnlockComputer();
    }

    public bool IsLocked => isLocked;
    public int FailedAttempts => failedAttempts;
}
