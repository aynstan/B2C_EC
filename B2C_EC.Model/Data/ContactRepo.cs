using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using B2C_EC.Model.Objects;

namespace B2C_EC.Model.Data
{
    public class ContactRepo : HelperRepo<Contact>
    {
        public override DbSet<Contact> GetRelatedDbSet()
        {
            return db.Contacts;
        }
        public int CreateContact(Contact C)
        {
            return Create(C);
        }
    }
}
