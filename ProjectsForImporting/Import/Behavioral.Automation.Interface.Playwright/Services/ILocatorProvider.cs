using Behavioral.Automation.Interface.Playwright.Services.ElementSelectors;
using Microsoft.Playwright;

namespace Behavioral.Automation.Interface.Playwright.Services;

public interface ILocatorProvider
{
    public ILocator GetLocator(ElementSelector selector);
}