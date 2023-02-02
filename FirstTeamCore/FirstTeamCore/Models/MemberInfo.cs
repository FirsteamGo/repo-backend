using System;
using System.Collections.Generic;

namespace prjCoreFT.Models
{
    public partial class MemberInfo
    {
        public MemberInfo()
        {
            SelfOrders = new HashSet<SelfOrder>();
            SetOrders = new HashSet<SetOrder>();
            ShopOrders = new HashSet<ShopOrder>();
        }

        public int 會員id { get; set; }
        public string? 姓名 { get; set; }
        public bool? 性別 { get; set; }
        public DateTime? 出生日期 { get; set; }
        public string? 電話號碼 { get; set; }
        public string? 連絡信箱 { get; set; }
        public string? 會員帳號 { get; set; }
        public string? 會員密碼 { get; set; }
        public string? 照片 { get; set; }
        public bool? 權限 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public DateTime? 修改時間 { get; set; }
        public string? 修改人 { get; set; }

        public virtual ICollection<SelfOrder> SelfOrders { get; set; }
        public virtual ICollection<SetOrder> SetOrders { get; set; }
        public virtual ICollection<ShopOrder> ShopOrders { get; set; }
    }
}
