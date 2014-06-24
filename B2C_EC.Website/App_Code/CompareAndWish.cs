using B2C_EC.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace B2C_EC.Website.App_Code
{
    public class CompareAndWish
    {
        List<Product> danhsach;

        public List<Product> DanhSach
        {
            get { return danhsach; }
            set { danhsach = value; }
        }

        public CompareAndWish()
        {
            DanhSach = new List<Product>();
        }

        public int Search(int ID)
        {
            for (int i = 0; i < DanhSach.Count; i++)
            {
                if (DanhSach[i].ID == ID)
                    return i;
            }
            return -1;
        }

        public bool Add(Product p)
        {
            int index = Search(p.ID);
            if (index == -1)
            {
                DanhSach.Add(p);
                return true;
            }
            return false;
        }

        public void Remove(Product p)
        {
            int index = Search(p.ID);
            if (index != -1)
            {
                DanhSach.RemoveAt(index);
            }
        }

        public void Remove(int id)
        {
            int index = Search(id);
            if (index != -1)
            {
                DanhSach.RemoveAt(index);
            }
        }
    }
}