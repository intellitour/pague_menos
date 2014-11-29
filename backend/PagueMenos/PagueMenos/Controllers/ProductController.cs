using PagueMenos.BusinessLogic.Implementation;
using PagueMenos.DataContracts.Product;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace PagueMenos.Controllers
{
    /// <summary>
    /// This API enable CRUD operations on a set of products.
    /// </summary>
    public class ProductController : ApiController
    {
        #region Constants

        private const int DefaultPageSize = 10;
        private const int DefaultPageIndex = 0;

        #endregion

        #region Attributes

        private ProductBO productBO;

        #endregion

        public ProductController()
        {
            productBO = new ProductBO();
        }

        /// <summary>
        /// Get all products
        /// </summary>
        /// <param name="pageSize">The page size of the result. This is not required and can be ommited or null. The default value is 10.</param>
        /// <param name="pageIndex">The page index of the result. This is not required and can be ommited or null. The default value is 0.</param>
        /// <returns></returns>
        public IEnumerable<ProductDataContract> Get(int? pageSize = null, int? pageIndex = null)
        {
            pageSize = pageSize ?? DefaultPageSize;
            pageIndex = pageIndex ?? DefaultPageIndex;

            return productBO.Get(pageIndex.Value, pageSize.Value);
        }

        /// <summary>
        /// Get all products related with the code.
        /// </summary>
        /// <param name="code">The product code</param>
        /// <returns>A product</returns>
        public IEnumerable<ProductDataContract> Get(string code)
        {
            return productBO.Get(code);
        }

        /// <summary>
        /// Updates a product.
        /// </summary>
        /// <param name="product">The product that will be updated</param>
        /// <returns>Returns a bool indicating if the operation was completed as expected or not.</returns>
        public bool Update(ProductDataContract product)
        {
            return productBO.Update(product);
        }

        /// <summary>
        /// Delete a product associated with the code.
        /// </summary>
        /// <param name="code">The product code</param>
        /// <returns>Returns a bool indicating if the operation was completed as expected or not</returns>
        public bool Delete(string code)
        {
            return productBO.Delete(code);
        }
    }
}
