namespace Behavioral.Automation.Bindings.UI.Abstractions;

public interface IFileChooser
{
    public Task UploadFilesAsync(string filePath);
}