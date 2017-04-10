using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels.Order
{
    public class ViewModelInvoice
    {
        public int InvoiceId { get; set; }
        public int OrderId { get; set; }
        public int AdminId { get; set; }
    }
}