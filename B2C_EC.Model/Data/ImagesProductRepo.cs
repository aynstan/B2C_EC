using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class ImagesProductRepo
    {
        public string GetImageURLDefaultByProductId(int ProductId)
        {
            ImagesProduct ImagesProduct =  new B2C_ECEntities().ImagesProducts.Where(p => p.Product_ID == ProductId && p.IsDefault == true).FirstOrDefault();
            if (ImagesProduct != null)
            {
                return ImagesProduct.ImageURL;
            }
            ImagesProduct = new B2C_ECEntities().ImagesProducts.Where(p => p.Product_ID == ProductId).FirstOrDefault();
            if (ImagesProduct != null)
            {
                return ImagesProduct.ImageURL;
            }
            return "";
        }
    }
}
