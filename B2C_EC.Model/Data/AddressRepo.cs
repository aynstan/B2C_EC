using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using B2C_EC.Model.Global;

namespace B2C_EC.Model.Data
{
    public class AddressRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public Address GetById(int Id)
        {
            return db.Addresses.Find(Id);
        }
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

        public int UpdateAddress(Address A)
        {
            try
            {
                var v = GetById(A.ID);
                if (v == null)
                {
                    return CreateAddress(A);
                }
                else
                {
                    db.Entry(v).CurrentValues.SetValues(A);
                    //db.Entry(A).State = EntityState.Modified;
                    return db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public string GetToString(Address A)
        {
            string s = "";
            if (ToSQL.EmptyNull(A.Street1) != "")
            {
                s += ToSQL.EmptyNull(A.Street1);
            }
            if (ToSQL.EmptyNull(A.Street2) != "")
            {
                if (s != "")
                {
                    s += ", ";
                }
                s += ToSQL.EmptyNull(A.Street2);
            }
            if (ToSQL.EmptyNull(A.City) != "")
            {
                if (s != "")
                {
                    s += ", ";
                }
                s += ToSQL.EmptyNull(A.City);
            }
            if (ToSQL.EmptyNull(A.State) != "")
            {
                if (s != "")
                {
                    s += ", ";
                }
                s += ToSQL.EmptyNull(A.State);
            }
            if (ToSQL.EmptyNull(A.ZipCode) != "")
            {
                if (s != "")
                {
                    s += ", ";
                }
                s += ToSQL.EmptyNull(A.ZipCode);
            }
            if (ToSQL.EmptyNull(A.Country) != "")
            {
                if (s != "")
                {
                    s += ", ";
                }
                s += ToSQL.EmptyNull(A.Country);
            }
            return s;
        }
        public string ShortString(object o)
        {
            string strAddress = ToSQL.EmptyNull(o);
            return ShortString(strAddress);
        }
        public string ShortString(string strAddress)
        {
            return strAddress.Length > 23 ? strAddress.Substring(0, 20) + "..." : strAddress;
        }
    }
}
