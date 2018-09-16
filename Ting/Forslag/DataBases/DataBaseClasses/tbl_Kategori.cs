using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_Kategori
    {
        public int ID { get; set; }
        public string KategoriNavn { get; set; }
        public string KategoriImg { get; set; }
        public string KategoriIkon { get; set; }
        public string KategoriUrl { get; set; }
    }
}
