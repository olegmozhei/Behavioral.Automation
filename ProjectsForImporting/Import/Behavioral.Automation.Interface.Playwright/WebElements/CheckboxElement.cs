using Behavioral.Automation.Bindings.UI.Interfaces;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

public class CheckboxElement : WebElement, ICheckboxElement
{
    public async Task ClickAsync()
    {
        await Locator.EvaluateAsync("node => node.removeAttribute('checked')");
    }
}