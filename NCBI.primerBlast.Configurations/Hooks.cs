using Behavioral.Automation.Bindings.UI;
using Behavioral.Automation.Bindings.UI.Interfaces;
using Behavioral.Automation.Configs;
using Behavioral.Automation.Interface.Playwright.Services;
using Behavioral.Automation.Interface.Playwright.WebContextElements;
using Behavioral.Automation.Interface.Playwright.WebElements;
using BoDi;
using Microsoft.Playwright;
using NCBI.PrimerBlast.Bindings.FixedWebElementlmplementation;
using NCBI.PrimerBlast.Configurations.Configs;
using NUnit.Framework;
using TechTalk.SpecFlow;
using IBrowser = Microsoft.Playwright.IBrowser;

namespace NCBI.PrimerBlast.Configurations;

[Binding]
public class Hooks
{
    private readonly IObjectContainer _objectContainer;
    private readonly WebContext _webContext;
    private static IPlaywright? _playwright;
    private static IBrowser? _browser;
    private readonly ScenarioContext _scenarioContext;
    private static readonly float? SlowMoMilliseconds = ConfigManager.GetConfig<Config>().SlowMoMilliseconds;
    private static readonly bool? Headless = ConfigManager.GetConfig<Config>().Headless;
    private static readonly bool RecordVideo = ConfigManager.GetConfig<Config>().RecordVideo;

    public Hooks(WebContext webContext, ScenarioContext scenarioContext, IObjectContainer objectContainer)
    {
        _objectContainer = objectContainer;
        _webContext = webContext;
        _scenarioContext = scenarioContext;
    }

    [BeforeTestRun]
    public static async Task InitBrowser()
    {
        var exitCode = Program.Main(new[] { "install" });
        if (exitCode != 0)
        {
            throw new Exception($"Playwright exited with code {exitCode}");
        }

        _playwright = await Microsoft.Playwright.Playwright.CreateAsync();
        if (_playwright is null) throw new Exception("Failed to initialize playwright.");
        _browser = await InitBrowserAsync();
        if (_browser is null) throw new Exception("Failed to initialize browser.");
    }
    
    /// <summary>
    /// According to our convention all interfaces registrations should go with 0 order
    /// </summary>
    [BeforeScenario(Order = 0)]
    public void Bootstrap()
    {
        _objectContainer.RegisterTypeAs<LocatorStorageService, IWebElementStorageService>();
        // _objectContainer.RegisterTypeAs<FixedInputElement, IInputWebElement>();
        _objectContainer.RegisterTypeAs<InputElement, IInputWebElement>();
        _objectContainer.RegisterTypeAs<ButtonElement, IButtonElement>();
        _objectContainer.RegisterTypeAs<CheckboxElement, ICheckboxElement>();
        _objectContainer.RegisterTypeAs<TableElement, ITableWrapper>();
    }

    [BeforeScenario(Order = 1)]
    public async Task CreateContextAsync()
    {
        if (_browser is null)
        {
            throw new NullReferenceException($"Playwright browser is not initialized.");
        }

        var browserContext = RecordVideo
            ? await _browser.NewContextAsync(new BrowserNewContextOptions {RecordVideoDir = "videos/"})
            : await _browser.NewContextAsync();
        
        _webContext.Browser = new Browser(browserContext);
        _webContext.Page = await _webContext.Browser.NewPageAsync();
    }

    [AfterScenario]
    public async Task CloseBrowserContextAsync()
    {
        await _webContext.Browser.CloseAsync();
    }

    [AfterTestRun]
    public static void CloseBrowser()
    {
        _browser!.CloseAsync();
        _playwright!.Dispose();
    }

    [AfterScenario(Order = 0)]
    public async Task MakeScreenshot()
    {
        if (_scenarioContext.TestError != null)
        {
            var path = new string(TestContext.CurrentContext.Test.Name
                .Where(x => !Path.GetInvalidFileNameChars().Contains(x))
                .ToArray()) + ".png";
            await _webContext.Page.ScreenshotAsync(path);
            TestContext.AddTestAttachment(path);
        }
    }

    //TODO Implement configuration
    private static async Task<IBrowser?> InitBrowserAsync()
    {
        if (_playwright is null) throw new NullReferenceException($"Playwright is not initialized.");
        return await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions
        {
            Headless = Headless,
            SlowMo = SlowMoMilliseconds,
        });
    }
}
