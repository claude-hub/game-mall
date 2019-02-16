using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels.Order
{
    public class ViewModelOrder
    {
        public int OrderId { get; set; }
        public int GoodsId { get; set; }
        public int CustomerId { get; set; }
        public int VersionId { get; set; }
        public int WarehouseId { get; set; }
        public int OrderGoodsNumber { get; set; }
        public float Price { get; set; }
        public int OrderStatus { get; set; }
        public System.DateTime OrderTime { get; set; }
        public string Express { get; set; }
        public string SellerMessage { get; set; }
        public string GoodsName { get; set; }
        public string VersionName { get; set; }
        public string DeliveryName { get; set; }
        public string TelNum { get; set; }
        public string Province { get; set; }
        public string Area { get; set; }
        public string Street { get; set; }
        public string DetailAddress { get; set; }
        public string Evaluation { get; set; }
        public string Reply { get; set; }
    }
}