//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1714_Amorgan_2H
{
    using System;
    using System.Collections.Generic;
    
    public partial class Products
    {
        public int ProductsID { get; set; }
        public string Description { get; set; }
        public string Amount { get; set; }
    
        public virtual Location Location { get; set; }
        public virtual Receipt Receipt { get; set; }
    }
}
