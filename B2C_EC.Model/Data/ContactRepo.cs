using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class ContactRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public Contact GetById(int Id)
        {
            return db.Contacts.Find(Id);
        }
        public List<Contact> GetAllContact()
        {
            return db.Contacts.ToList();
        }
        public int CreateContact(Contact C)
        {
            try
            {
                this.db.Contacts.Add(C);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int DeleteContact(int Id)
        {
            Contact order = db.Contacts.Where(u => u.ID == Id).FirstOrDefault();
            return DeleteContact(order);
        }
        public int DeleteContact(Contact C)
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
        public int UpdateContact(Contact C)
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
        public List<Contact> GetManagementContacts(DateTime? fromdate, DateTime? todate)
        {
            return db.Contacts.Where(u => (fromdate.Equals(null) || u.DateCreated >= fromdate)
                                        && (todate.Equals(null) || u.DateCreated <= todate)
                                      ).ToList();
        }
    }
}
