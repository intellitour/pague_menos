using PagueMenos.DataContracts.Product;
using System.Collections.Generic;
using System.Linq;

namespace PagueMenos.DataAccess.Handlers
{
    public class ProductHandler
    {
        #region Constants

        private const string DefaultSource = "paguemenos.tk";

        #endregion

        private IEnumerable<ProductDataContract> GetProducts(IQueryable<Entity.gtin> products)
        {
            return products.Select(g => new ProductDataContract()
                {
                    Code = g.GTIN_CD,
                    Name = g.GTIN_NM,
                    Unity = g.PKG_UNIT,
                    Volume = g.M_ML,
                    Weight = g.M_G
                }).ToList();
        }

        public IEnumerable<ProductDataContract> Get(int pageIndex, int pageSize)
        {
            using (Entity.PagueMenosEntities context = new Entity.PagueMenosEntities())
            {
                var query = context.gtin
                    .Where(g => !string.IsNullOrEmpty(g.GTIN_NM))
                    .OrderBy(g => g.GTIN_NM)
                    .Skip(pageSize * pageIndex)
                    .Take(pageSize);

                return GetProducts(query);
            }
        }

        public IEnumerable<ProductDataContract> Get(string code)
        {
            using (var context = new Entity.PagueMenosEntities())
            {
                var query = context.gtin.Where(g => g.GTIN_CD == code);
                return GetProducts(query);
            }
        }

        public bool Update(ProductDataContract product)
        {
            using (var context = new Entity.PagueMenosEntities())
            {
                var existing = context.gtin.SingleOrDefault(p => p.GTIN_CD == product.Code);

                if (existing != null)
                {
                    existing.GTIN_CD = product.Code;
                    existing.GTIN_NM = product.Name;
                    existing.PKG_UNIT = product.Unity;
                    existing.M_ML = product.Volume;
                    existing.M_G = product.Weight;
                    existing.SOURCE = DefaultSource;
                    context.SaveChanges();

                    return true;
                }
            }

            return false;
        }

        public void Insert(ProductDataContract product)
        {
            using (var context = new Entity.PagueMenosEntities())
            {
                var newProduct = new Entity.gtin();
                newProduct.GTIN_CD = product.Code;
                newProduct.GTIN_LEVEL_CD = int.Parse(product.Code);
                newProduct.GTIN_NM = product.Name;
                newProduct.PKG_UNIT = product.Unity;
                newProduct.M_ML = product.Volume;
                newProduct.M_G = product.Weight;
                newProduct.SOURCE = DefaultSource;
                context.gtin.Add(newProduct);
                context.SaveChanges();
            }
        }

        public bool Delete(string code)
        {
            using (var context = new Entity.PagueMenosEntities())
            {
                var existing = context.gtin.SingleOrDefault(p => p.GTIN_CD == code);

                if (existing != null)
                {
                    context.gtin.Remove(existing);
                    context.SaveChanges();

                    return true;
                }
            }

            return false;
        }
    }
}
