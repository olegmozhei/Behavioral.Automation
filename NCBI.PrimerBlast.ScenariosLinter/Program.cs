using FeatureFilesParser.models;
using FeatureFilesParser.service;

namespace NCBI.PrimerBlast.ScenariosLinter;

public static class Program
{
    public static void Main(string[] args)
    {

        var parentDirectoryPath = "/Users/oleg.mozhey/RiderProjects/Behavioral.Automation.School/NCBI.PrimerBlast.Scenarios";
        var parser = new FeatureFileParser();
        var featureFilesPaths = FeatureFileParser.GetListOfFeatureFilePathsByParentDirectoryPath(parentDirectoryPath);
        var featureFiles = new List<FeatureFile>();
        foreach (var path in featureFilesPaths)
        {
            var lines = File.ReadAllLines(path);
            var featureFile = parser.ReadAndParseFeatureFileFromStringArray(lines, path);
            featureFiles.Add(featureFile);
        }

        CheckPullRequest(featureFiles);

    }

    private static void CheckPullRequest(List<FeatureFile> featureFiles)
    {
        var hasErrors = false;

        //handle parsing values:
        foreach (var message in featureFiles.SelectMany(featureFile => featureFile.parsingWarnings))
        {
            hasErrors = true;
            Console.WriteLine(message);
        }
        
        
        //handle general checks:
        var generalRulesChecker = new GeneralRulesChecker();
        foreach (var featureFile in featureFiles)
        {
            //check that there is no duplicates in background steps:
            hasErrors = generalRulesChecker.CheckRepeatedStepNamesInBackground(featureFile.GetBackground(), featureFile.FilePath) || hasErrors;
            
            foreach (var scenario in featureFile.GetScenariosWithAllTags())
            {
                hasErrors = generalRulesChecker.CheckDuplicatedTags(scenario) || hasErrors;
                hasErrors = generalRulesChecker.CheckRepeatedStepNamesInScenarios(scenario) || hasErrors;
                hasErrors = generalRulesChecker.CheckAllowedTags(scenario) || hasErrors;
                hasErrors = generalRulesChecker.CheckMandatoryTags(scenario) || hasErrors;
            }
        }

        if (hasErrors) Environment.Exit(1);
    }

}
