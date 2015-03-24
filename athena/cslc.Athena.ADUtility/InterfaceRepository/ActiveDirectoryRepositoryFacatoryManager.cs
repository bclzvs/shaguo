namespace cslc.Athena.ADUtility
{
    public static class ActiveDirectoryRepositoryFacatoryManager
    {
        public static IActiveDirectoryRepositoryFacatory Facatory = new ActiveDirectoryRepositoryFacatory();
    }

    public interface IActiveDirectoryRepositoryFacatory
    {
        IActiveDirectoryRepository Instance();
    }

    public class ActiveDirectoryRepositoryFacatory : IActiveDirectoryRepositoryFacatory
    {
        public IActiveDirectoryRepository Instance()
        {
            return new ADServiceFacadeAdapter();
        }
    }
}
