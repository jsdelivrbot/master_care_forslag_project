using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_FK_Produkt_Underkategori
    {
        public int ID { get; set; }
        public int FK_ProduktID { get; set; }
        [ForeignKey("FK_ProduktID")]
        public virtual tbl_Produkt Produkt { get; set; }
        public int FK_UnderkategoriID { get; set; }
        [ForeignKey("FK_UnderkategoriID")]
        public virtual tbl_UnderKategori Underkategori { get; set; }
    }
}
