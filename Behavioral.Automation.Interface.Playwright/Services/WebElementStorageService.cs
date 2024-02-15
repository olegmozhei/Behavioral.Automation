using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Interfaces;
using Behavioral.Automation.Configs.utils;
using Behavioral.Automation.Interface.Playwright.Services.ElementSelectors;

namespace Behavioral.Automation.Interface.Playwright.Services;

public class WebElementStorageService : IWebElementStorageService
{
    private readonly WebContext _webContext;

    public WebElementStorageService(WebContext webContext)
    {
        _webContext = webContext;
    }

    //TODO: Impl factory
    public T Get<T>(string elementName)
    {
        var type = typeof(ISelectorStorage);
        var types = AppDomain.CurrentDomain.GetAssemblies()
            .SelectMany(s => s.GetTypes())
            .Where(p => type.IsAssignableFrom(p) && p.IsClass);

        ElementSelector element = null;
        var camelCaseElementName = elementName.ToCamelCase();

        foreach (var pageType in types)
        {
            var pageTemp = Activator.CreateInstance(pageType);
            var temp = (ElementSelector) pageType.GetField(camelCaseElementName)?.GetValue(pageTemp)!;
            if (element != null && temp != null)
                throw new Exception($"found the same selector '{elementName}' in different classes");
            element ??= temp;
        }

        if (element == null) throw new Exception($"'{elementName}' transformed to '{camelCaseElementName}' selectors not found.");

        // Select proper realisation for element according to registered class in DI framework:
        // Get selectors and instantiate new class
        
        
        element.WebContext = _webContext;
        element.Description = elementName;
        
        return (T) element;
    }
}