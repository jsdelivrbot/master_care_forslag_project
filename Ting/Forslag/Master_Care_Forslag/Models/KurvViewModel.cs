using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Master_Care_Forslag.Models
{
    public class KurvViewModel
    {
        public DataBases.DataBaseClasses.tbl_FK_Produkt_Variation FK_Produkt_Variation { get; set; }
        public int Antal { get; set; }
    }
}