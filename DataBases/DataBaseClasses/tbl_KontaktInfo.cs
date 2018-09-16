using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases.DataBaseClasses
{
    public class tbl_KontaktInfo
    {
        public int ID { get; set; }
        public string FirmaNavn { get; set; }
        public string VejNavn { get; set; }
        public int Postnummer { get; set; }
        public string Bynavn { get; set; }
        public int CVR { get; set; }
        public string Telefonnummer { get; set; }
        public string InfoMail { get; set; }
        public string Åbningstider { get; set; }
    }
}
