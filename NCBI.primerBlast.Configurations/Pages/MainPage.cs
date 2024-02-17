using Behavioral.Automation.Bindings.UI.Abstractions;
using Behavioral.Automation.Configs;
using Behavioral.Automation.Interface.Playwright.Services;
using Behavioral.Automation.Interface.Playwright.WebElementSelectors;
using NCBI.PrimerBlast.Configurations.Configs;

namespace NCBI.PrimerBlast.Configurations.Pages;

class MainPageExample : ISelectorStorage
{
    private static readonly string Id = ConfigManager.GetConfig<Config>().SearchAttribute;

    public InputSelector TemplateInput = new() { XpathSelector = "//textarea[@id='seq']"};
    public ButtonSelector ChooseTemplateFileButton = new() {XpathSelector = "//input[@id='upl']"};
    
    public InputSelector ForwardPrimerFromInput = new() {XpathSelector = "//input[@name='PRIMER5_START']"};
    public InputSelector ForwardPrimerToInput = new() {XpathSelector = "//input[@name='PRIMER5_END']"};
    public InputSelector ReversePrimerFromInput = new() {XpathSelector = "//input[@name='PRIMER3_START']"};
    public InputSelector ReversePrimerToInput = new() {XpathSelector = "//input[@name='PRIMER3_END']"};
    public InputSelector ForwardPrimerInput = new() {XpathSelector = "//input[@name='PRIMER_LEFT_INPUT']"};
    public InputSelector ReversePrimerInput = new() {XpathSelector = "//input[@name='PRIMER_RIGHT_INPUT']"};
    
    //primer parameters block:
    public InputSelector MinimalSizeOfPCRProductInput = new() {XpathSelector = "//*[@name='PRIMER_PRODUCT_MIN']"};
    public InputSelector MaximalSizeOfPCRProductInput = new() {XpathSelector = "//*[@name='PRIMER_PRODUCT_MAX']"};
    public InputSelector NumberOfPrimersToReturnInput = new() {XpathSelector = "//*[@name='PRIMER_NUM_RETURN']"};
    public InputSelector MinimalMeltingTemperatureOfPrimersInput = new() {XpathSelector = "//*[@name='PRIMER_MIN_TM']"};
    public InputSelector OptimalMeltingTemperatureOfPrimersInput = new() {XpathSelector = "//*[@name='PRIMER_OPT_TM']"};
    public InputSelector MaximalMeltingTemperatureOfPrimersInput = new() {XpathSelector = "//*[@name='PRIMER_MAX_TM']"};
    public InputSelector MaximalMeltingTemperatureDifferenceInput =
        new() {XpathSelector = "//*[@name='PRIMER_MAX_DIFF_TM']"};
    
    public DropdownSelector ExonJunctionSpanDropdown = new()
    {
        Selector = new ElementSelector {XpathSelector = "//select[@name='PRIMER_ON_SPLICE_SITE']"},
        MenuSelector = new ElementSelector {XpathSelector = "//select[@name='PRIMER_ON_SPLICE_SITE']"},
        ItemSelector = new ElementSelector {XpathSelector = "//option"},
        ItemSelectionSelector = new ElementSelector {XpathSelector = "//option"}
    };
    
    public InputSelector MinSiteOverlapByFivePrimeEndInput =
        new() {XpathSelector = "//*[@name='SPLICE_SITE_OVERLAP_5END']"};
    public InputSelector MinSiteOverlapByThreePrimeEndInput =
        new() {XpathSelector = "//*[@name='SPLICE_SITE_OVERLAP_3END']"};
    public InputSelector MaxSiteOverlapByThreePrimeEndInput =
        new() {XpathSelector = "//*[@name='SPLICE_SITE_OVERLAP_3END_MAX']"};
    

    public ButtonSelector GetPrimersButton = new()
        {XpathSelector = "//form/div[@class='searchInfo ']//input[@value='Get Primers']"};

    public DropdownSelector DatabaseDropdown = new()
    {
        Selector = new ElementSelector {XpathSelector = "//select[@name='PRIMER_SPECIFICITY_DATABASE']"},
        MenuSelector = new ElementSelector {XpathSelector = "//select[@name='PRIMER_SPECIFICITY_DATABASE']"},
        ItemSelector = new ElementSelector {XpathSelector = "//option"},
        ItemSelectionSelector = new ElementSelector {XpathSelector = "//option"}
    };

    public LabelSelector ErrorLabel = new() {XpathSelector = "//p[@class='error']"};

    public TableSelector PrimersDesignTable = new()
    {
        BaseElementSelector = new ElementSelector {XpathSelector = "//div[@id='alignInfo']"},
        HeaderCellSelector = new ElementSelector {XpathSelector = "//div[@class='prPairInfo'][1]//tr[1]/th"},
        RowSelector = new ElementSelector {XpathSelector = "//tr" },
        CellSelector = new ElementSelector {XpathSelector = "/*"}
    };

    public CheckboxSelector PerformSpecificityCheckCheckbox =
        new() {XpathSelector = "//input[@name='SEARCH_SPECIFIC_PRIMER']"};
    
}