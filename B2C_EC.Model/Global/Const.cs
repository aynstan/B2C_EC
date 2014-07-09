using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Global
{
    public class Const
    {
        //Order status
        public static int Pendding = 1;
        public static int Submitted = 2;
        public static int Shipping = 3;
        public static int Cancelled = 4;
        public static int Completed = 5;
        //Payment
        public static int OnlinePayment = 1;
        public static int Delivery = 2;
        public static int Office = 3;
    }
}
