using PagueMenos.DataAccess.Handlers;
using PagueMenos.DataContracts.Product;
using System.Collections.Generic;

namespace PagueMenos.BusinessLogic.Implementation
{
    public class ProductBO
    {
        private ProductHandler handler;

        public ProductBO()
        {
            handler = new ProductHandler();
        }

        public IEnumerable<ProductDataContract> Get(int pageIndex, int pageSize)
        {
            return handler.Get(pageIndex, pageSize);
        }

        public IEnumerable<ProductDataContract> Get(string code)
        {
            return handler.Get(code);
        }

        public bool Update(ProductDataContract product)
        {
            return handler.Update(product);
        }

        public bool Delete(string code)
        {
            return handler.Delete(code);
        }
    }
}
