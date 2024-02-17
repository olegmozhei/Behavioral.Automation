using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Abstractions;
using Behavioral.Automation.Interface.Playwright.WebElements;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;

namespace NCBI.PrimerBlast.Bindings.FixedWebElementlmplementation;

public class FixedInputElement: PlaywrightWebElement, IInputWebElement
{
    public FixedInputElement(WebContext webContext, InputSelector elementSelector) : base(webContext, elementSelector)
    {
    }

    public async Task TypeAsync(string text)
    {
        await Locator.FillAsync(text);
    }
}