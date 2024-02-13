namespace Behavioral.Automation.Bindings.UI.Interfaces;

public interface IFileChooser
{
    public Task UploadFilesAsync(string filePath);
}