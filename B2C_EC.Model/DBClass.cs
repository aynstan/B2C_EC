using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model
{
    public class DBClass
    {
        B2C_ECEntities db = new B2C_ECEntities();
        public void abc()
        {
            db.Products.ToList();
        }
    }
}
