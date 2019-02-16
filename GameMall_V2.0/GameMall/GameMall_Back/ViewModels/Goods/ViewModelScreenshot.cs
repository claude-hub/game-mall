using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels.Goods
{
    public class ViewModelScreenshot
    {
        public int ScreenshotId { get; set; }
        public Nullable<int> GoodsId { get; set; }
        public string Screenshot1 { get; set; }
    }
}