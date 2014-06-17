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
        public List<Product> GetListProductByService(int ServiceID)
        {
            return db.Products.Where(p => p.ProductType_ID == ServiceID).ToList();
        }
        public List<Product> GetProductBestSelling()
        {
            return db.Products.Where(p => p.IsBestSelling == true).ToList();
        }

        public List<Product> GetListProductByProductTypeID(int ProductTypeId)
        {
            return db.Products.Where(p => p.ProductType_ID == ProductTypeId).ToList();
        }

        public List<Product> GetProductNew()
        {
            return db.Products.Where(p => p.IsNew == true).ToList();
        }

        public List<Product> GetProductSpecial()
        {
            return db.Products.Where(p => p.IsSpecial == true).ToList();
        }

        public List<Product> GetListProductPageIndex()
        {
            return db.Products.OrderBy(p => p.DateCreated).ToList();
        }

        public List<Product> GetProductManagement(string Name, decimal price, decimal priceto, int status)
        {
            List<Product> list = new List<Product>();
            switch (status)
            {
                case 0:
                    list = db.Products.Where(p => p.Name.Contains(Name) && (price == 0 || p.Price >= price) && (priceto == 0 || p.Price <= priceto)).ToList();
                    break;
                case 1:
                    list = db.Products.Where(p => p.Name.Contains(Name) && (price == 0 || p.Price >= price) && (priceto == 0 || p.Price <= priceto) && p.IsActive == true).ToList();
                    break;
                case 2:
                    list = db.Products.Where(p => p.Name.Contains(Name) && (price == 0 || p.Price >= price) && (priceto == 0 || p.Price <= priceto) && p.IsBestSelling == true).ToList();
                    break;
                case 3:
                    list = db.Products.Where(p => p.Name.Contains(Name) && (price == 0 || p.Price >= price) && (priceto == 0 || p.Price <= priceto) && p.IsSpecial == true).ToList();
                    break;
                case 4:
                    list = db.Products.Where(p => p.Name.Contains(Name) && (price == 0 || p.Price >= price) && (priceto == 0 || p.Price <= priceto) && p.IsNew == true).ToList();
                    break;
                default:
                    break;
            }
            return list;
        }
    }
}
