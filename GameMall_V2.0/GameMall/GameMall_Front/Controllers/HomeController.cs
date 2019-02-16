using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GameMall_Front.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GoodsDetail()
        {
            return View();
        }
        public ActionResult AllGoods()
        {
            return View();
        }
    }
}