using Behavioral.Automation.Bindings.UI.Abstractions;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;
using Microsoft.Playwright;

namespace Behavioral.Automation.Interface.Playwright.Services;

public interface ILocatorProvider
{
    public ILocator GetLocator(ElementSelector selector);
}