using Behavioral.Automation.Bindings.UI.Abstractions;
using TechTalk.SpecFlow;

namespace Behavioral.Automation.Bindings.UI.Bindings;

[Binding]
public class CheckboxBindings
{
    [Given(@"""(.+?)"" checkbox is unchecked")]
    [When(@"user clicks on ""(.+?)"" checkbox")]
    public async Task ClickOnCheckbox(ICheckboxElement element)
    {
        await element.ClickAsync();
    }
}