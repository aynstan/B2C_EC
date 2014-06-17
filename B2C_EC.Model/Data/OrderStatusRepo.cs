using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace B2C_EC.Model.Data
{
    public class OrderStatusRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public OrderStatu GetById(int Id)
        {
            return db.OrderStatus.Find(Id);
        }
        public List<OrderStatu> GetAllOrderStatu()
        {
            return db.OrderStatus.ToList();
        }
        public int CreateOrderStatu(OrderStatu C)
        {
            try
            {
                this.db.OrderStatus.Add(C);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int DeleteOrderStatu(int Id)
        {
            OrderStatu orderStatus = db.OrderStatus.Where(u => u.ID == Id).FirstOrDefault();
            return DeleteOrderStatu(orderStatus);
        }
        public int DeleteOrderStatu(OrderStatu C)
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
        public int UpdateOrderStatu(OrderStatu C)
        {
            try
            {
                var v = GetById(C.ID);
                if (v == null)
                {
                    return CreateOrderStatu(C);
                }
                else
                {
                    db.Entry(v).CurrentValues.SetValues(C);
                    //db.Entry(C).State = EntityState.Modified;
                    return db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
