using System;
using System.Collections.Generic;

namespace prjCoreFT.Models
{
    public partial class SelfFood
    {
        public SelfFood()
        {
            SelfOrders = new HashSet<SelfOrder>();
        }

        public int 自選飲食id { get; set; }
        public string? 圖片 { get; set; }
        public int? 需求人數 { get; set; }
        public int? 需求份數 { get; set; }
        public string? 商品名稱 { get; set; }
        public string? 商品內容 { get; set; }
        public int? 單價 { get; set; }
        public string? 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string? 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual ICollection<SelfOrder> SelfOrders { get; set; }
    }
}
