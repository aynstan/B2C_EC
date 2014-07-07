using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class CreditCardTypeRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();
        public CreditCardType GetById(int Id)
        {
            return db.CreditCardTypes.Find(Id);
        }
        public List<CreditCardType> GetAllCreditCardType()
        {
            return db.CreditCardTypes.ToList();
        }
        public int CreateCreditCardType(CreditCardType A)
        {
            try
            {
                db.CreditCardTypes.Add(A);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public int UpdateCreditCardType(CreditCardType A)
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
