using TechTalk.SpecFlow;

namespace Behavioral.Automation.Bindings.UI.Abstractions;

public interface ITableWrapper
{
    public Task ShouldBecomeVisibleAsync();
    public Task ShouldBecomeVisibleAsync(int delay);
    public Task ShouldContainTable(Table expectedTable);
}