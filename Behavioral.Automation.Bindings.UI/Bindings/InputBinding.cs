using Behavioral.Automation.Bindings.UI.Abstractions;
using TechTalk.SpecFlow;

namespace Behavioral.Automation.Bindings.UI.Bindings;

[Binding]
public class InputBinding
{


    [Given(@"user entered ""(.+?)"" into ""(.+?)"" input")]
    [When(@"user enters ""(.+?)"" into ""(.+?)"" input")]
    public async Task FillInput(string text, IInputWebElement element)
    {
        await element.TypeAsync(text);
    }
}