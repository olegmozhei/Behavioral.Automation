using Behavioral.Automation.Bindings.UI.Abstractions;

namespace Behavioral.Automation.Interface.Playwright.WebElementSelectors;

public class DropdownSelector : ElementSelector
{
    public ElementSelector Selector { get; set; }
    
    public ElementSelector MenuSelector { get; set; }
    public ElementSelector ItemSelector { get; set; }
    public ElementSelector ItemSelectionSelector { get; set; }
}