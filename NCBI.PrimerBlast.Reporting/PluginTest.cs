using NCBI.PrimerBlast.Reporting;
using TechTalk.SpecFlow.Plugins;
using TechTalk.SpecFlow.UnitTestProvider;

[assembly: RuntimePlugin(typeof(PluginTest))]

namespace NCBI.PrimerBlast.Reporting
{
    public class PluginTest : IRuntimePlugin
    {
        public void Initialize(RuntimePluginEvents runtimePluginEvents, RuntimePluginParameters runtimePluginParameters,
            UnitTestProviderConfiguration unitTestProviderConfiguration)
        {
            throw new System.NotImplementedException();
        }
    }
}