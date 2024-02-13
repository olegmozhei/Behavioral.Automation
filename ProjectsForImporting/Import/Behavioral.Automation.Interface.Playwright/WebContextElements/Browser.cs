using Behavioral.Automation.Bindings.UI.Interfaces;
using Microsoft.Playwright;
using IBrowser = Behavioral.Automation.Bindings.UI.Interfaces.IBrowser;
using IPage = Behavioral.Automation.Bindings.UI.Interfaces.IPage;

namespace Behavioral.Automation.Interface.Playwright.WebContextElements;

public class Browser : IBrowser
{
    public readonly Microsoft.Playwright.IBrowserContext browser;

    public Browser(IBrowserContext browser)
    {
        this.browser = browser;
    }

    public async Task<IPage> NewPageAsync()
    {
        var playwrightPage = await browser.NewPageAsync();
        var pageWrapper = new Page(playwrightPage);
        return pageWrapper;
    }

    public Task CloseAsync()
    {
        return browser.CloseAsync();
    }
}