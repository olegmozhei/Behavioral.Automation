using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Interfaces;
using Behavioral.Automation.Configs.utils;
using Behavioral.Automation.Interface.Playwright.Services.ElementSelectors;

namespace Behavioral.Automation.Interface.Playwright.Services;

public class LocatorStorageService : IWebElementStorageService
{
    private readonly WebContext _webContext;

    public LocatorStorageService(WebContext webContext)
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

        ElementSelector elementSelector = null;
        var camelCaseElementName = elementName.ToCamelCase();

        foreach (var pageType in types)
        {
            var pageTemp = Activator.CreateInstance(pageType);
            var temp = (ElementSelector) pageType.GetField(camelCaseElementName)?.GetValue(pageTemp)!;
            if (elementSelector != null && temp != null)
                throw new Exception($"found the same selector '{elementName}' in different classes");
            elementSelector ??= temp;
        }

        if (elementSelector == null) throw new Exception($"'{elementName}' transformed to '{camelCaseElementName}' selectors not found.");

        // Instantiate new WebElement
        
        // Select proper realisation for element according to registered class in DI framework:
        // Get selectors and instantiate new class
        
        // public ElementSelector DemoLabel = new() {IdSelector = "label-simple-text"};
        
        //element.WebContext = _webContext;
        //element.Description = elementName;
        
        return (T) elementSelector;
    }
}