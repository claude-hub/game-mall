using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels
{
    public class ViewModelPermissions
    {
        public System.Guid PermissionId { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public System.DateTime CreationTime { get; set; }
        public int flag { get; set; }
        public Guid PermissionPId { get; set; }
    }
}