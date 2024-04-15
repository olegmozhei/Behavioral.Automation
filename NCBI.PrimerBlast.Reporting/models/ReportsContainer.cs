
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using NCBI.PrimerBlast.Reporting.models;

public class ReportsContainer
{
    public static HashSet<TestCase> Cases = new HashSet<TestCase>();

    public static TestCase GetTestCase(string title, IOrderedDictionary arguments)
    {
        var testCase = (arguments.Count == 0)
            ? new TestCase(TestCaseType.General, title)
            : new TestCase(TestCaseType.Outline, title, arguments);
        if (!Cases.Contains(testCase)) Cases.Add(testCase);
        return Cases.First(e => e.Equals(testCase));
    }
}