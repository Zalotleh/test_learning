using UnityEngine;

/// <summary>
/// Interface for all interactable objects in the game
/// Implement this on any object the player should be able to interact with
/// </summary>
public interface IInteractable
{
    /// <summary>
    /// Called when the player looks at this object
    /// </summary>
    void OnLookAt();

    /// <summary>
    /// Called when the player looks away from this object
    /// </summary>
    void OnLookAway();

    /// <summary>
    /// Called when the player interacts with this object (presses E)
    /// </summary>
    /// <param name="player">The player GameObject</param>
    void Interact(GameObject player);

    /// <summary>
    /// The name displayed when looking at this object
    /// </summary>
    string GetInteractionPrompt();
}
