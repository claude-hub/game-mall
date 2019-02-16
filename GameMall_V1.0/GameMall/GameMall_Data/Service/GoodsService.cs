using GameMall_Data.Data;
using System;
using System.Collections.Generic;
using System.Linq;

namespace GameMall_Data.Service
{
    public class GoodsService
    {
        private GameMallDBContext _x;
        public GoodsService()
        {
            _x = new GameMallDBContext();
        }
        public List<Goods> GetAllGoods()
        {
            return _x.Goods.ToList();
        }
        public List<Versions> GetGoodsVersionsByGoodsId(int goodsId)
        {
            return _x.Versions.Where(item => item.GoodsId == goodsId).ToList();
        }
        public bool AddGoods(Goods goods, Versions version)
        {
            try
            {
                _x.Goods.Add(goods);
                _x.Versions.Add(version);
                _x.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public bool AddScreenshot(int goodsId, string path)
        {
            try
            {
                Screenshot shot = new Screenshot()
                {
                    GoodsId = goodsId,
                    Screenshot1 = path,
                };
                _x.Screenshot.Add(shot);
                _x.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool AddShoppingCar(int goodsId, int versionId, int customerId, int number)
        {
            try
            {
                ShoppingCars car = new ShoppingCars();
                car.CustomerId = customerId;
                car.GoodsId = goodsId;
                car.VersionId = versionId;
                car.ShoppingCarGoodsNumber = number;
                _x.ShoppingCars.Add(car);
                _x.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public string DeleteGoods(int goodsId)
        {
            var goods = _x.Goods.SingleOrDefault(item => item.GoodsId == goodsId);
            var versions = _x.Versions.Where(item => item.GoodsId == goodsId).ToList();
            try
            {
                foreach (var item in versions)
                {
                    _x.Versions.Remove(item);
                }
                _x.Goods.Remove(goods);
                _x.SaveChanges();
                return "删除成功";
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public List<Goods> GetHotGoods()
        {
            var goods = (from c in _x.Goods orderby c.TotalSales select c).Take(8).ToList();
            return goods;
        }
        public List<Goods> GetGoodsByType(int type)
        {
            var goods = (from c in _x.Goods.Where(item => item.Type == type) orderby c.TotalSales select c).Take(8).ToList();
            return goods;
        }
        public Goods GetGoodsByGoodsId(int goodsId)
        {
            return _x.Goods.SingleOrDefault(item => item.GoodsId == goodsId);
        }
        public List<Warehouse> GetAllWarehouse()
        {
            return _x.Warehouse.ToList();
        }
        public Warehouse GetSelectedWarehouse(int? warehouseId)
        {
            if (warehouseId != null)
            {
                return _x.Warehouse.SingleOrDefault(item => item.WarehouseId == warehouseId);
            }
            return null;
        }
        public Versions GetVersionByVersionId(int versionId)
        {
            return _x.Versions.SingleOrDefault(item => item.VersionId == versionId);
        }
        public Versions ChangeSell(int versionId)
        {
            var version = _x.Versions.SingleOrDefault(item => item.VersionId == versionId);
            if (version.Sell == 0)
            {
                version.Sell = 1;
            }
            else
            {
                version.Sell = 0;
            }
            _x.SaveChanges();
            return GetVersionByVersionId(versionId);
        }
        public List<Versions> GetVersionsByGoodsId(int goodsId)
        {
            return _x.Versions.Where(item => item.GoodsId == goodsId).ToList();
        }
        public void EditGoods(Goods goods)
        {
            var a = GetGoodsByGoodsId(goods.GoodsId);
            a.Configuration = goods.Configuration;
            a.Detail = goods.Detail;
            a.GoodsName = goods.GoodsName;
            a.Type = goods.Type;
            _x.SaveChanges();
        }
        public bool AddVersion(Versions version)
        {
            try
            {
                _x.Versions.Add(version);
                _x.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public bool EditVersion(Versions version)
        {
            try
            {
                var saveVersion = GetVersionByVersionId(version.VersionId);
                saveVersion.VersionId = version.VersionId;
                saveVersion.VersionImage = version.VersionImage;
                saveVersion.Sell = version.Sell;
                saveVersion.Price = version.Price;
                saveVersion.WarehouseId = version.WarehouseId;
                saveVersion.ActivationTimes = version.ActivationTimes;
                saveVersion.VersionName = version.VersionName;
                saveVersion.Stock = version.Stock;
                _x.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public void DeleteVersion(int versionId)
        {
            var deleteVersion = GetVersionByVersionId(versionId);
            _x.Versions.Remove(deleteVersion);
            _x.SaveChanges();
        }
        public List<Screenshot> GetGoodsScreenshot(int goodsId)
        {
            return _x.Screenshot.Where(item => item.GoodsId == goodsId).ToList();
        }
        public List<Evaluation> EvaluationList(int goodsId)
        {
            return _x.Evaluation.Where(item => item.Orders.GoodsId == goodsId).ToList();
        }

        public List<Evaluation> GetAllEvaluation()
        {
            return _x.Evaluation.ToList();
        }
        public Evaluation GetEvaluationByEvaluateId(int evaluationId)
        {
            return _x.Evaluation.SingleOrDefault(item => item.EvaluationId == evaluationId);
        }
        public void Reply(int adminId, int evaluationId, string reply)
        {
            var evaluation = GetEvaluationByEvaluateId(evaluationId);
            evaluation.Reply = reply;
            evaluation.AdminId = adminId;
            _x.SaveChanges();
        }
    }
}
