using Behavioral.Automation.Bindings.UI.Interfaces;
using Microsoft.Playwright;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

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