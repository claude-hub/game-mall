using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels.Warehouse
{
    public class ViewModelStockLog
    {
        public int StockLogId { get; set; }
        public int AdminId { get; set; }
        public int WarehouseId { get; set; }
        public int GoodsId { get; set; }
        public int OrderId { get; set; }
        public int VersionId { get; set; }
        public string OperationRecord { get; set; }
        public System.DateTime OperationTime { get; set; }
        public int Stock { get; set; }

    }
}