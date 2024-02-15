using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Abstractions;
using Behavioral.Automation.Configs.utils;
using Behavioral.Automation.Interface.Playwright.WebElements;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;
using BoDi;

namespace Behavioral.Automation.Interface.Playwright.Services;

public class WebElementStorageService : IWebElementStorageService
{
    private readonly WebContext _webContext;
    private readonly IObjectContainer _objectContainer;

    public WebElementStorageService(WebContext webContext, IObjectContainer objectContainer)
    {
        _webContext = webContext;
        _objectContainer = objectContainer;
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

        // Select proper realisation for element according to registered class in DI framework:
        var resolvedObject = _objectContainer.Resolve<T>();
        var classType = resolvedObject.GetType();

        var element = (IWebElement) Activator.CreateInstance(classType, _webContext, elementSelector);        
        element.Description = elementName;
        
        return (T) element;
    }
}