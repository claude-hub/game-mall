using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Front.ViewModels.Goods
{
    public class ViewModelGoods
    {
        public int GoodsId { get; set; }
        public string GoodsName { get; set; }
        public string Detail { get; set; }
        public string Configuration { get; set; }
        public string InstallWay { get; set; }
        public int Type { get; set; }
        public int TotalSales { get; set; }
    }
}