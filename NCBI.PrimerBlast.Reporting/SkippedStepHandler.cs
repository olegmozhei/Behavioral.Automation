using System;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Infrastructure;

namespace NCBI.PrimerBlast.Reporting
{
    /*
* Collect step execution info after each step
*/
    public class SkippedStepHandler : ISkippedStepHandler
    {
        public void Handle(ScenarioContext scenarioContext)
        {
            Console.WriteLine("Handle skipped step here");
            ReportsContainer.Steps.Add(scenarioContext.StepContext.StepInfo.Text);
        }
    }
}