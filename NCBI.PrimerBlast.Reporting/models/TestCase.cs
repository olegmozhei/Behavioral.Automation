using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;

namespace NCBI.PrimerBlast.Reporting.models
{
    /*
     * Grouping is performed by test cases
     */
    public class TestCase
    {
        public readonly TestCaseType type;
        public readonly string title;
        public readonly IOrderedDictionary arguments;
        public List<TestStep> steps = new List<TestStep>();

        public TestCase(TestCaseType type, string title, IOrderedDictionary arguments)
        {
            this.type = type;
            this.title = title;
            this.arguments = arguments;
        }
        public TestCase(TestCaseType type, string title)
        {
            this.type = type;
            this.title = title;
            arguments = null;
        }

        public override bool Equals(object obj)
        {
            // Check for null and compare run-time types.
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }

            var other = (TestCase)obj;
            return type.Equals(other.type) && title == other.title && AreDictionariesEqual(arguments, other.arguments);
        }
        
        private static bool AreDictionariesEqual(IOrderedDictionary dict1, IOrderedDictionary dict2)
        {
            if (dict1 == null && dict2 == null) return true;
            if (dict1 == null && dict2 != null) return false;
            if (dict1 != null && dict2 == null) return false;
            
            if (dict1.Count != dict2.Count)
            {
                return false;
            }

            foreach (DictionaryEntry entry in dict1)
            {
                if (!dict2.Contains(entry.Key))
                    return false;

                if (!dict2[entry.Key].Equals(entry.Value))
                    return false;
            }

            return true;
        }

        public override int GetHashCode()
        {
            var representation = type + " " + title;
            if (arguments != null)
            {
                representation = arguments.Cast<DictionaryEntry>().Aggregate(representation, (current, entry) => current + (entry.Key + " " + entry.Value));
            }

            return representation.GetHashCode();
        }

        public void AddTestStep(TestStep testStep)
        {
            steps.Add(testStep);
        }
    }
}