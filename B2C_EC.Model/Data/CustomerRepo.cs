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
        public List<Customer> GetManagementCustomers(int customerID, string username, string firstName, string lastName, string email, string phone)
        {
            return db.Customers.Where(u => (customerID.Equals(0) || customerID.Equals(null) || u.ID.Equals(customerID))
                                        && (username.Equals("") || username.Equals(null) || u.Username.Contains(username))
                                        && (firstName.Equals("") || firstName.Equals(null) || u.FirstName.Contains(firstName))
                                        && (lastName.Equals("") || lastName.Equals(null) || u.LastName.Contains(lastName))
                                        && (email.Equals("") || email.Equals(null) || u.Email.Contains(email))
                                        && (phone.Equals("") || phone.Equals(null) || u.Phone.Contains(phone))
                                      ).ToList();
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
