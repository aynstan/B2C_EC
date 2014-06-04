using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using B2C_EC.Model.Objects;

namespace B2C_EC.Model.Data
{
    public interface IHelperRepo<T> where T : DomainObject<T>
    {
        /*int Create(T obj);
        int Update(T obj);*/
    }
    public abstract class HelperRepo<T> : IHelperRepo<T> where T : DomainObject<T>
    {
        private static B2C_ECEntities _instance;
        public static B2C_ECEntities GetInstance()
        {
            if (_instance == null)
                _instance = new B2C_ECEntities();
            return _instance;
        }
        protected static B2C_ECEntities db = GetInstance();
        // BAD: generic repository pattern; non-specialized CRUD methods can conflict with custom DDD logic needs
        // but they can be overridden as needed

        protected DbSet<T> DbSet { get { return this.GetRelatedDbSet(); } }

        public virtual DbSet<T> GetRelatedDbSet()
        {
            throw new NotImplementedException();
        }

        public virtual int Create(T obj)
        {
            try
            {
                if (ValidateCreate(obj))
                {
                    this.DbSet.Add(obj);
                    return db.SaveChanges();
                }
                return 0;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        protected virtual bool ValidateCreate(T obj)
        {
            return true;
        }

        public virtual int Update(int id)
        {
            try
            {
                T obj = this.GetById(id);
                return this.Update(obj);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public virtual int Update(T obj)
        {
            try
            {
                if (ValidateUpdate(obj))
                {
                    db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                    return db.SaveChanges();
                }
                return 0;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        protected virtual bool ValidateUpdate(T obj)
        {
            return true;
        }

        public virtual int Remove(int id)
        {
            try
            {
                T obj = this.GetById(id);
                return this.Remove(obj);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public virtual int Remove(T obj)
        {
            try
            {
                if (ValidateRemove(obj))
                {
                    this.DbSet.Remove(obj);
                    return db.SaveChanges();
                }
                return 0;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        protected virtual bool ValidateRemove(T obj)
        {
            return true;
        }

        public virtual T GetById(int id)
        {
            return this.DbSet.Find(id);
        }

        public virtual List<T> GetAll()
        {
            return this.DbSet.ToList();
        }

    }
}
