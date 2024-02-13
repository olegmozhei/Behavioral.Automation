using Behavioral.Automation.Bindings.UI.Interfaces;
using TechTalk.SpecFlow;

namespace Behavioral.Automation.Bindings.UI.ElementTransformations;

[Binding]
public class ElementTransformations
{
    private readonly IWebElementStorageService _webElementStorageService;

    public ElementTransformations(IWebElementStorageService webElementStorageService)
    {
        _webElementStorageService = webElementStorageService;
    }
    
    [StepArgumentTransformation]
    public T GetElement<T>(string caption) where T : class
    {
        var element = _webElementStorageService.Get<T>(caption + " " + typeof(T).Name);
        return element;
    }
}