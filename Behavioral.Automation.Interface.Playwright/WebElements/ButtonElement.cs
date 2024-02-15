using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Abstractions;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;
using Microsoft.Playwright;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

public class ButtonElement: PlaywrightWebElement, IButtonElement
{
    public ButtonElement(WebContext webContext, ElementSelector elementSelector) : base(webContext, elementSelector)
    {
    }

    public async Task ClickAsync()
    {
        await Locator.ClickAsync();
    }

    public async Task ShouldBecomeVisibleAsync()
    {
        await Assertions.Expect(Locator).ToBeVisibleAsync(new LocatorAssertionsToBeVisibleOptions() {Timeout = 50000});
    }
}