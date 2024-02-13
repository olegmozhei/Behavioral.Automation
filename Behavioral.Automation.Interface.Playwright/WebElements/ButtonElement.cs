using Behavioral.Automation.Bindings.UI.Interfaces;
using Behavioral.Automation.Interface.Playwright.WebElements;
using Behavioral.Automation.Playwright.WebElementsWrappers;
using Microsoft.Playwright;

namespace Behavioral.Automation.Interface.Playwright.WebElementsWrappers;

public class ButtonElement: WebElement, IButtonElement
{

    public async Task ClickAsync()
    {
        await Locator.ClickAsync();
    }

    public async Task ShouldBecomeVisibleAsync()
    {
        await Assertions.Expect(Locator).ToBeVisibleAsync(new LocatorAssertionsToBeVisibleOptions() {Timeout = 50000});
    }
}