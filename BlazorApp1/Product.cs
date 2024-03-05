namespace BlazorApp1
{
    public class Product
    {
        public int Id { get; set; }
        public int BusinessCapabilityLevel { get; set; }
        public string BusinessCapabilittyName { get; set; }

        public string Prefix
        {
            get
            {
                return BusinessCapabilittyName?.Split(' ').FirstOrDefault()?.TrimEnd('.'); ;
            }
        }

       

    }

    public enum CapabilityLevelEnum
    {
        Level_1 = 1, Level_2 = 2, Level_3 = 3
    }
}
