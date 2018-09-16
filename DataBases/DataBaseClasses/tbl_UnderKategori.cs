using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_UnderKategori
    {
        public int ID { get; set; }
        public string UnderKategoriNavn { get; set; }
        public string UnderKategoriTekst { get; set; }
        public string UnderKategoriVideo { get; set; }
        public string UnderKategoriUrl { get; set; }

        public int FK_KategoriID { get; set; }
        [ForeignKey("FK_KategoriID")]
        public virtual tbl_Kategori Kategori { get; set; }
    }
}
