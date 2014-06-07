using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using B2C_EC.Model;
using B2C_EC.Model.Global;

namespace B2C_EC.Website
{
    public class Cart
    {
        public Cart(List<Cart> carts)
        {
            this.Carts = carts;
            if (carts == null)
                this.Carts = new List<Cart>();
            this.Quantity = 1;
        }
        public int ProductID { get; set; }   //key
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public string Image { get; set; }
        public List<Cart> Carts { get; set; }

        public decimal TotalPrice
        {
            get
            {
                decimal tt = 0;
                tt = Carts.Sum(x => x.Quantity * x.Price);
                return tt;
            }
        }
        public int TotalQuantity
        {
            get
            {
                int tt = 0;
                tt = Carts.Sum(x => x.Quantity);
                return tt;
            }
        }
        public int TotalProduct
        {
            get
            {
                int tt = 0;
                tt = Carts.Count;
                return tt;
            }
        }

        public List<Cart> Add(Cart cart)
        {
            var obj = Carts.FirstOrDefault(x => x.ProductID == cart.ProductID);
            if (obj != null) obj.Quantity++;
            else Carts.Add(cart);
            return Carts;
        }
        public List<Cart> Remove(int ProductID)
        {
            var obj = Carts.FirstOrDefault(x => x.ProductID == ProductID);
            if (obj != null) Carts.Remove(obj);
            return Carts;
        }
        public List<Cart> Update(int ProductID, int Quantity)
        {            
            var obj = Carts.FirstOrDefault(x => x.ProductID == ProductID);
            if (obj != null) obj.Quantity = Quantity;
            return Carts;
        }
        public Cart ConverProductToCart(Product product)
        {
            this.ProductID = product.ID;
            this.ProductName = product.Name;
            this.Price = product.PriceNew;
            return this;
        }
    }
}