using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using B2C_EC.Model;

namespace B2C_EC.Model.Data
{
    public class ProductTypeRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public ProductType GetById(int Id)
        {
            return db.ProductTypes.Find(Id);
        }
        public List<ProductType> GetAllProductType()
        {
            return db.ProductTypes.ToList();
        }

        public int CreateProductType(ProductType U)
        {
            try
            {
                this.db.ProductTypes.Add(U);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int DeleteProductType(int Id)
        {
            ProductType productType = db.ProductTypes.Where(u => u.ID == Id).FirstOrDefault();
            return DeleteProductType(productType);
        }
        public int DeleteProductType(ProductType U)
        {
            try
            {
                db.Entry(U).State = EntityState.Deleted;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int UpdateProductType(ProductType U)
        {
            try
            {
                db.Entry(U).State = EntityState.Modified;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public List<ProductType> GetManagementProductTypes(string name)
        {
            return db.ProductTypes.Where(u => u.Name.Contains(name)).ToList();
        }
    }
}
