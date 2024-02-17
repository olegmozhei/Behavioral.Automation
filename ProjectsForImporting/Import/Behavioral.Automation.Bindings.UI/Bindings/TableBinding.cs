using Behavioral.Automation.Bindings.UI.Abstractions;
using TechTalk.SpecFlow;

namespace Behavioral.Automation.Bindings.UI.Bindings;

[Binding]
public class TableBinding
{

    [Then(@"""(.*)"" table should become visible$")]
    public async Task ThenTableShouldBecomeVisible(ITableWrapper table)
    {
        await table.ShouldBecomeVisibleAsync();
    }
    
    [Then(@"""(.*)"" table should become visible within ""(.*)"" seconds")]
    public async Task ThenTableShouldBecomeVisible(ITableWrapper table, int seconds)
    {
        await table.ShouldBecomeVisibleAsync(seconds);
    }

    [Then(@"""(.*)"" table should have the following rows:")]
    public async Task ThenTableShouldHaveTheFollowingRows(ITableWrapper actualTable, Table expectedTable)
    {
        await actualTable.ShouldContainTable(expectedTable);
    }
}