using Behavioral.Automation.Bindings.UI.Interfaces;
using Behavioral.Automation.Interface.Playwright.WebElements;
using Behavioral.Automation.Playwright.WebElementsWrappers;

namespace Behavioral.Automation.Interface.Playwright.WebElementsWrappers;

public class InputElement: WebElement, IInputWebElement
{

    public async Task TypeAsync(string text)
    {
        await Locator.FillAsync(text);
    }
}