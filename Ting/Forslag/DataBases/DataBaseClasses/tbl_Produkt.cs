using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_Produkt
    {
        public int ID { get; set; }
        public string ProduktNavn { get; set; }
        public string ProduktTekst { get; set; }
        public string ProduktVideo { get; set; }
        public string ProduktImg { get; set; }
        public string ProduktUrl { get; set; }
        public string ProduktVejledning { get; set; }
        public int FK_VejledningID { get; set; }

        public int FK_KategoriID { get; set; }
        [ForeignKey("FK_KategoriID")]
        public virtual tbl_Kategori Kategori { get; set; }

        public int VariationAntal { get; set; }
    }
}
