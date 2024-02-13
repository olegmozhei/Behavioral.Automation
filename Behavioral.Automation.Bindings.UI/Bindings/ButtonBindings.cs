using Behavioral.Automation.Bindings.UI.Interfaces;
using TechTalk.SpecFlow;

namespace Behavioral.Automation.Bindings.UI.Bindings;

[Binding]
public class ButtonBindings
{

    private readonly WebContext _webContext;

    public ButtonBindings(WebContext webContext)
    {
        _webContext = webContext;
    }

    [Given(@"user clicked on ""(.+?)"" button")]
    [When(@"user clicks on ""(.+?)"" button")]
    public async Task ClickOnButton(IButtonElement element)
    {
        await element.ClickAsync();
    }
    
    [Then(@"""(.+?)"" button should become visible")]
    public async Task ButtonShouldBecomeVisible(IButtonElement element)
    {
        await element.ShouldBecomeVisibleAsync();
    }
    
    [When(@"user uploads ""(.*)"" after clicking on ""(.*)"" button")]
    public async Task WhenUserUploadsAfterClickingOnButton(string filePath, IButtonElement button)
    {
        var fileChooser = await _webContext.Page.RunAndWaitForFileChooserAsync(async () =>
        {
            await button.ClickAsync();
        });
        await fileChooser.UploadFilesAsync(filePath);
    }
}