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

        public NewsLetter GetById(int Id)
        {
            return db.NewsLetters.Find(Id);
        }
        public List<NewsLetter> GetAllNewsLetter()
        {
            return db.NewsLetters.ToList();
        }
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
        public int DeleteNewsLetter(int Id)
        {
            NewsLetter order = db.NewsLetters.Where(u => u.ID == Id).FirstOrDefault();
            return DeleteNewsLetter(order);
        }
        public int DeleteNewsLetter(NewsLetter C)
        {
            try
            {
                db.Entry(C).State = EntityState.Deleted;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int UpdateNewsLetter(NewsLetter C)
        {
            try
            {
                db.Entry(C).State = EntityState.Modified;
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
        public List<NewsLetter> GetManagementNewsLetters(DateTime? fromdate, DateTime? todate)
        {
            return db.NewsLetters.Where(u => (fromdate.Equals(null) || u.DateCreated >= fromdate)
                                        && (todate.Equals(null) || u.DateCreated <= todate)
                                      ).ToList();
        }
    }
}
