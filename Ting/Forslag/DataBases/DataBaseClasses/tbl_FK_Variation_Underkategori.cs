using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_FK_Variation_Underkategori
    {
        public int ID { get; set; }
        public int FK_VariationID { get; set; }
        [ForeignKey("FK_VariationID")]
        public virtual tbl_FK_Produkt_Variation FK_Produkt_Variation { get; set; }
        public int FK_UnderkategoriID { get; set; }
        [ForeignKey("FK_UnderkategoriID")]
        public virtual tbl_UnderKategori Underkategori { get; set; }
    }
}
