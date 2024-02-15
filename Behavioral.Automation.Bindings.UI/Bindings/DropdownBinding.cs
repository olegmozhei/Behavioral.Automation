using Behavioral.Automation.Bindings.UI.Abstractions;
using TechTalk.SpecFlow;

namespace Behavioral.Automation.Bindings.UI.Bindings;

/// <summary>
/// Dropdown steps. Should be merged with collection of dropdown?
/// </summary>
[Binding]
public class DropdownBinding
{

    /// <type>Basic</type>
    [Given(@"user opened ""(.*)"" dropdown and selected ""(.*)"" in dropdown menu")]
    [When(@"user opens ""(.*)"" dropdown and selects ""(.*)"" in dropdown menu")]
    public async Task WhenUserSelectsInDropdownRegex(IDropdownElement element, string itemText)
    {
        await element.OpenDropdownAndSelectAsync(itemText);
    }
}