using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Front.ViewModels.Goods
{
    public class ViewModelVersions
    {
        public int VersionId { get; set; }
        public int GoodsId { get; set; }
        public int WarehouseId { get; set; }
        public string VersionName { get; set; }
        public Nullable<int> ActivationTimes { get; set; }
        public string VersionImage { get; set; }
        public float Price { get; set; }
        public int Stock { get; set; }
        public int Sell { get; set; }
        public int SalesVolume { get; set; }
    }
}