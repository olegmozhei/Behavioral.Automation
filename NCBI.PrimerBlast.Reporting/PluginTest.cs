using System;
using System.IO;
using NCBI.PrimerBlast.Reporting;
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
        public void Initialize(RuntimePluginEvents runtimePluginEvents, RuntimePluginParameters runtimePluginParameters,
            UnitTestProviderConfiguration unitTestProviderConfiguration)
        {
            runtimePluginEvents.CustomizeGlobalDependencies += RuntimePluginEventsOnCustomizeGlobalDependencies;

            Console.WriteLine("Starting runtime plugin");
            runtimePluginEvents.CustomizeScenarioDependencies += (sender, e) =>
            {
                e.ObjectContainer.RegisterTypeAs<SkippedStepHandler, ISkippedStepHandler>();
            };
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
            var createText = string.Join("\n", ReportsContainer.Steps);
            File.WriteAllText("report.txt", createText);
        }

        /*
         * Method is run when After Step event is thrown
         */
        private void RuntimePluginTestExecutionLifecycleEventsOnAfterStep(object sender,
            RuntimePluginAfterStepEventArgs e)
        {
            var scenarioContext = e.ObjectContainer.Resolve<ScenarioContext>();
            ReportsContainer.Steps.Add(scenarioContext.StepContext.StepInfo.Text);
        }
    }
}