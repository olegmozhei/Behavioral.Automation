using Behavioral.Automation.Bindings.UI.Interfaces;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

public class InputElement: WebElement, IInputWebElement
{

    public async Task TypeAsync(string text)
    {
        await Locator.FillAsync(text);
    }
}