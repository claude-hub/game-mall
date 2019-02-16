using GameMall_Back.ViewModels.Warehouse;
using GameMall_Data.Data;
using GameMall_Data.Service;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GameMall_Back.Controllers
{
    public class WarehouseController : Controller
    {
        // GET: Warehouse
        WarehouseService warehouseService = new WarehouseService();
        public ActionResult StockLog()
        {
            return View();
        }
        public ActionResult StockLogList(string searchKey, int? page)
        {
            var stockLogs = warehouseService.GetAllStockLog();
            var stockLogsDTO = stockLogs.Select(item => new ViewModelStockLog()
            {
                AdminId = item.AdminId,
                GoodsId = item.GoodsId,
                OperationRecord = item.OperationRecord,
                OperationTime = item.OperationTime,
                WarehouseId = item.WarehouseId,
                OrderId = item.OrderId,
                Stock = item.Stock,
                StockLogId = item.StockLogId,
                VersionId = item.VersionId,
            }).ToList();
            List<ViewModelStockLog> searchResult;
            if (searchKey == null)
            {
                searchResult = stockLogsDTO;
            }
            else
            {
                searchResult = stockLogsDTO
                  .Where(u => u.OperationRecord.Contains(searchKey)).ToList();
            }
            int pageNumber = page ?? 1;
            int pageSize = 5;
            var list = searchResult.ToPagedList(pageNumber, pageSize);
            return View(list);
        }
        public ActionResult WarehouseList()
        {
            var warehouseList = warehouseService.GetWarehouseList();
            var warehouseListDTO = warehouseList.Select(item => new ViewModelWarehouse()
            {
                CreatTime = item.CreatTime,
                WarehouseId = item.WarehouseId,
                WarehouseName = item.WarehouseName,
                AdminId = item.AdminId,
            }).ToList();
            return View(warehouseListDTO);
        }
        public ActionResult CreatWarehouse()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreatWarehouse(string WarehouseName)
        {
            Warehouse warehouse = new Warehouse();
            warehouse.WarehouseName = WarehouseName;
            warehouse.CreatTime = DateTime.Now;
            warehouseService.CreatWarehouse(warehouse);
            //StockLog log = new StockLog()
            //{
            //    AdminId = (int)Session["AdminId"],
            //    OperationRecord = "创建仓库",
            //    OperationTime = DateTime.Now,
            //    WarehouseId = warehouse.WarehouseId,
            //};
            //warehouseService.AddWarehouseLog(log);
            return RedirectToAction("WarehouseList");
        }
    }
}