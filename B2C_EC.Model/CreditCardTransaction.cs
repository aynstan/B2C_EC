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
    
    public partial class CreditCardTransaction
    {
        public int ID { get; set; }
        public Nullable<bool> IsDemo { get; set; }
        public Nullable<System.DateTime> TransactionDate { get; set; }
        public string CreditCardNumber { get; set; }
        public Nullable<System.DateTime> ExpirationDate { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public string OriginalReferenceKey { get; set; }
        public Nullable<int> Result { get; set; }
        public string ReferenceKey { get; set; }
        public string ResponseMessage { get; set; }
        public string AuthorizationCode { get; set; }
        public string Comment { get; set; }
        public Nullable<int> Order_ID { get; set; }
    
        public virtual Order Order { get; set; }
    }
}
