using DataBases.DataBaseClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Master_Care_Forslag.Models
{
    public class HomeViewModel
    {
        public List<tbl_Kategori> CategoryList { get; set; }
        public tbl_Kategori Category { get; set; }

        public List<tbl_UnderKategori> SubCategoryList { get; set; }
        public tbl_UnderKategori SubCategory { get; set; }

        public List<tbl_Menu> MenuList { get; set; }
        public tbl_Menu Menu { get; set; }

        public List<tbl_SubMenu> SubMenuList { get; set; }
        public tbl_SubMenu SubMenu { get; set; }

        public List<tbl_Nyheder> NewsList { get; set; }
        public tbl_Nyheder News { get; set; }

        public List<tbl_Produkt> ProductList { get; set; }
        public tbl_Produkt Product { get; set; }

        public List<tbl_Variation> VariationList { get; set; }
        public tbl_Variation Variation { get; set; }

        public List<tbl_FK_Variation_Underkategori> FK_Variation_UnderkategoriList { get; set; }
        public tbl_FK_Variation_Underkategori FK_Variation_Underkategori { get; set; }

        public List<tbl_FK_Produkt_Variation> FK_Product_VariationList { get; set; }
        public tbl_FK_Produkt_Variation FK_Product_Varation { get; set; }

        public List<tbl_FK_Produkt_Underkategori> FK_Produkt_UnderkategoriList { get; set; }
        public tbl_FK_Produkt_Underkategori FK_Produkt_Underkategori { get; set; }

        public List<tbl_Tekst> TekstList { get; set; }
        public tbl_Tekst Tekst { get; set; }

        public List<tbl_TekstAlias> TekstAliasList { get; set; }
        public tbl_TekstAlias TekstAlias { get; set; }

        public List<KurvViewModel> KurvViewModel { get; set; }
    }
}