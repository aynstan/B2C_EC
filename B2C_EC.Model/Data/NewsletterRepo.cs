using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace B2C_EC.Model.Data
{
    public class NewsletterRepo : HelperRepo<NewsLetter>
    {
        public override DbSet<NewsLetter> GetRelatedDbSet()
        {
            return db.NewsLetters;
        }
        public int CreateNewsLetter(NewsLetter C)
        {
            return Create(C);
        }
        public bool DoesEmailExist(string email)
        {
            NewsLetter newsLetter = db.NewsLetters.Where(c => c.Email == email).FirstOrDefault();
            return (newsLetter != null);
        }
    }
}
