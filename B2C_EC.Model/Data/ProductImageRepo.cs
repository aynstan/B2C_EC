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
            if (ProductImage != null && !string.IsNullOrEmpty(ProductImage.Image))
            {
                return ProductImage.Image;
            }
            return "no-image.png";
        }

        public List<ProductImage> GetAllImagesByProductId(int ProductId)
        {
            return db.ProductImages.Where(i => i.Product_ID == ProductId).ToList();
        }

        public int DeleteProductImage(int Id)
        {
            try
            {
                ProductImage pi = db.ProductImages.Where(p => p.ID == Id).FirstOrDefault();
                db.ProductImages.Remove(pi);
                return db.SaveChanges();
            }
            catch( Exception e)
            { 
                throw new Exception(e.Message);
            }
        }

        public int DeleteProductImage(ProductImage pi)
        {
            try
            {
                db.ProductImages.Remove(pi);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            
        }

        public List<ProductImage> ImageProductDefaultToList(int ProductId)
        {
            return db.ProductImages.Where(p => p.Product_ID == ProductId && p.IsDefault == true).Take(1).ToList();
        }
    }
}
