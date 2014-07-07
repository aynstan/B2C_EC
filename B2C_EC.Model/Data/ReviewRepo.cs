using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class ReviewRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public Review GetById(int Id)
        {
            return db.Reviews.Find(Id);
        }
        public List<Review> GetByProductId(int ProductId)
        {
            return db.Reviews.Where(r => r.Product_ID.Value.Equals(ProductId)).OrderByDescending(r => r.ID).ToList();
        }
        public int CreateReview(Review R)
        {
            try
            {
                this.db.Reviews.Add(R);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
