using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class ManufacturerRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public Manufacturer GetById(int Id)
        {
            return db.Manufacturers.Find(Id);
        }
        public List<Manufacturer> GetAllManufacturer()
        {
            return db.Manufacturers.ToList();
        }
        public int CreateManufacturer(Manufacturer C)
        {
            try
            {
                this.db.Manufacturers.Add(C);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int DeleteManufacturer(int Id)
        {
            Manufacturer customer = db.Manufacturers.Where(u => u.ID == Id).FirstOrDefault();
            return DeleteManufacturer(customer);
        }
        public int DeleteManufacturer(Manufacturer C)
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
        public int UpdateManufacturer(Manufacturer C)
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
        public List<Manufacturer> GetManagementManufacturers(int manufacturerID, string name, string phone, string website)
        {
            return db.Manufacturers.Where(u => (manufacturerID.Equals(0) || manufacturerID.Equals(null) || u.ID.Equals(manufacturerID))
                                        && (name.Equals("") || name.Equals(null) || u.Name.Contains(name))
                                        && (phone.Equals("") || phone.Equals(null) || u.Phone.Contains(phone))
                                        && (website.Equals("") || website.Equals(null) || u.Website.Contains(website))
                                      ).ToList();
        }
    }
}
