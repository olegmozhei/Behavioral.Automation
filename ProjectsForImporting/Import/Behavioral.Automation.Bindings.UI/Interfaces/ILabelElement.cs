namespace Behavioral.Automation.Bindings.UI.Interfaces;

public interface ILabelElement
{
    public Task ShouldHaveTextAsync(string text);
    public Task ShouldBecomeVisibleAsync();
}