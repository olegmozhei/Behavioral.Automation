using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Abstractions;
using Behavioral.Automation.Configs;
using Behavioral.Automation.Interface.Playwright.Configs;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;
using Microsoft.Playwright;

namespace Behavioral.Automation.Interface.Playwright.Services;

public class LocatorProvider : ILocatorProvider
{
    private readonly WebElementStorageService _webElementStorageService;
    private readonly WebContext _webContext;
    private readonly string _searchAttribute = ConfigManager.GetConfig<Config>().SearchAttribute;

    public LocatorProvider(WebElementStorageService webElementStorageService, WebContext webContext)
    {
        _webElementStorageService = webElementStorageService;
        _webContext = webContext;
    }

    public ILocator GetLocator(ElementSelector selector)
    {
        if (selector.IdSelector != null)
        {
            return ((Microsoft.Playwright.IPage) _webContext.Page).Locator($"//*[@{_searchAttribute}='{selector.IdSelector}']");
        }

        return selector.XpathSelector != null ? ((Microsoft.Playwright.IPage) _webContext.Page).Locator(selector.XpathSelector) : 
            throw new NullReferenceException("Element was not found or web context is null");
    }
}