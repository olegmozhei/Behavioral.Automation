using System;
using NCBI.PrimerBlast.Reporting.models;
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
            var title = scenarioContext.ScenarioInfo.Title;
            var arguments = scenarioContext.ScenarioInfo.Arguments;
            // Update test case information:
            var testCase = ReportsContainer.GetTestCase(title, arguments);
            var testStep = new TestStep(scenarioContext.StepContext.StepInfo.Text, "skipped");
            testCase.AddTestStep(testStep);
        }
    }
}