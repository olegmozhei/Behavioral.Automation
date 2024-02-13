namespace Behavioral.Automation.Bindings.UI.Interfaces;

public interface IWebElement
{
    public WebContext WebContext { get; set; }
    public string Selector { get; set; }
    public string Description { get; set; }
}