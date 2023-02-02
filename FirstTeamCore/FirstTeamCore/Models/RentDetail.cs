using System;
using System.Collections.Generic;

namespace prjCoreFT.Models
{
    public partial class RentDetail
    {
        public RentDetail()
        {
            SelfOrders = new HashSet<SelfOrder>();
        }

        public int 租賃商店id { get; set; }
        public string? 產品名稱 { get; set; }
        public string? 產品說明 { get; set; }
        public int? 庫存 { get; set; }
        public string? 圖片 { get; set; }
        public int? 數量 { get; set; }
        public int? 單日租金 { get; set; }
        public string? 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string? 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual ICollection<SelfOrder> SelfOrders { get; set; }
    }
}
