using Behavioral.Automation.Bindings.UI.Abstractions;

namespace Behavioral.Automation.Interface.Playwright.WebElementSelectors;

public class DropdownSelector : ElementSelector
{
    public ElementSelector BaseElementSelector { get; set; }
    
    public ElementSelector ItemSelector { get; set; }
}