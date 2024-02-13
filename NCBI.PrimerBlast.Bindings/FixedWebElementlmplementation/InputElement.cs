using Behavioral.Automation.Bindings.UI.Interfaces;
using Behavioral.Automation.Interface.Playwright.WebElements;

namespace NCBI.PrimerBlast.Bindings.FixedWebElementlmplementation;

public class FixedInputElement: WebElement, IInputWebElement
{

    public async Task TypeAsync(string text)
    {
        await Locator.FillAsync(text);
    }
}