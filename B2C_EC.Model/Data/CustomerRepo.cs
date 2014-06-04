using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace B2C_EC.Model.Data
{
    public class CustomerRepo : HelperRepo<Customer>
    {
        public override DbSet<Customer> GetRelatedDbSet()
        {
            return db.Customers;
        }
        public int CreateCustomer(Customer C)
        {
            return Create(C);
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
