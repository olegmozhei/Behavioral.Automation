namespace Behavioral.Automation.Bindings.UI.Interfaces;

public interface IWebElementStorageService
{
    T Get<T>(string locatorKey);
}