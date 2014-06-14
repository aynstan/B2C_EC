using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace B2C_EC.Model.Data
{
    public class CustomerRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public Customer GetById(int Id)
        {
            return db.Customers.Find(Id);
        }
        public List<Customer> GetAllCustomer()
        {
            return db.Customers.ToList();
        }
        public int CreateCustomer(Customer C)
        {
            try
            {
                this.db.Customers.Add(C);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int DeleteCustomer(int Id)
        {
            Customer customer = db.Customers.Where(u => u.ID == Id).FirstOrDefault();
            return DeleteCustomer(customer);
        }
        public int DeleteCustomer(Customer C)
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
        public int UpdateCustomer(Customer C)
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
        public Customer GetCustomerByUsername(string username)
        {
            Customer customer = db.Customers.Where(g => g.Username == username).FirstOrDefault();
            return customer;
        }        
        public bool DoesEmailExist(string email)
        {
            Customer customer = db.Customers.Where(c => c.Email == email).FirstOrDefault();
            return (customer != null);
        }
        public bool DoesUsernameExist(string username)
        {
            Customer customer = db.Customers.Where(c => c.Username == username).FirstOrDefault();
            return (customer != null);
        }
    }
}
