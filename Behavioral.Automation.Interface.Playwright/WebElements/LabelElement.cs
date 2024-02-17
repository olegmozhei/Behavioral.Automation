using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Abstractions;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;
using Microsoft.Playwright;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

public class LabelElement: PlaywrightWebElement, ILabelElement
{
    public LabelElement(WebContext webContext, LabelSelector elementSelector) : base(webContext, elementSelector)
    {
    }
    
    public async Task ShouldHaveTextAsync(string text)
    {
        await Assertions.Expect(Locator).ToHaveTextAsync(text);
    }

    public async Task ShouldBecomeVisibleAsync()
    {
        await Assertions.Expect(Locator).ToBeVisibleAsync();
    }
}