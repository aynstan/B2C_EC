using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class CreditCardRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();
        public CreditCard GetById(int Id)
        {
            return db.CreditCards.Find(Id);
        }
        public List<CreditCard> GetAllCreditCard()
        {
            return db.CreditCards.ToList();
        }
        public int CreateCreditCard(CreditCard A)
        {
            try
            {
                db.CreditCards.Add(A);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public int UpdateCreditCard(CreditCard A)
        {
            try
            {
                db.Entry(A).State = EntityState.Modified;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
