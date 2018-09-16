using DataBases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Master_Care_Forslag.Controllers
{
    public class HomeController : Controller
    {
        DataContext db = new DataContext();
        // GET: Home
        public ActionResult Index()
        {
            Models.HomeViewModel ViewModel = new Models.HomeViewModel();

            ViewModel.CategoryList = db.Kategori.ToList();
            ViewModel.NewsList = db.Nyheder.OrderByDescending(n => n.NyhedsDato).Take(3).ToList();

            return View(ViewModel);
        }
        public ActionResult Navigation()
        {
            Models.HomeViewModel MenuViewModel = new Models.HomeViewModel();

            MenuViewModel.MenuList = db.Menu.ToList();
            MenuViewModel.SubMenuList = db.SubMenu.ToList();
            MenuViewModel.CategoryList = db.Kategori.ToList();

            return View(MenuViewModel);
        }
        [Route("human-handling-bank")]
        public ActionResult Kategorioversigt()
        {
            Models.HomeViewModel CategoriesViewModel = new Models.HomeViewModel();

            CategoriesViewModel.CategoryList = db.Kategori.ToList();

            return View(CategoriesViewModel);
        }

        [Route("human-handling-bank/{id}")]
        public ActionResult Kategori(string id)
        {
            if (id != null)
            {
                Models.HomeViewModel CategoryViewModel = new Models.HomeViewModel();

                var CatName = CategoryViewModel.Category = db.Kategori.Where(c => c.KategoriUrl == id).FirstOrDefault();


                if (CatName == null)
                {
                    return RedirectToAction("Kategorioversigt");
                }
                else
                {
                    var CatNameLower = CatName.KategoriUrl.ToLower();
                    if (id == CatNameLower)
                    {
                        CategoryViewModel.Category = db.Kategori.Where(c => c.KategoriUrl == id).FirstOrDefault();
                        CategoryViewModel.SubCategoryList = db.UnderKategori.Where(s => s.FK_KategoriID == CategoryViewModel.Category.ID).ToList();

                        return View(CategoryViewModel);
                    }
                    else
                    {
                        return RedirectToAction("Kategorioversigt");
                    }
                }
            }
            else
            {
                return RedirectToAction("Kategorioversigt");
            }
        }
        [Route("human-handling-bank/{id}/{subcategory}")]
        public ActionResult Underkategori(string id, string subcategory)
        {
            if (subcategory != null)
            {
                Models.HomeViewModel ProduktViewModel = new Models.HomeViewModel();

                var CatName = ProduktViewModel.SubCategory = db.UnderKategori.Where(c => c.UnderKategoriUrl == subcategory).FirstOrDefault();

                if (CatName == null)
                {
                    return RedirectToAction("Kategorioversigt");
                }
                else
                {
                    var SubCatNameLower = CatName.UnderKategoriUrl.ToLower();
                    if (subcategory == SubCatNameLower)
                    {
                        ProduktViewModel.SubCategory = db.UnderKategori.Where(c => c.UnderKategoriUrl == subcategory).FirstOrDefault();
                        ProduktViewModel.FK_Product_VariationList = db.FK_Produkt_Variation.ToList();
                        ProduktViewModel.FK_Produkt_UnderkategoriList = db.FK_Produkt_Underkategori.Where(p => p.FK_UnderkategoriID == ProduktViewModel.SubCategory.ID).ToList();

                        return View(ProduktViewModel);
                    }
                    else
                    {
                        return RedirectToAction("Kategorioversigt");
                    }
                }
            }
            else
            {
                return RedirectToAction("Kategorioversigt");
            }
        }
        [Route("human-handling-bank/{id}/alle-produkter")]
        public ActionResult AlleProdukter(string id)
        {
            if (id != null)
            {
                Models.HomeViewModel CategoryViewModel = new Models.HomeViewModel();

                var CatName = CategoryViewModel.Category = db.Kategori.Where(c => c.KategoriUrl == id).FirstOrDefault();

                if (CatName == null)
                {
                    return RedirectToAction("Kategorioversigt");
                }
                else
                {
                    var CatNameLower = CatName.KategoriUrl.ToLower();
                    if (id == CatNameLower)
                    {
                        CategoryViewModel.Category = db.Kategori.Where(c => c.KategoriUrl == id).FirstOrDefault();
                        CategoryViewModel.SubCategoryList = db.UnderKategori.Where(c => c.FK_KategoriID == CategoryViewModel.Category.ID).ToList();
                        CategoryViewModel.ProductList = db.Produkt.Where(s => s.FK_KategoriID == CategoryViewModel.Category.ID).ToList();

                        return View(CategoryViewModel);
                    }
                    else
                    {
                        return RedirectToAction("Kategorioversigt");
                    }
                }
            }
            else
            {
                return RedirectToAction("Kategorioversigt");
            }
        }
        [Route("human-handling-bank/{id}/{category}/produkt/{product}")]
        public ActionResult Produkt(string id, string product, string category)
        {
            if (product != null)
            {
                Models.HomeViewModel ProduktViewModel = new Models.HomeViewModel();

                var ProductName = ProduktViewModel.FK_Product_Varation = db.FK_Produkt_Variation.Where(c => c.Produkt.ProduktUrl == product).FirstOrDefault();

                if (ProductName == null)
                {
                    return RedirectToAction("Kategorioversigt");
                }
                else
                {
                    var ProductNameLower = ProductName.Produkt.ProduktUrl.ToLower();
                    if (product == ProductNameLower)
                    {
                        ProduktViewModel.FK_Product_Varation = db.FK_Produkt_Variation.Where(c => c.Produkt.ProduktUrl == product).FirstOrDefault();
                        ProduktViewModel.FK_Variation_Underkategori = db.FK_Variation_Underkategori.Where(u => u.Underkategori.UnderKategoriUrl == category).FirstOrDefault();
                        ProduktViewModel.FK_Product_VariationList = db.FK_Produkt_Variation.Where(p => p.Produkt.ID == ProduktViewModel.FK_Product_Varation.FK_ProduktID).ToList();
                        ProduktViewModel.FK_Variation_UnderkategoriList = db.FK_Variation_Underkategori.Where(p => p.FK_VariationID == ProduktViewModel.FK_Product_Varation.ID).ToList();

                        return View(ProduktViewModel);
                    }
                    else
                    {
                        return RedirectToAction("Kategorioversigt");
                    }
                }
            }
            else
            {
                return RedirectToAction("Kategorioversigt");
            }
        }
        [HttpPost]
        public ActionResult Produkt(int hminr)
        {
            DataBases.DataBaseClasses.tbl_FK_Produkt_Variation VariationHMI = new DataBases.DataBaseClasses.tbl_FK_Produkt_Variation();

            VariationHMI = db.FK_Produkt_Variation.Where(v => v.VariationHMInummer == hminr).FirstOrDefault();

            if (VariationHMI != null)
            {
                return Json(new { variation = VariationHMI, success = true }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult TilfoejKurv(Models.GemKurvViewModel ViewModel)
        {
            DataBases.DataBaseClasses.tbl_FK_Produkt_Variation hminr = new DataBases.DataBaseClasses.tbl_FK_Produkt_Variation();
            hminr = db.FK_Produkt_Variation.Where(h => h.VariationHMInummer == ViewModel.HMInr).FirstOrDefault();

            Models.KurvViewModel KurvViewModel = new Models.KurvViewModel();
            List<Models.KurvViewModel> KurvItems = new List<Models.KurvViewModel>();


            KurvViewModel.FK_Produkt_Variation = hminr;
            KurvViewModel.Antal = ViewModel.Antal;

            //var kurv = (List<Models.KurvViewModel>)Session["Kurv"];

            Session["Kurv"] = "Hej";

            //if (Session["Kurv"] != null)
            //{
            //    kurv.Add(KurvViewModel);
            //    Session["Kurv"] = kurv;
            //}
            //else
            //{
            //    Session["Kurv"] = hminr;
            //}

            return RedirectToAction("Cart", "Home");
        }
        public ActionResult ProduktData(int VariationID)
        {
            DataBases.DataBaseClasses.tbl_FK_Produkt_Variation VariationHMI = new DataBases.DataBaseClasses.tbl_FK_Produkt_Variation();

            VariationHMI = db.FK_Produkt_Variation.Where(v => v.VariationHMInummer == VariationID).FirstOrDefault();

            if (VariationHMI != null)
            {
                return Json(new { variation = VariationHMI, success = true }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }
        }
        [Route("master-academy")]
        public ActionResult MasterAcademy()
        {
            Models.HomeViewModel AcademyViewModel = new Models.HomeViewModel();

            AcademyViewModel.TekstList = db.Tekst.Where(t => t.FK_TekstAlias == 1).ToList();

            return View(AcademyViewModel);
        }
        [Route("nyheder")]
        public ActionResult Nyheder()
        {
            Models.HomeViewModel NewsViewModel = new Models.HomeViewModel();

            NewsViewModel.NewsList = db.Nyheder.OrderByDescending(n => n.NyhedsDato).ToList();

            return View(NewsViewModel);
        }
        [Route("om-master-care")]
        public ActionResult OmMasterCare()
        {
            Models.HomeViewModel AboutViewModel = new Models.HomeViewModel();

            AboutViewModel.TekstList = db.Tekst.Where(t => t.FK_TekstAlias == 2).ToList();

            return View(AboutViewModel);
        }
        [Route("ønskeseddel")]
        public ActionResult Cart()
        {
            Models.HomeViewModel CartViewModel = new Models.HomeViewModel();

            //CartViewModel.KurvViewModel = (List<Models.KurvViewModel>)Session["Kurv"];

            Session["Kurv"] = "HEJ";

            return View(CartViewModel);
        }
    }
}