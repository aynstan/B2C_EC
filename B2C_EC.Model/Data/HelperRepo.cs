using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public interface IHelperRepo<T> where T : DomainObject<T>
    {
        /*int Create(T obj);
        int Update(T obj);*/
    }
    public abstract class HelperRepo<T> : IHelperRepo<T> where T : DomainObject<T>
    {
        protected static B2C_ECEntities db = new B2C_ECEntities();

        // BAD: generic repository pattern; non-specialized CRUD methods can conflict with custom DDD logic needs
        // but they can be overridden as needed

        protected DbSet<T> DbSet { get { return this.GetRelatedDbSet(); } }

        public virtual DbSet<T> GetRelatedDbSet()
        {
            throw new NotImplementedException();
        }

        public virtual int Create(T obj)
        {
            if (ValidateCreate(obj))
            {
                this.GetRelatedDbSet().Add(obj);
                return db.SaveChanges();
            }
            return 0;
        }

        protected virtual bool ValidateCreate(T obj)
        {
            return true;
        }

        public virtual int Update(int id)
        {
            T obj = this.GetById(id);
            return this.Update(obj);
        }
        public virtual int Update(T obj)
        {
            if (ValidateUpdate(obj))
            {
                db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                return db.SaveChanges();
            }
            return 0;
        }

        protected virtual bool ValidateUpdate(T obj)
        {
            return true;
        }

        public virtual int Remove(int id)
        {
            T obj = this.GetById(id);
            return this.Remove(obj);
        }

        public virtual int Remove(T obj)
        {
            if (ValidateRemove(obj))
            {
                this.DbSet.Remove(obj);
                return db.SaveChanges();
            }
            return 0;
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
