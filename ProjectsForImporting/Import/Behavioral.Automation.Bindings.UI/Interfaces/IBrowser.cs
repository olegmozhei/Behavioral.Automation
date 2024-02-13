namespace Behavioral.Automation.Bindings.UI.Interfaces;

public interface IBrowser
{
    public Task<IPage> NewPageAsync();
    public Task CloseAsync();
}