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
    
    public partial class nutrition_us
    {
        public string GTIN_CD { get; set; }
        public string INGREDIENTS { get; set; }
        public float SERV_SIZE_G { get; set; }
        public float SERV_SIZE_ML { get; set; }
        public float SERV_CT { get; set; }
        public float CAL { get; set; }
        public float CAL_FROM_FAT { get; set; }
        public float TOT_FAT_G { get; set; }
        public float TOT_FAT_DV { get; set; }
        public float SAT_FAT_G { get; set; }
        public float SAT_FAT_DV { get; set; }
        public float TRANS_FAT_G { get; set; }
        public float CHOL_MG { get; set; }
        public float CHOL_DV { get; set; }
        public float SOD_MG { get; set; }
        public float SOD_DV { get; set; }
        public float POT_MG { get; set; }
        public float POT_DV { get; set; }
        public float TOT_CARB_G { get; set; }
        public float TOT_CARB_DV { get; set; }
        public Nullable<float> DIET_FIBER_G { get; set; }
        public float DIET_FIBER_DV { get; set; }
        public float SUGARS_G { get; set; }
        public float PROTEIN_G { get; set; }
        public float VITAMIN_A { get; set; }
        public float VITAMIN_C { get; set; }
        public float CALCIUM { get; set; }
        public float IRON { get; set; }
        public string SOURCE { get; set; }
        public Nullable<System.DateTime> SYNC_DT { get; set; }
    }
}
