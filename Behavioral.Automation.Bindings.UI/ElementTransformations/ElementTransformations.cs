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
    public T GetElement<T>(string caption)
    {
        Console.WriteLine($"Starting transformation of {caption}");
        var element = _webElementStorageService.Get<T>(caption + " " + typeof(T).Name);
        return element;
    }
    
    [StepArgumentTransformation]
    public IInputWebElement GetElement(string caption)
    {
        Console.WriteLine($"Starting transformation of {caption}");
        var element = _webElementStorageService.Get<IInputWebElement>(caption + " " + nameof(IInputWebElement));
        return element;
    }
}