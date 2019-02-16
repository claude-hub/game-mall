using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels
{
    public class ZTree
    {
        public Guid id { get; set; }
        public string name { get; set; }
        public Guid pId { get; set; }
        public Boolean @checked { get; set; }
        public Boolean open { set; get; }
        public ZTree children { set; get; }
    }
}