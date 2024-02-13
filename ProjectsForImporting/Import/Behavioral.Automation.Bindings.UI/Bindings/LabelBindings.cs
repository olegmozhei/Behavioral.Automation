using Behavioral.Automation.Bindings.UI.Interfaces;
using TechTalk.SpecFlow;

namespace Behavioral.Automation.Bindings.UI.Bindings;

[Binding]
public class LabelBindings
{
    [Then(@"label ""(.+?)"" should have ""(.+?)"" text")]
    public async Task CheckLabelText(ILabelElement element, string text)
    {
        await element.ShouldHaveTextAsync(text);
    }
    
    [Then(@"label ""(.+?)"" should become visible")]
    public async Task CheckLabelVisibility(ILabelElement element)
    {
        await element.ShouldBecomeVisibleAsync();
    }
}