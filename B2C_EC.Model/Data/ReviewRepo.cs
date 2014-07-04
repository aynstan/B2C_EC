using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class ReviewRepo
    {
        B2C_ECEntities db = new B2C_ECEntities();

        public int CreateReview(string FullName, string Comment, int ProductId)
        {
            try
            {
                Review r = new Review();
                r.FullName = FullName;
                r.Comment = Comment;
                r.DateCreated = DateTime.Now;
                r.Product_ID = ProductId;
                db.Reviews.Add(r);
                return db.SaveChanges();
            }
            catch( Exception e)
            {
                return -1;
            }
        }
    }
}
