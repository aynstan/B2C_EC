using B2C_EC.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace B2C_EC.Website
{
    public class CompareAndWish
    {
        List<Product> products;

        public List<Product> Products
        {
            get { return products; }
            set { products = value; }
        }

        public CompareAndWish()
        {
            Products = new List<Product>();
        }

        public int Search(int ID)
        {
            //for (int i = 0; i < Products.Count; i++)
            //{
            //    if (Products[i].ID == ID) 
            //        return i;
            //}
            //return -1;
            return Products.FindIndex(x => x.ID == ID);
        }

        public bool Add(Product p)
        {
            int index = Search(p.ID);
            if (index == -1)
            {
                Products.Add(p);
                return true;
            }
            return false;
        }

        public void Remove(Product p)
        {
            int index = Search(p.ID);
            if (index != -1)
            {
                Products.RemoveAt(index);
            }
        }

        public void Remove(int id)
        {
            int index = Search(id);
            if (index != -1)
            {
                Products.RemoveAt(index);
            }
        }
    }
}