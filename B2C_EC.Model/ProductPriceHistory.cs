//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace B2C_EC.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProductPriceHistory
    {
        public int ID { get; set; }
        public int Product_ID { get; set; }
        public decimal Price { get; set; }
        public System.DateTime DateCreated { get; set; }
    
        public virtual Product Product { get; set; }
    }
}