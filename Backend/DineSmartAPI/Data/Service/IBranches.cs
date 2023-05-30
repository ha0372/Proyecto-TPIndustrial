using DineSmartAPI.Models;

namespace DineSmartAPI.Data.Service
{
    public interface IBranches
    {
        void Insert( Branches branches);
        void Delete(Branches branches);
        void Update(Branches branches);

        List<Branches> listBranches();
    }
}
