using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels
{
    public class ViewModeRoles
    {
        public System.Guid RoleId { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public System.DateTime CreationTime { get; set; }
    }
}