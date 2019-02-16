using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels.Goods
{
    public class ViewModelWarehouse
    {
        public int WarehouseId { get; set; }
        public string WarehouseName { get; set; }
        public System.DateTime CreatTime { get; set; }
        public Nullable<int> flag { get; set; }
    }
}