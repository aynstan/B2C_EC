using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class ProductRepo
    {
        public List<Product> GetProductBestSelling()
        {
            return new B2C_ECEntities().Products.Where(p => p.IsBestSeller == true).ToList();
        }
    }
}
