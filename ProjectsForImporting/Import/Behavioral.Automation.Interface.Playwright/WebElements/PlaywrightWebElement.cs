using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Abstractions;
using Behavioral.Automation.Interface.Playwright.WebContextElements;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;
using Microsoft.Playwright;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

public abstract class PlaywrightWebElement : IWebElement
{
    public WebContext WebContext { get; }
    public ElementSelector ElementSelector { get; }
    public string? Description { get; set; }

    protected PlaywrightWebElement(WebContext webContext, ElementSelector baseSelector)
    {
        ElementSelector = baseSelector;
        WebContext = webContext;
    }

    public ILocator Locator
    {
        get
        {
            if (WebContext is null) throw new NullReferenceException("Please set web context.");
            // Locator for Playwright can be retrieved from Page element:
            return ((Page) WebContext.Page).GetPlaywrightPage().Locator(ElementSelector.XpathSelector);
        }
    }
}