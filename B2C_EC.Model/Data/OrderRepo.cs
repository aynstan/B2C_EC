using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class OrderRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public int CreateOrder(Order A)
        {
            try
            {
                db.Orders.Add(A);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public int UpdateOrder(Order A)
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
