using GameMall_Back.ViewModels.Order;
using GameMall_Data.Data;
using GameMall_Data.Service;
using GameMall_Front.ViewModels.Goods;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GameMall_Front.Controllers
{
    public class FrontGoodsController : Controller
    {
        GoodsService goodsService = new GoodsService();
        UserService userServise = new UserService();
        // GET: Goods
        public ActionResult ItemGoods()
        {
            return View();
        }
        public ActionResult SearchGoods(string searchKey)
        {
            TempData["SearchKey"] = searchKey;
            var allGoods = goodsService.GetAllGoods();
            var allGoodsDTO = allGoods.Select(item => new ViewModelGoods
            {
                GoodsId = item.GoodsId,
                GoodsName = item.GoodsName,
                Detail = item.Detail,
                Configuration = item.Configuration,
                InstallWay = item.InstallWay,
                Type = item.Type,
            }).ToList();
            var searchResult = allGoodsDTO
                    .Where(u => u.GoodsName.Contains(searchKey)).ToList();
            return View(searchResult);
         }
        public ActionResult SearchByType(int type)
        {
            var allGoods = goodsService.GetAllGoods();
            var allGoodsDTO = allGoods.Select(item => new ViewModelGoods
            {
                GoodsId = item.GoodsId,
                GoodsName = item.GoodsName,
                Detail = item.Detail,
                Configuration = item.Configuration,
                InstallWay = item.InstallWay,
                Type = item.Type,
            }).ToList();
            if (type == 0)
            {
                var a = allGoodsDTO.OrderBy(item => item.TotalSales).ToList();
                return PartialView("AllGoods", a);
            }
            var searchResult = allGoodsDTO
                    .Where(u => u.Type == type).ToList();
            return PartialView("SearchGoods", searchResult);

        }   
        public ActionResult MinPrice(int GoodsId)
        {
            var version = goodsService.GetGoodsVersionsByGoodsId(GoodsId);
            var ver = version.OrderBy(item => item.Price);
            var minPriceVersion = new ViewModelVersions()
            {
                ActivationTimes = ver.First().ActivationTimes,
                GoodsId = ver.First().GoodsId,
                Price = ver.First().Price,
                Sell = ver.First().Sell,
                Stock = ver.First().Stock,
                VersionId = ver.First().VersionId,
                VersionImage = ver.First().VersionImage,
                VersionName = ver.First().VersionName,
                WarehouseId = ver.First().WarehouseId,
            };
            return View(minPriceVersion);
        }       
        public ActionResult GoodsDetail(int GoodsId)
        {
            var goodsDetail = goodsService.GetGoodsByGoodsId(GoodsId);
            var goodsDTO = new ViewModelGoods
            {
                GoodsId=goodsDetail.GoodsId,
                GoodsName=goodsDetail.GoodsName,
                Configuration=goodsDetail.Configuration,
                Detail=goodsDetail.Detail,
                InstallWay=goodsDetail.InstallWay,
                TotalSales = goodsDetail.TotalSales,
                Type=goodsDetail.Type,
            };
            return View(goodsDTO);
        }
        public ActionResult GoodsScreenshot(int GoodsId)
        {
            var screenshot = goodsService.GetGoodsScreenshot(GoodsId);
            var screenshotDTO = screenshot.Select(item => new ViewModelScreenshot()
            {
                GoodsId = item.GoodsId,
                Screenshot1=item.Screenshot1,
                ScreenshotId = item.ScreenshotId,
            }).ToList(); 
            return View(screenshotDTO);
        }
        public ActionResult EvaluationList(int GoodsId)
        {
            var evaluations = goodsService.EvaluationList(GoodsId);
            var evaluationsDTO = evaluations.Select(item => new ViewModelEvaluation()
            {
                AdminId = item.AdminId,
                CustomerId = item.CustomerId,
                Evaluate = item.Evaluate,
                EvaluationId = item.EvaluationId,
                OrderId = item.OrderId,
                Reply = item.Reply,
            }).ToList();
            return View(evaluationsDTO);
        }
        public ActionResult CheckIfSell(int goodsId, int versionId)
        {
            var version = goodsService.GetVersionByVersionId(versionId);
            if (version.Sell == 0)
            {
                return PartialView("SoldOut");
            }
            else
            {
                return View(goodsId);
            }
        }
        public ActionResult AddShoppingCar(int goodsId, int orderGoodsNumber, int versionId)
        {
            var customerId = (int)Session["CustomerId"];
            if(goodsService.AddShoppingCar(goodsId, versionId, customerId, orderGoodsNumber))
            {
                return null;
            }
            //return PartialView("FlyToShoppingCar");
            return null;
        }
        public ActionResult AllGoods()
        {
            return View();
        }
        public ActionResult AllGoodsList(int? page)
        {
              var goods = goodsService.GetAllGoods();
            var goodsDTO = goods.Select(item => new ViewModelGoods()
            {
                GoodsId = item.GoodsId,
                Configuration = item.Configuration,
                Detail = item.Detail,
                GoodsName = item.GoodsName,
                InstallWay = item.InstallWay,
                TotalSales = item.TotalSales,
                Type = item.Type,
            }).ToList();

            int pageNumber = page ?? 1;
            int pageSize = 8;
            var list = goodsDTO.ToPagedList(pageNumber, pageSize);
            return View(list);
        }
        public ActionResult HotGoods()
        {
            var hotGoods = goodsService.GetHotGoods();
            List<ViewModelGoods> goods = hotGoods.Select(m => new ViewModelGoods
            {
                GoodsId = m.GoodsId,
                Detail = m.Detail,
                Configuration = m.Configuration,
                GoodsName = m.GoodsName,
                InstallWay = m.InstallWay,
                TotalSales = m.TotalSales,
                Type = m.Type,
            }).ToList();
            return View(goods);
        }

        public ViewResult SingleGames()
        {
            var singleGames =  goodsService.GetGoodsByType(1);
            List<ViewModelGoods> goods = singleGames.Select(m => new ViewModelGoods
            {
                GoodsId = m.GoodsId,
                Detail = m.Detail,
                Configuration = m.Configuration,
                GoodsName = m.GoodsName,
                InstallWay = m.InstallWay,
                TotalSales = m.TotalSales,
                Type = m.Type,
            }).ToList();
            return View(goods);
        }
        public ViewResult NetworkGames()
        {
            var singleGames = goodsService.GetGoodsByType(2);
            List<ViewModelGoods> goods = singleGames.Select(m => new ViewModelGoods
            {
                GoodsId = m.GoodsId,
                Detail = m.Detail,
                Configuration = m.Configuration,
                GoodsName = m.GoodsName,
                InstallWay = m.InstallWay,
                TotalSales = m.TotalSales,
                Type = m.Type,
            }).ToList();
            return View(goods);
        }
        public ViewResult MobileGames()
        {
            var singleGames = goodsService.GetGoodsByType(3);
            List<ViewModelGoods> goods = singleGames.Select(m => new ViewModelGoods
            {
                GoodsId = m.GoodsId,
                Detail = m.Detail,
                Configuration = m.Configuration,
                GoodsName = m.GoodsName,
                InstallWay = m.InstallWay,
                TotalSales = m.TotalSales,
                Type = m.Type,
            }).ToList();
            return View(goods);
        }
        public ActionResult GoodsName(int goodsId)
        {
            var goods = goodsService.GetGoodsByGoodsId(goodsId);
            var goodsDTO = new ViewModelGoods()
            {
                GoodsName = goods.GoodsName,
            };
            return View(goodsDTO);
            //return Content("<span>" + goods.GoodsName + "</span>");
        }
        public ActionResult VersionMes(int versionId)
        {
            var version = goodsService.GetVersionByVersionId(versionId);
            var versionDTO = new ViewModelVersions()
            {
                VersionImage = version.VersionImage,
                VersionId = version.VersionId,
                VersionName = version.VersionName,
                Price = version.Price,
            };
            return View(versionDTO);
        }
        public ActionResult VersionImage(ViewModelGoods goods)
        {
            var version = goodsService.GetGoodsVersionsByGoodsId(goods.GoodsId).First();
            var versionDTO = new ViewModelVersions()
            {
                GoodsId = version.GoodsId,
                Price = version.Price,
                VersionImage = version.VersionImage,
            };
            //List<ViewModelGoodsPhotos> goodsDTO = goodsService.GetGoodsIamgeByGoodsId(goods.GoodsId).Select(item => new ViewModelGoodsPhotos
            //{
            //    GoodsId=item.GoodsId,
            //    GoodsPhoto=item.GoodsPhoto,
            //    PhotoId=item.PhotoId,
            //}).ToList();
            return View(versionDTO);
        }
        //public ActionResult GoodsImages(ViewModelGoods goods)
        //{
        //    List<ViewModelGoodsPhotos> goodsDTO = goodsService.GetGoodsIamgeByGoodsId(goods.GoodsId).Select(item => new ViewModelGoodsPhotos
        //    {
        //        GoodsId = item.GoodsId,
        //        GoodsPhoto = item.GoodsPhoto,
        //        PhotoId = item.PhotoId,
        //    }).ToList();
        //    return View(goodsDTO);
        //}
        public ActionResult Versions(int GoodsId)
        {
            var versions = goodsService.GetGoodsVersionsByGoodsId(GoodsId);
            var versionsDTO = versions.Select(item => new ViewModelVersions
            {
                GoodsId = item.GoodsId,
                Price = item.Price,
                Sell = item.Sell,
                ActivationTimes = item.ActivationTimes,
                Stock = item.Stock,
                VersionId = item.VersionId,
                VersionImage = item.VersionImage,
                VersionName = item.VersionName,
                WarehouseId = item.WarehouseId,
            }).ToList();
            return View(versionsDTO);
        }
    }
}