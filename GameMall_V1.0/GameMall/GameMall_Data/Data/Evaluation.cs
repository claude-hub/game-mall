//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace GameMall_Data.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Evaluation
    {
        public int EvaluationId { get; set; }
        public int OrderId { get; set; }
        public int CustomerId { get; set; }
        public Nullable<int> AdminId { get; set; }
        public string Evaluate { get; set; }
        public string Reply { get; set; }
    
        public virtual Admin Admin { get; set; }
        public virtual Customers Customers { get; set; }
        public virtual Orders Orders { get; set; }
    }
}
