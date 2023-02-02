using System;
using System.Collections.Generic;

namespace prjCoreFT.Models
{
    public partial class ShopOrder
    {
        public int 商店id { get; set; }
        public int? 商品細項id { get; set; }
        public int? 會員id { get; set; }
        public string? 商店訂單編號 { get; set; }
        public DateTime? 成立時間 { get; set; }
        public string? 細項 { get; set; }
        public int? 總價 { get; set; }
        public string? 購物評價 { get; set; }
        public int? 購物評分 { get; set; }
        public string? 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string? 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual ShopDetail? 商品細項 { get; set; }
        public virtual MemberInfo? 會員 { get; set; }
    }
}
