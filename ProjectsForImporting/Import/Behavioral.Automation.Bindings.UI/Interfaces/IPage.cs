namespace Behavioral.Automation.Bindings.UI.Interfaces;

public interface IPage
{
    public Task GotoAsync(string url);
    public Task GoToApplicationUrlAsync();
    public Task ToHaveTitleAsync(string title);
    public Task<IFileChooser> RunAndWaitForFileChooserAsync(Func<Task> action);
    public Task ScreenshotAsync(string path);

}