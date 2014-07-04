using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace B2C_EC.Model.Data
{
    public class OrderHistoryRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public OrderHistory GetById(int Id)
        {
            return db.OrderHistories.Find(Id);
        }
        public int CreateOrderHistory(OrderHistory A)
        {
            try
            {
                db.OrderHistories.Add(A);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int DeleteOrderHistory(int Id)
        {
            OrderHistory order = db.OrderHistories.Where(u => u.ID == Id).FirstOrDefault();
            return DeleteOrderHistory(order);
        }
        public int DeleteOrderHistory(OrderHistory C)
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
        public int UpdateOrderHistory(OrderHistory A)
        {
            try
            {
                db.Entry(A).State = EntityState.Modified;
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public List<OrderHistory> GetManagementOrderHistories(int orderID, int orderStatus)
        {
            return db.OrderHistories.Where(u => (orderID.Equals(0) || orderID.Equals(null) || u.Order_ID.Equals(orderID))
                                        && (orderStatus.Equals(0) || orderStatus.Equals(null) || u.OrderStatus_ID.Equals(orderStatus))
                                        ).ToList();
        }
    }
}
