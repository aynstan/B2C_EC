using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace B2C_EC.Model.Data
{
    public class ProductPriceHistoryRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();
        public ProductPriceHistory GetById(int id)
        {
            return db.ProductPriceHistories.Find(id);
        }
        public List<ProductPriceHistory> GetAllProductPriceHistory()
        {
            return db.ProductPriceHistories.ToList();
        }
        public int CreateProductPriceHistory(ProductPriceHistory P)
        {
            try
            {
                db.ProductPriceHistories.Add(P);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int DeleteProductPriceHistory(int Id)
        {
            ProductPriceHistory productPriceHistory = db.ProductPriceHistories.Where(u => u.ID == Id).FirstOrDefault();
            return DeleteProductPriceHistory(productPriceHistory);
        }
        public int DeleteProductPriceHistory(ProductPriceHistory P)
        {
            try
            {
                db.Entry(P).State = EntityState.Deleted;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int UpdateProductPriceHistory(ProductPriceHistory P)
        {
            try
            {
                db.Entry(P).State = EntityState.Modified;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public List<ProductPriceHistory> GetManagementProductPriceHistories(int productID, string productName, int productTypeID, int manufacturerID)
        {
            return db.ProductPriceHistories.Where(u => (productID.Equals(0) || productID.Equals(null) || u.Product_ID.Equals(productID))
                                        && (productName.Equals("") || productName.Equals(null) || u.Product.Name.Contains(productName))
                                        && (productTypeID.Equals(0) || productTypeID.Equals(null) || u.Product.ProductType_ID.Value.Equals(productTypeID))
                                        && (manufacturerID.Equals(0) || manufacturerID.Equals(null) || u.Product.Manufacuturer_ID.Value.Equals(manufacturerID))
                                      ).ToList();
        }
    }
}
