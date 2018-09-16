using DataBases.DataBaseClasses;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBases
{
    public class DataContext : DbContext
    {
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
        public DataContext() : base("dbConn")
        {
            Database.SetInitializer<DataContext>(null);
        }
        public DbSet<tbl_Kategori> Kategori { get; set; }
        public DbSet<tbl_UnderKategori> UnderKategori { get; set; }
        public DbSet<tbl_Menu> Menu { get; set; }
        public DbSet<tbl_SubMenu> SubMenu { get; set; }
        public DbSet<tbl_Nyheder> Nyheder { get; set; }
        public DbSet<tbl_Produkt> Produkt { get; set; }
        public DbSet<tbl_Variation> Variation { get; set; }
        public DbSet<tbl_FK_Produkt_Variation> FK_Produkt_Variation { get; set; }
        public DbSet<tbl_FK_Variation_Underkategori> FK_Variation_Underkategori { get; set; }
        public DbSet<tbl_FK_Produkt_Underkategori> FK_Produkt_Underkategori { get; set; }
        public DbSet<tbl_Tekst> Tekst { get; set; }
        public DbSet<tbl_TekstAlias> TekstAlias { get; set; }
        public DbSet<tbl_KontaktInfo> KontaktInfo { get; set; }
    }
}
