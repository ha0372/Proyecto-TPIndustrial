using DineSmartAPI.Models;

namespace DineSmartAPI.Data.Service
{
    public interface ISuppliers
    {
        void Insert( Suppliers suppliers);
        void Delete(Suppliers suppliers);
        void Update(Suppliers suppliers);

        List<Suppliers> listSuppliers();
    }
}
