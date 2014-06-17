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

        public List<ProductType> GetAllProductType()
        {
            return db.ProductTypes.ToList();
        }

        public ProductType GetById(int Id)
        {
            return db.ProductTypes.Where(p => p.ID == Id).FirstOrDefault();
        }
    }
}
