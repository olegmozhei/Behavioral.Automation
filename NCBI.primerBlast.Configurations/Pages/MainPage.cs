using Behavioral.Automation.Configs;
using Behavioral.Automation.Interface.Playwright.Services;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;
using NCBI.PrimerBlast.Configurations.Configs;

namespace NCBI.PrimerBlast.Configurations.Pages;

class MainPageExample : ISelectorStorage
{
    private static readonly string Id = ConfigManager.GetConfig<Config>().SearchAttribute;

    public InputSelector TemplateInput = new InputSelector() { XpathSelector = "//textarea[@id='seq']"};
    public ButtonSelector ChooseTemplateFileButton = new ButtonSelector() {XpathSelector = "//input[@id='upl']"};
        
    
}