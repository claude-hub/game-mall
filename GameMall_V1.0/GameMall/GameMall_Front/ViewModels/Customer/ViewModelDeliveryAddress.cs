using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Front.ViewModels.Customer
{
    public class ViewModelDeliveryAddress
    {
        public int DeliveryAddressId { get; set; }
        public int CustomerId { get; set; }
        public string DeliveryName { get; set; }
        public Nullable<int> Default { get; set; }
        public string Province { get; set; }
        public string Area { get; set; }
        public string Street { get; set; }
        public string DetailAddress { get; set; }
        public string TelNum { get; set; }
        public string Postcode { get; set; }
    }
}