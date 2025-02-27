namespace Behavioral.Automation.Bindings.UI.Abstractions;

public interface IWebElement
{
    public WebContext WebContext { get; }
    public ElementSelector ElementSelector  { get; }
    public string? Description { get; set; }
}