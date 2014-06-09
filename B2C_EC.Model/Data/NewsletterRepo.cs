using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace B2C_EC.Model.Data
{
    public class NewsletterRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public int CreateNewsLetter(NewsLetter C)
        {
            try
            {
                this.db.NewsLetters.Add(C);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public bool DoesEmailExist(string email)
        {
            NewsLetter newsLetter = db.NewsLetters.Where(c => c.Email == email).FirstOrDefault();
            return (newsLetter != null);
        }
    }
}
