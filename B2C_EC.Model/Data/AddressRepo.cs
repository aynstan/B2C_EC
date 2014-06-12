using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class AddressRepo
    {
        B2C_ECEntities db = new B2C_ECEntities();

        public int CreateAddress(Address A)
        {
            try
            {
                db.Addresses.Add(A);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public int UpdateAddress(Address Old, Address New)
        {
            Old.Street1 = New.Street1;
            Old.Street2 = New.Street2;
            Old.City = New.City;
            Old.State = New.State;
            Old.Country = New.Country;
            Old.ZipCode = New.ZipCode;
            try
            {
                db.Entry(Old).State = EntityState.Modified;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
