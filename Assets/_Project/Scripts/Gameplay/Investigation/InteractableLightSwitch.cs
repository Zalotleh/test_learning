using UnityEngine;

/// <summary>
/// Simple light switch that toggles lights on/off
/// </summary>
public class InteractableLightSwitch : MonoBehaviour, IInteractable
{
    [Header("Light Settings")]
    [SerializeField] private Light[] controlledLights; // Array of lights this switch controls
    [SerializeField] private bool lightsStartOn = true;

    [Header("Visual Feedback")]
    [SerializeField] private GameObject switchHandle; // The physical switch object
    [SerializeField] private Vector3 onRotation = new Vector3(-45, 0, 0); // Switch rotation when on
    [SerializeField] private Vector3 offRotation = new Vector3(45, 0, 0); // Switch rotation when off

    [Header("Audio")]
    [SerializeField] private AudioClip switchSound;

    [Header("Interaction Text")]
    [SerializeField] private string onPrompt = "Turn lights off";
    [SerializeField] private string offPrompt = "Turn lights on";

    private bool lightsAreOn;
    private AudioSource audioSource;

    private void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }

        lightsAreOn = lightsStartOn;
        SetLights(lightsAreOn, immediate: true);
    }

    public void OnLookAt()
    {
        // Visual feedback when looking at switch
    }

    public void OnLookAway()
    {
        // Remove highlight
    }

    public void Interact(GameObject player)
    {
        ToggleLights();
    }

    public string GetInteractionPrompt()
    {
        return lightsAreOn ? onPrompt : offPrompt;
    }

    private void ToggleLights()
    {
        lightsAreOn = !lightsAreOn;
        SetLights(lightsAreOn);
        PlaySwitchSound();

        Debug.Log($"[Light Switch] Lights {(lightsAreOn ? "ON" : "OFF")}");
    }

    private void SetLights(bool on, bool immediate = false)
    {
        foreach (Light light in controlledLights)
        {
            if (light != null)
            {
                light.enabled = on;
            }
        }

        // Animate switch handle
        if (switchHandle != null)
        {
            switchHandle.transform.localEulerAngles = on ? onRotation : offRotation;
        }
    }

    private void PlaySwitchSound()
    {
        if (switchSound != null)
        {
            audioSource.PlayOneShot(switchSound);
        }
    }

    // Public methods
    public void TurnOn()
    {
        lightsAreOn = true;
        SetLights(true);
    }

    public void TurnOff()
    {
        lightsAreOn = false;
        SetLights(false);
    }

    public bool LightsAreOn => lightsAreOn;
}
