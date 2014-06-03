using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class ImagesProductRepo
    {
        B2C_ECEntities db = new B2C_ECEntities();
        public ImagesProduct GetImageDefaultByProductId(int ProductId)
        {
            return db.ImagesProducts.Where(i => i.Product_ID == ProductId && i.IsDefault == true).FirstOrDefault();
        }
    }
}
