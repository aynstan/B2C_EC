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
        
        public User GetById(int Id)
        {
            return db.Users.Find(Id);
        }
        public List<User> GetAllUser()
        {
            return db.Users.ToList();
        }
        public int CreateUser(User U)
        {
            try
            {
                this.db.Users.Add(U);
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
            return DeleteUser(user);
        }
        public int DeleteUser(User U)
        {
            try
            {
                db.Entry(U).State = EntityState.Deleted;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int UpdateUser(User U)
        {
            try
            {
                db.Entry(U).State = EntityState.Modified;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public User GetUserByUsername(string username)
        {
            return db.Users.Where(u => u.Username == username).FirstOrDefault();
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

        public List<User> GetManagementUsers(string FName, string LName, string Email, string UserName, bool IsActive)
        {
            return db.Users.Where(u => u.FirstName.Contains(FName) && u.LastName.Contains(LName) && u.Email.Contains(Email) && u.Username.Contains(UserName) && u.IsActive == IsActive).ToList();
        }
    }
}
