using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameMall_Back.ViewModels.Goods
{
    public class ViewModelEvaluation
    {
        public int EvaluationId { get; set; }
        public int OrderId { get; set; }
        public int CustomerId { get; set; }
        public Nullable<int> AdminId { get; set; }
        public string Evaluate { get; set; }
        public string Reply { get; set; }
    }
}