using GameMall_Data.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameMall_Data.Service
{
    public class WarehouseService
    {
        private GameMallDBContext _x;
        public WarehouseService()
        {
            _x = new GameMallDBContext();
        }
        public List<Warehouse> GetWarehouseList()
        {
            return _x.Warehouse.ToList();
        }
        public List<StockLog> GetAllStockLog()
        {
            return _x.StockLog.ToList();
        }
        public void CreatWarehouse(Warehouse warehouse)
        {
            _x.Warehouse.Add(warehouse);
            _x.SaveChanges();
        }
        public void AddWarehouseLog(StockLog log)
        {
            _x.StockLog.Add(log);
            _x.SaveChanges();
        }
    }
}
