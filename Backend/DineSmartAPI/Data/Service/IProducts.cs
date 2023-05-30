using DineSmartAPI.Models;

namespace DineSmartAPI.Data.Service
{
    public interface IProducts
    {
        void Insert( Products products);
        void Delete(Products products);
        void Update(Products products);

        List<Products> listProducts();
    }
}
