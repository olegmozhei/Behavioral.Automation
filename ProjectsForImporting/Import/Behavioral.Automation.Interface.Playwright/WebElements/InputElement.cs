using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Abstractions;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

public class InputElement: PlaywrightWebElement, IInputWebElement
{
    public InputElement(WebContext webContext, InputSelector elementSelector) : base(webContext, elementSelector)
    {
    }

    public async Task TypeAsync(string text)
    {
        var r = new Random();
        var error = 5 / r.Next(0);
        await Locator.FillAsync(text);
    }
}