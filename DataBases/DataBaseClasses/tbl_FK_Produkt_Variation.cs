using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_FK_Produkt_Variation
    {
        public int ID { get; set; }
        public int FK_ProduktID { get; set; }
        [ForeignKey("FK_ProduktID")]
        public virtual tbl_Produkt Produkt { get; set; }
        public int FK_VariationID { get; set; }
        [ForeignKey("FK_VariationID")]
        public virtual tbl_Variation Variation { get; set; }
        public string VariationInfo { get; set; }
        public string VariationVarenummer { get; set; }
        public int VariationHMInummer { get; set; }
        public string VariationImg { get; set; }
    }
}
