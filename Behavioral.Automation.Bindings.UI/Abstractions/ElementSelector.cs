namespace Behavioral.Automation.Bindings.UI.Abstractions;

public abstract class ElementSelector
{
    public string? IdSelector { get; set; }
    
    public string? XpathSelector { get; set; }
}