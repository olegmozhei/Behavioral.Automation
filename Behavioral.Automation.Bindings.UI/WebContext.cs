using Behavioral.Automation.Bindings.UI.Abstractions;

namespace Behavioral.Automation.Bindings.UI;

/*
 * WebContext stores some UI-related instances that can be reused between steps:
 * Browser
 * Tab (?)
 * Page
 */
public class WebContext
{
    public IBrowser Browser { get; set; }
    public IPage Page { get; set; }
}