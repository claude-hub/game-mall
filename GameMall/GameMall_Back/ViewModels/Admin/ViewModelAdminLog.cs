using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels.Admin
{
    public class ViewModelAdminLog
    {
        public int AdminLogId { get; set; }
        public int AdminId { get; set; }
        public System.DateTime OperatorTime { get; set; }
        public string IP { get; set; }
        public string OperationRecord { get; set; }
    }
}