using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class OrderRepo
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public Order GetById(int Id)
        {
            return db.Orders.Find(Id);
        }
        public List<Order> GetAllOrder()
        {
            return db.Orders.ToList();
        }
        public int CreateOrder(Order C)
        {
            try
            {
                this.db.Orders.Add(C);
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public int DeleteOrder(int Id)
        {
            Order order = db.Orders.Where(u => u.ID == Id).FirstOrDefault();
            return DeleteOrder(order);
        }
        public int DeleteOrder(Order C)
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
        public int UpdateOrder(Order C)
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
        public List<Order> GetManagementOrders(int orderID, DateTime? fromdate,DateTime? todate, int orderStatus, int customerID)
        {
            return db.Orders.Where(u => (orderID.Equals(0) || orderID.Equals(null) || u.ID.Equals(orderID))
                                        && (fromdate.Equals(null) || u.DateCreated >= fromdate)
                                        && (todate.Equals(null) || u.DateCreated <= todate)
                                        && (orderStatus.Equals(0) || orderStatus.Equals(null) || u.OrderStatus_ID.Equals(orderStatus))
                                        && (customerID.Equals(0) || customerID.Equals(null) || u.Customer_ID.Value.Equals(customerID))
                                      ).ToList();
        }
    }
}
