using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Front.ViewModels.Customer
{
    public class ViewModelCustomersEvaluations
    {
        public int CustomerEvaluationId { get; set; }
        public int GoodsId { get; set; }
        public int CustomerId { get; set; }
        public string Evaluation { get; set; }
    }
}