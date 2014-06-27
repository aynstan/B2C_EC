using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace B2C_EC.Model.Data
{
    public class ProductRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();
        
        public Product GetById(int id)
        {
            return db.Products.Find(id);
        }
        public List<Product> GetAllProduct()
        {
            return db.Products.ToList();
        }
        public int CreateProduct(Product P)
        {
            try
            {
                db.Products.Add(P);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int DeleteProduct(int Id)
        {
            Product product = db.Products.Where(u => u.ID == Id).FirstOrDefault();
            return DeleteProduct(product);
        }
        public int DeleteProduct(Product P)
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
        public int UpdateProduct(Product P)
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
        public List<Product> GetProductBestSelling()
        {
            return db.Products.Where(p => p.IsBestSelling == true && p.IsActive == true).ToList();
        }

        public List<Product> GetProductNew()
        {
            return db.Products.Where(p => p.IsNew == true && p.IsActive == true).ToList();
        }

        public List<Product> GetProductSpecial()
        {
            return db.Products.Where(p => p.IsSpecial == true && p.IsActive == true).ToList();
        }

        public List<Product> GetListProductByProductTypeID(int ProductTypeId)
        {
            return db.Products.Where(p => p.ProductType_ID == ProductTypeId && p.IsActive == true).ToList();
        }

        public List<Product> GetListProductPageIndex()
        {
            return db.Products.Where(p=> p.IsActive == true).OrderBy(p => p.DateCreated).ToList();
        }

        public List<Product> GetListBySearch(string key)
        {
            return db.Products.Where(p => p.Manufacturer.Name.Contains(key) || p.ProductType.Name.Contains(key) || p.Name.Contains(key) || p.Description.Contains(key)).ToList();
        }
        public List<Product> GetManagementProducts(string name, int productTypeID, int manufacturerID)
        {
            return db.Products.Where(u => (name.Equals("") || name.Equals(null) || u.Name.Contains(name))
                                        && (productTypeID.Equals(0) || productTypeID.Equals(null) || u.ProductType_ID.Value.Equals(productTypeID))
                                        && (manufacturerID.Equals(0) || manufacturerID.Equals(null) || u.Manufacuturer_ID.Value.Equals(manufacturerID))
                                      ).ToList();
        }
    }
}
