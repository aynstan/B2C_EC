using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using B2C_EC.Model.Global;

namespace B2C_EC.Website
{
    public class CheckFileShared
    {
        public static bool CheckImageExist(string image)
        {
            if (System.IO.File.Exists(HttpContext.Current.Server.MapPath("~/Resources/ImagesProduct/" + image)))
            {
                return true;
            }
            return false;
        }

        public static string ShortString(string s)
        {
            if (s.Length <= 20)
                return s;
            else
                return s.Substring(0, 18) + "...";
        }

        public static string ShortString(object o)
        {
            string s = ToSQL.EmptyNull(o);
            return ShortString(s);
        }
    }
}