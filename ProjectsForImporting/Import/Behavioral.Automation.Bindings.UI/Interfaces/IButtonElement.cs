namespace Behavioral.Automation.Bindings.UI.Interfaces;

public interface IButtonElement
{
    public Task ClickAsync();
    public Task ShouldBecomeVisibleAsync();
}