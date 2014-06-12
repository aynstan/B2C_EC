using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace B2C_EC.Model.Data
{
    public class UserRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();
        public int CreateUser(User C)
        {
            try
            {
                //if (C.Address != null)
                //{
                //    (new AddressRepo()).CreateAddress(C.Address);
                //    C.Address_ID = C.Address.ID;
                //} 
                this.db.Users.Add(C);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public int DeleteUser(int Id)
        {
            User user = db.Users.Where(u => u.ID == Id).FirstOrDefault();
            db.Entry(user).State = EntityState.Deleted;
            return db.SaveChanges();
        }

        public int UpdateUser(User uOld, User uNew)
        {
            //uOld.Address = uNew.Address;
            (new AddressRepo()).UpdateAddress(uOld.Address, uNew.Address);
            uOld.Email = uNew.Email;
            uOld.FirstName = uNew.FirstName;
            uOld.LastName = uNew.LastName;
            uOld.Password = uNew.Password;
            uOld.Phone = uNew.Phone;
            try
            {
                db.Entry(uOld).State = EntityState.Modified;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

        }
        public User GetUserByLogin(string UserName)
        {
            return (new B2C_ECEntities()).Users.Where(u => u.Username == UserName/* && u.Password == Password*/).FirstOrDefault();
        }


        public User GetUserInfo(int id)
        {
            return db.Users.Where(u => u.ID == id).FirstOrDefault();
        }

        public List<User> GetAllUsers()
        {
            return (new B2C_ECEntities()).Users.ToList();
        }
        public bool DoesEmailExist(string email)
        {
            User user = db.Users.Where(c => c.Email == email).FirstOrDefault();
            return (user != null);
        }
        public bool DoesUsernameExist(string username)
        {
            User user = db.Users.Where(c => c.Username == username).FirstOrDefault();
            return (user != null);
        }
    }
}
