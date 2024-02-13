using Behavioral.Automation.Bindings.UI.Interfaces;
using Behavioral.Automation.Interface.Playwright.WebElements;
using Behavioral.Automation.Playwright.WebElementsWrappers;
using Microsoft.Playwright;

namespace Behavioral.Automation.Interface.Playwright.WebElementsWrappers;

public class LabelElement: WebElement, ILabelElement
{
    public async Task ShouldHaveTextAsync(string text)
    {
        await Assertions.Expect(Locator).ToHaveTextAsync(text);
    }

    public async Task ShouldBecomeVisibleAsync()
    {
        await Assertions.Expect(Locator).ToBeVisibleAsync();
    }
}