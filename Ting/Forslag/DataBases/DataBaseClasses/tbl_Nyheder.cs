using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_Nyheder
    {
        public int ID { get; set; }
        public string NyhedsNavn { get; set; }
        public string NyhedsTekst { get; set; }
        public string NyhedsImg { get; set; }
        public DateTime NyhedsDato { get; set; }
        public string NyhedsUrl { get; set; }
    }
}
