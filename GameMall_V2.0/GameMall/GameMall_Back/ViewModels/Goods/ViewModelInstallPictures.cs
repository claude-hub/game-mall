using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels.Goods
{
    public class ViewModelInstallPictures
    {
        public int InstallPictureId { get; set; }
        public Nullable<int> GoodsId { get; set; }
        public string InstallPicture { get; set; }
        public string InstallExplain { get; set; }
    }
}