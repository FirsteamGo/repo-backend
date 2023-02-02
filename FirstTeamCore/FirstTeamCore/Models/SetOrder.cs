using System;
using System.Collections.Generic;

namespace prjCoreFT.Models
{
    public partial class SetOrder
    {
        public int 套裝訂單id { get; set; }
        public int 套裝行程id { get; set; }
        public int? 會員id { get; set; }
        public string? 套裝訂單編號 { get; set; }
        public DateTime? 入住時間 { get; set; }
        public DateTime? 退住時間 { get; set; }
        public int? 預計人數 { get; set; }
        public int? 合計總價 { get; set; }
        public string? 評論 { get; set; }
        public int? 評分 { get; set; }
        public string? 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string? 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual SetOrderDetail 套裝行程 { get; set; } = null!;
        public virtual MemberInfo? 會員 { get; set; }
    }
}
