using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Front.ViewModels.Customer
{
    public class ViewModelUsers
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string PhoneNumber { get; set; }
        public string Password { get; set; }
        public System.DateTime CreationTime { get; set; }
        public string Head { get; set; }
        public string RealName { get; set; }
    }
}