using Behavioral.Automation.Bindings.UI.Interfaces;
using Behavioral.Automation.Interface.Playwright.WebElements;
using Behavioral.Automation.Playwright.WebElementsWrappers;

namespace Behavioral.Automation.Interface.Playwright.WebElementsWrappers;

public class CheckboxElement : WebElement, ICheckboxElement
{
    public async Task ClickAsync()
    {
        await Locator.EvaluateAsync("node => node.removeAttribute('checked')");
    }
}