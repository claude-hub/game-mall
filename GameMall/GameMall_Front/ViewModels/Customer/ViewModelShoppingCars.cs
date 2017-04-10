using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Front.ViewModels.Customer
{
    public class ViewModelShoppingCars
    {
        public int ShoppingCarId { get; set; }
        public int CustomerId { get; set; }
        public int GoodsId { get; set; }
        public int VersionId { get; set; }
        public int ShoppingCarGoodsNumber { get; set; }

    }
}