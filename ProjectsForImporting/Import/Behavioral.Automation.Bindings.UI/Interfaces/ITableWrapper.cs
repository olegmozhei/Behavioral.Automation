using TechTalk.SpecFlow;

namespace Behavioral.Automation.Bindings.UI.Interfaces;

public interface ITableWrapper
{
    public Task ShouldBecomeVisibleAsync();
    public Task ShouldBecomeVisibleAsync(int delay);
    public Task ShouldContainTable(Table expectedTable);
}