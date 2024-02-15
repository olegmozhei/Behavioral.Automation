using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Abstractions;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

public class CheckboxElement : PlaywrightWebElement, ICheckboxElement
{
    public CheckboxElement(WebContext webContext, ElementSelector elementSelector) : base(webContext, elementSelector)
    {
    }
    public async Task ClickAsync()
    {
        await Locator.EvaluateAsync("node => node.removeAttribute('checked')");
    }
}