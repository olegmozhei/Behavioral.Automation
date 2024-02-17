
using Behavioral.Automation.Bindings.UI.Abstractions;

namespace Behavioral.Automation.Interface.Playwright.WebElements;

public class FileChooser : IFileChooser
{

    private readonly Microsoft.Playwright.IFileChooser _playwrightFileChooser;

    public FileChooser(Microsoft.Playwright.IFileChooser playwrightFileChooser)
    {
        _playwrightFileChooser = playwrightFileChooser;
    }

    public Task UploadFilesAsync(string filePath)
    {
        return _playwrightFileChooser.SetFilesAsync(filePath);
    }
}