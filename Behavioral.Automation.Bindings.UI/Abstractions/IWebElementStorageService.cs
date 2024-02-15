namespace Behavioral.Automation.Bindings.UI.Abstractions;

public interface IWebElementStorageService
{
    T Get<T>(string locatorKey);
}