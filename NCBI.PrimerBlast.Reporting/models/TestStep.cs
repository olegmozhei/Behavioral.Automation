namespace NCBI.PrimerBlast.Reporting.models
{
    public class TestStep
    {
        public readonly string title;
        public readonly string status;

        public TestStep(string title, string status)
        {
            this.title = title;
            this.status = status;
        }
    }
}