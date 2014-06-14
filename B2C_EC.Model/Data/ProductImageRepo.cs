using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class ProductImageRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public ProductImage GetImageDefaultByProductId(int ProductId)
        {
            return db.ProductImages.Where(i => i.Product_ID == ProductId && i.IsDefault == true).FirstOrDefault();
        }

        public string GetImageDefaultAllByProductId(int ProductId)
        {
            ProductImage ProductImage = GetImageDefaultByProductId(ProductId);
            if (ProductImage != null)
            {
                return ProductImage.Image;
            }
            ProductImage = new B2C_ECEntities().ProductImages.Where(p => p.Product_ID == ProductId).FirstOrDefault();
            if (ProductImage != null)
            {
                return ProductImage.Image;
            }
            return "";
        }

        public List<ProductImage> GetAllImagesByProductId(int ProductId)
        {
            return db.ProductImages.Where(i => i.Product_ID == ProductId).ToList();
        }
    }
}
