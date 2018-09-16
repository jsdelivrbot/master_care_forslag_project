using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_Menu
    {
        public int ID { get; set; }
        public string MenuNavn { get; set; }
        public string MenuUrl { get; set; }
        public bool VisKategori { get; set; }
    }
}
