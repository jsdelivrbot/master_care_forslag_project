using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_Tekst
    {
        public int ID { get; set; }
        public string Tekst { get; set; }
        public string Overskrift { get; set; }
        public string Billeder { get; set; }
        public int FK_TekstAlias { get; set; }
        [ForeignKey("FK_TekstAlias")]
        public virtual tbl_TekstAlias TekstAlias { get; set; }
    }
}
