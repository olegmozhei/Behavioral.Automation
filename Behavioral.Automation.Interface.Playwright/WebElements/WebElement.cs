using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Interfaces;
using Microsoft.Playwright;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

public class WebElement : IWebElement
{
    public string Selector { get; set; }
    public string? Description { get; set; }

    public WebContext WebContext { get; set; }

    public ILocator Locator
    {
        get
        {
            if (WebContext is null) throw new NullReferenceException("Please set web context.");
            // Locator for Playwright can be retrieved from Page element:
            return ((Microsoft.Playwright.IPage) WebContext.Page).Locator(Selector);
        }
    }
}