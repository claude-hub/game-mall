using GameMall_Back.ViewModels.Goods;
using GameMall_Data.Data;
using GameMall_Data.Service;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GameMall_Back.Controllers
{
    public class GoodsController : Controller
    {
        // GET: Goods
        GoodsService goodsService = new GoodsService();
        ViewModelGoods newGoods = new ViewModelGoods();
        List<ViewModelVersions> vewsions = new List<ViewModelVersions>();
        public ActionResult CreateWarehouse()
        {
            return PartialView();
        }
        public ActionResult GoodsList()
        {
            return View();
        }
        public ActionResult DeleteGoods(int goodsId)
        {
            ViewModelGoods goods = new ViewModelGoods()
            {
                GoodsId = goodsId,
            };
            return View(goods);
        }
        [HttpPost]
        public ActionResult DeleteGoods(ViewModelGoods goods)
        {
             var deleteTip =goodsService.DeleteGoods(goods.GoodsId);
            if (!(deleteTip == null))
            {
                TempData["TipDelete"] = deleteTip;
            }
            else
            {
                TempData["TipDelete"] = "该商品已经产生了订单，不能删除！";
            }
             return RedirectToAction("GoodsList");
        }
        public ActionResult SearchGoods(string searchKey,int? page)
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
            var searchResult = allGoodsDTO
                    .Where(u => u.GoodsName.Contains(searchKey)).ToList();

            int pageNumber = page ?? 1;
            int pageSize = 5;
            var list = searchResult.ToPagedList(pageNumber, pageSize);
            return PartialView("ItemGoods", list);
        }
        public ActionResult ItemVersion(ViewModelGoods goods)
        {
            var goodsVersions = goodsService.GetGoodsVersionsByGoodsId(goods.GoodsId);
            var goodsVersionsDTO = goodsVersions.Select(item => new ViewModelVersions
            {
                GoodsId = item.GoodsId,
                Price = item.Price,
                Stock = item.Stock,
                VersionId = item.VersionId,
                VersionName = item.VersionName,
                ActivationTimes = item.ActivationTimes,
                SalesVolume = item.SalesVolume,
                Sell = item.Sell,
                VersionImage = item.VersionImage,
                WarehouseId = item.WarehouseId,
            }).ToList();
            return View(goodsVersionsDTO);
        }
        public ActionResult ChangeSell(int versionId)
        {
            var ver = goodsService.ChangeSell(versionId);
            var versionDTO = new ViewModelVersions()
            {
                ActivationTimes = ver.ActivationTimes,
                GoodsId = ver.GoodsId,
                Price = ver.Price,
                Sell = ver.Sell,
                Stock = ver.Stock,
                VersionId = ver.VersionId,
                VersionImage = ver.VersionImage,
                VersionName = ver.VersionName,
                WarehouseId = ver.WarehouseId,
            };
            return View(versionDTO);
        }
        public ActionResult AddGoods1(ViewModelGoods goods)
        {
            return PartialView(goods);
        }
        [HttpPost]
        public ActionResult AddGoods1(ViewModelGoods goods, ViewModelVersions version)
        {
            Goods saveGoods = new Goods
            {
                GoodsId = goods.GoodsId,
                GoodsName = goods.GoodsName,
                Type = goods.Type,
                Detail = goods.Detail,
                Configuration = goods.Configuration,
                InstallWay = goods.InstallWay,
            };
            //保存版本图片
            Versions saveVersions = new Versions
            {
                GoodsId = goods.GoodsId,
                VersionName = version.VersionName,
                Price = version.Price,
                VersionId = version.VersionId,
                Stock = version.Stock,
                VersionImage = GetImageFromWeb(),
                ActivationTimes = version.ActivationTimes,
                Sell = version.Sell,
                WarehouseId = version.WarehouseId,
            };
            if(goodsService.AddGoods(saveGoods, saveVersions))
                return PartialView("GoodsList");
            else
            {
                TempData["Error"] = "请填写必填项！！！";
                return PartialView("AddGoods1", new ViewModelGoods { GoodsId = goods.GoodsId });
            }   
        }
        public ActionResult SelectWarehouse(int WarehouseId)
        {
            var allWarehouse = goodsService.GetAllWarehouse();
            var allWarehouseDTO = allWarehouse.Select(item => new ViewModelWarehouse()
            {
                WarehouseName = item.WarehouseName,
                WarehouseId = item.WarehouseId,
                CreatTime = item.CreatTime,
            }).ToList();
            var a = allWarehouseDTO.SingleOrDefault(item => item.WarehouseId == WarehouseId);
            if (a != null)
            {
                a.flag = 1;
            }
            return PartialView(allWarehouseDTO);
        }
        public ActionResult SeeWarehouse(int WarehouseId)
        {
            var allWarehouse = goodsService.GetAllWarehouse();
            var allWarehouseDTO = allWarehouse.Select(item => new ViewModelWarehouse()
            {
                WarehouseName = item.WarehouseName,
                WarehouseId = item.WarehouseId,
                CreatTime = item.CreatTime,
            }).ToList();
            var a = allWarehouseDTO.SingleOrDefault(item => item.WarehouseId == WarehouseId);
            a.flag = 1;
            return View(allWarehouseDTO);
        }
        public ActionResult GoodsVersion(ViewModelGoods goods)
        {
            var goodsVersions = goodsService.GetGoodsVersionsByGoodsId(goods.GoodsId);
            var goodsVersionsDTO = goodsVersions.Select(item => new ViewModelVersions
            {
                GoodsId = item.GoodsId,
                Price = item.Price,
                Stock = item.Stock,
                VersionId = item.VersionId,
                VersionName = item.VersionName,
                VersionImage = item.VersionImage,
                ActivationTimes = item.ActivationTimes,
                WarehouseId = item.WarehouseId,
                Sell = item.Sell,
            }).ToList();
            if (goodsVersionsDTO.Count() == 0)
            {
                var newVersion = new ViewModelVersions();
                goodsVersionsDTO.Add(newVersion);
                return View(goodsVersionsDTO);
            }
            return View(goodsVersionsDTO);
        }
        public ActionResult AddScreenshot(int goodsId)
        {
            return PartialView(goodsId);
        }
        public ActionResult UploadScreenshot(int GoodsId)
        {
            HttpFileCollection uploadFille = System.Web.HttpContext.Current.Request.Files;
            for (int i = 0; i < uploadFille.Count; i++)
            {
                string fileName = uploadFille[i].FileName;
                string fileExt = System.IO.Path.GetExtension(fileName).ToLower();
                string uploadFileName = DateTime.Now.ToString("yyyy-MM-dd HH.mm.ss") + fileExt;
                string directoryPath = Server.MapPath("/Images/Goods/Screenshots/");
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory("/Images/Goods/Screenshots/");
                }
                string filePath = "/Images/Goods/Screenshots";
                string path = Request.MapPath(filePath + "/") + uploadFileName;
                uploadFille[i].SaveAs(path);
                goodsService.AddScreenshot(GoodsId, "http://123.207.242.177:8000/Screenshots/" + uploadFileName);
            }
            return Content("上传成功！");
        }
        public ActionResult EditGoods(int GoodsId)
        {
            var goods = goodsService.GetGoodsByGoodsId(GoodsId);
            var goodsDTO = new ViewModelGoods()
            {
                GoodsId = goods.GoodsId,
                GoodsName = goods.GoodsName,
                Detail = goods.Detail,
                Configuration = goods.Configuration,
                InstallWay = goods.InstallWay,
                Type = goods.Type,
            };
            return View(goodsDTO);
        }
        [HttpPost]
        public ActionResult EditGoods(ViewModelGoods goods)
        {
            Goods saveGoods = new Goods
            {
                GoodsId = goods.GoodsId,
                GoodsName = goods.GoodsName,
                Type = goods.Type,
                Detail = goods.Detail,
                Configuration = goods.Configuration,
                InstallWay = goods.InstallWay,
            };
            goodsService.EditGoods(saveGoods);
            return PartialView("AddScreenshot", new { goods.GoodsId });
        }
        [HttpPost]
        public ActionResult EditVersion(ViewModelVersions version)
        {
            Versions saveVersions = new Versions
            {
                GoodsId = version.GoodsId,
                VersionName = version.VersionName,
                Price = version.Price,
                VersionId = version.VersionId,
                Stock = version.Stock,
                ActivationTimes = version.ActivationTimes,
                Sell = version.Sell,
                WarehouseId = version.WarehouseId,
            };
            try
            {
                if (version.VersionImage != null)
                {

                    saveVersions.VersionImage = GetImageFromWeb();

                }
                else
                {
                    var ver = goodsService.GetVersionByVersionId(version.VersionId);
                    saveVersions.VersionImage = ver.VersionImage;
                }
            }
            catch
            {
                TempData["Error"] = "请填写必填项！！！";
                RedirectToAction("EditGoods", new { version.GoodsId });
            }
            if (version.VersionId == 0)
            {
                if (goodsService.AddVersion(saveVersions))
                {

                }
                else
                {
                    TempData["Error"] = "请填写必填项！！！";
                    RedirectToAction("EditGoods", new { version.GoodsId });
                }
            }
            else
            {
                if (goodsService.EditVersion(saveVersions))
                {

                }
                else
                {
                    TempData["Error"] = "请填写必填项！！！";
                    RedirectToAction("EditGoods", new { version.GoodsId });
                }
            }
            return RedirectToAction("EditGoods",new { version.GoodsId });
        }
        [HttpPost]
        public ActionResult AddVersion(ViewModelVersions version)
        {
            if (version.VersionId == 0)
            {
                return View(new ViewModelVersions() { GoodsId = version.GoodsId });
            }
            else
            {
                var ver = goodsService.GetVersionByVersionId(version.VersionId);
                var versionDTO = new ViewModelVersions()
                {
                    ActivationTimes = ver.ActivationTimes,
                    GoodsId = ver.GoodsId,
                    Price = ver.Price,
                    Sell = ver.Sell,
                    Stock = ver.Stock,
                    VersionId = ver.VersionId,
                    VersionImage = ver.VersionImage,
                    VersionName = ver.VersionName,
                    WarehouseId = ver.WarehouseId,
                };
                return View(versionDTO);
            }
        }
        public ActionResult DeleteVersion(ViewModelVersions version)
        {
            var ver = goodsService.GetVersionByVersionId(version.VersionId);
            var versionDTO = new ViewModelVersions()
            {
                ActivationTimes = ver.ActivationTimes,
                GoodsId = ver.GoodsId,
                Price = ver.Price,
                Sell = ver.Sell,
                Stock = ver.Stock,
                VersionId = ver.VersionId,
                VersionImage = ver.VersionImage,
                VersionName = ver.VersionName,
                WarehouseId = ver.WarehouseId,
            };
            return View(versionDTO);
        }
        [HttpPost]
        public ActionResult DeleteVersion(int VersionId, int GoodsId)
        {
            var versions = goodsService.GetGoodsVersionsByGoodsId(GoodsId);
            if (versions.Count > 1)
            {
                goodsService.DeleteVersion(VersionId);
            }
            else
            {
                TempData["forbid_delete"] = "必须保证有一个版本！";
            }
            return RedirectToAction("EditGoods", new { GoodsId });
        }
        public ActionResult Evaluation()
        {
            var evaluations = goodsService.GetAllEvaluation();
            var evaluationsDTO = evaluations.Select(item => new ViewModelEvaluation()
            {
                OrderId = item.OrderId,
                CustomerId = item.CustomerId,
                Evaluate = item.Evaluate,
                EvaluationId = item.EvaluationId,
                AdminId = item.AdminId,
                Reply = item.Reply,
            }).ToList();
            return View(evaluationsDTO);
        }
        public ActionResult Reply(int EvaluationId, string Reply)
        {
            var adminId = (int)Session["AdminId"];
            goodsService.Reply(adminId, EvaluationId, Reply);
            return RedirectToAction("Evaluation");
        }
        private string GetImageFromWeb()
        {
            HttpFileCollection uploadFille = System.Web.HttpContext.Current.Request.Files;
            string fileName = uploadFille[0].FileName;
            int fileSize = uploadFille[0].ContentLength;
            string fileExt = System.IO.Path.GetExtension(fileName).ToLower();
            if (!(fileExt == ".png" || fileExt == ".gif" || fileExt == ".jpg" || fileExt == ".jpeg"))
            {
                return "图片类型只能为gif png jpg jpeg";
            }
            else
            {
                if (fileSize > (int)(500 * 1024))
                {
                    return "图片不能超过500kb";
                }
                else
                {
                    string uploadFileName = DateTime.Now.ToString("yyyy-MM-dd HH.mm.ss") + fileExt;
                    try
                    {
                        string directoryPath = Server.MapPath("/Images/Goods/VersionImages/");
                        if (!Directory.Exists(directoryPath))
                        {
                            Directory.CreateDirectory("/Images/Goods/VersionImages/");
                        }
                        else
                        {
                            string filePath = "/Images/Goods/VersionImages";
                            string path = Request.MapPath(filePath + "/") + uploadFileName;
                            uploadFille[0].SaveAs(path);
                        }
                        return "http://123.207.242.177:8000/VersionImages/" + uploadFileName;
                    }
                    catch (Exception e)
                    {
                        return "上传异常";
                    }
                }
            }
        }
    }
}