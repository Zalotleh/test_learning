using UnityEngine;

/// <summary>
/// Handles player interaction with objects in the world
/// Uses raycasting from camera to detect interactable objects
/// </summary>
public class PlayerInteraction : MonoBehaviour
{
    [Header("Interaction Settings")]
    [SerializeField] private float interactionRange = 3f;
    [SerializeField] private LayerMask interactableLayer;
    [SerializeField] private KeyCode interactKey = KeyCode.E;

    [Header("References")]
    [SerializeField] private Camera playerCamera;

    [Header("UI References (assign in inspector)")]
    [SerializeField] private GameObject interactionPrompt; // UI element showing "Press E to interact"

    [Header("Debug")]
    [SerializeField] private bool showDebugRays = true;

    private IInteractable currentInteractable;

    private void Awake()
    {
        if (playerCamera == null)
        {
            playerCamera = GetComponentInChildren<Camera>();
        }
    }

    private void Update()
    {
        CheckForInteractable();
        HandleInteractionInput();
    }

    /// <summary>
    /// Raycast from camera to check for interactable objects
    /// </summary>
    private void CheckForInteractable()
    {
        Ray ray = new Ray(playerCamera.transform.position, playerCamera.transform.forward);
        RaycastHit hit;

        if (showDebugRays)
        {
            Debug.DrawRay(ray.origin, ray.direction * interactionRange, Color.yellow);
        }

        if (Physics.Raycast(ray, out hit, interactionRange, interactableLayer))
        {
            IInteractable interactable = hit.collider.GetComponent<IInteractable>();

            if (interactable != null)
            {
                // New interactable found
                if (currentInteractable != interactable)
                {
                    // Clear previous
                    if (currentInteractable != null)
                    {
                        currentInteractable.OnLookAway();
                    }

                    // Set new
                    currentInteractable = interactable;
                    currentInteractable.OnLookAt();
                    ShowInteractionPrompt(true);
                }
            }
            else
            {
                ClearInteractable();
            }
        }
        else
        {
            ClearInteractable();
        }
    }

    /// <summary>
    /// Handle interaction input
    /// </summary>
    private void HandleInteractionInput()
    {
        if (Input.GetKeyDown(interactKey) && currentInteractable != null)
        {
            currentInteractable.Interact(gameObject);
        }
    }

    /// <summary>
    /// Clear current interactable
    /// </summary>
    private void ClearInteractable()
    {
        if (currentInteractable != null)
        {
            currentInteractable.OnLookAway();
            currentInteractable = null;
            ShowInteractionPrompt(false);
        }
    }

    /// <summary>
    /// Show or hide interaction prompt UI
    /// </summary>
    private void ShowInteractionPrompt(bool show)
    {
        if (interactionPrompt != null)
        {
            interactionPrompt.SetActive(show);
        }
    }

    private void OnDrawGizmos()
    {
        if (playerCamera != null && showDebugRays)
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawRay(playerCamera.transform.position, playerCamera.transform.forward * interactionRange);
        }
    }
}
