using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_SubMenu
    {
        public int ID { get; set; }
        public string SubMenuNavn { get; set; }
        public string SubMenuUrl { get; set; }


        public int FK_MenuID { get; set; }
        [ForeignKey("FK_MenuID")]
        public virtual tbl_Menu Menu { get; set; }
    }
}
