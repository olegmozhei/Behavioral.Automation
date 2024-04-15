using System;
using System.IO;
using System.Linq;
using NCBI.PrimerBlast.Reporting;
using NCBI.PrimerBlast.Reporting.models;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Infrastructure;
using TechTalk.SpecFlow.Plugins;
using TechTalk.SpecFlow.UnitTestProvider;

[assembly: RuntimePlugin(typeof(PluginTest))]

namespace NCBI.PrimerBlast.Reporting
{
    /*
     * Failed step argument transformation can escape reporting
     * Probably it's not a SUT problem
     */
    public class PluginTest : IRuntimePlugin
    {
        private const bool IsEnabled = true;

        public void Initialize(RuntimePluginEvents runtimePluginEvents, RuntimePluginParameters runtimePluginParameters,
            UnitTestProviderConfiguration unitTestProviderConfiguration)
        {

            if (IsEnabled)
            {
                runtimePluginEvents.CustomizeGlobalDependencies += RuntimePluginEventsOnCustomizeGlobalDependencies;

                Console.WriteLine("Starting runtime plugin");
                runtimePluginEvents.CustomizeScenarioDependencies += (sender, e) =>
                {
                    e.ObjectContainer.RegisterTypeAs<SkippedStepHandler, ISkippedStepHandler>();
                };
            }
        }

        private void RuntimePluginEventsOnCustomizeGlobalDependencies(object sender,
            CustomizeGlobalDependenciesEventArgs e)
        {
            var runtimePluginTestExecutionLifecycleEvents =
                e.ObjectContainer.Resolve<RuntimePluginTestExecutionLifecycleEvents>();
            runtimePluginTestExecutionLifecycleEvents.AfterStep += RuntimePluginTestExecutionLifecycleEventsOnAfterStep;
            runtimePluginTestExecutionLifecycleEvents.AfterTestRun +=
                RuntimePluginTestExecutionLifecycleEventsOnAfterTestRun;
        }

        /*
        * Method is run when After Test run event is thrown
        */
        private void RuntimePluginTestExecutionLifecycleEventsOnAfterTestRun(object sender,
            RuntimePluginAfterTestRunEventArgs e)
        {
            // Create a file to write to.
            // TODO: sort test cases

            var content = "";
            foreach (var testCase in ReportsContainer.Cases)
            {
                content += testCase.title + ":\n";
                content += string.Join("\n", testCase.steps.Select(step=> step.title + " - " + step.status));
                content += "\n\n";
            }
            File.WriteAllText("report.txt", content);
        }

        /*
         * Method is run when After Step event is thrown
         */
        private void RuntimePluginTestExecutionLifecycleEventsOnAfterStep(object sender,
            RuntimePluginAfterStepEventArgs e)
        {
            var scenarioContext = e.ObjectContainer.Resolve<ScenarioContext>();
            // I need to identify test case:
            var title = scenarioContext.ScenarioInfo.Title;
            var arguments = scenarioContext.ScenarioInfo.Arguments;
            var scenarioExecutionStatus = scenarioContext.StepContext.Status;
            // Update test case information:
            var testCase = ReportsContainer.GetTestCase(title, arguments);
            var testStep = new TestStep(scenarioContext.StepContext.StepInfo.Text,
                (scenarioExecutionStatus != ScenarioExecutionStatus.OK)? "failed": "passed");
            testCase.AddTestStep(testStep);
        }
    }
}