using Behavioral.Automation.Configs;
using Behavioral.Automation.Interface.Playwright.Configs;
using Behavioral.Automation.Interface.Playwright.WebElements;
using Microsoft.Playwright;
using IFileChooser = Behavioral.Automation.Bindings.UI.Interfaces.IFileChooser;
using IPage = Behavioral.Automation.Bindings.UI.Interfaces.IPage;

namespace Behavioral.Automation.Interface.Playwright.WebContextElements;

public class Page: IPage
{
    private readonly Microsoft.Playwright.IPage _playwrightPage;
    
    
    public Page(Microsoft.Playwright.IPage playwrightPage)
    {
        _playwrightPage = playwrightPage;
    }
    
    public Task GotoAsync(string url)
    {
        return IsAbsoluteUrl(url) ? _playwrightPage.GotoAsync(url) : _playwrightPage.GotoAsync(ConfigManager.GetConfig<Config>().BaseUrl + url);
    }

    public Task GoToApplicationUrlAsync()
    {
        return _playwrightPage.GotoAsync(ConfigManager.GetConfig<Config>().BaseUrl,
            new PageGotoOptions { WaitUntil = WaitUntilState.NetworkIdle, Timeout = 300000 });
    }

    public Task ToHaveTitleAsync(string title)
    {
        return Assertions.Expect(_playwrightPage).ToHaveTitleAsync(title, new PageAssertionsToHaveTitleOptions() {Timeout = 60000});
    }

    public async Task<IFileChooser> RunAndWaitForFileChooserAsync(Func<Task> action)
    {
        var fileChooser = await _playwrightPage.RunAndWaitForFileChooserAsync(action);
        return new FileChooser(fileChooser);
    }

    public Task ScreenshotAsync(string path)
    {
        return _playwrightPage.ScreenshotAsync(new PageScreenshotOptions
        {
            Path = path
        });
    }

    private static bool IsAbsoluteUrl(string url)
    {
        return Uri.IsWellFormedUriString(url, UriKind.Absolute);
    }

    public Microsoft.Playwright.IPage GetPlaywrightPage()
    {
        return _playwrightPage;
    }
}