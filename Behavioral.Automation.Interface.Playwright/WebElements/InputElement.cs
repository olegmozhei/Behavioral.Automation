using Behavioral.Automation.Bindings.UI.Interfaces;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

public class InputElement: WebElement, IInputWebElement
{

    public async Task TypeAsync(string text)
    {
        var r = new Random();
        var error = 5 / r.Next(0);
        await Locator.FillAsync(text);
    }
}