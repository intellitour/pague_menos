//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PagueMenos.DataAccess.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class gtin
    {
        public string GTIN_CD { get; set; }
        public int GTIN_LEVEL_CD { get; set; }
        public string GCP_CD { get; set; }
        public string BSIN { get; set; }
        public string GPC_S_CD { get; set; }
        public string GPC_F_CD { get; set; }
        public string GPC_C_CD { get; set; }
        public string GPC_B_CD { get; set; }
        public string GTIN_NM { get; set; }
        public string PRODUCT_LINE { get; set; }
        public Nullable<float> M_G { get; set; }
        public Nullable<float> M_OZ { get; set; }
        public Nullable<float> M_ML { get; set; }
        public Nullable<float> M_FLOZ { get; set; }
        public Nullable<float> M_ABV { get; set; }
        public Nullable<float> M_ABW { get; set; }
        public int PKG_UNIT { get; set; }
        public Nullable<int> PKG_TYPE_CD { get; set; }
        public string REF_CD { get; set; }
        public string SOURCE { get; set; }
        public Nullable<int> IMG { get; set; }
    }
}
