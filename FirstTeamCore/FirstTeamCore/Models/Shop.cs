using System;
using System.Collections.Generic;

namespace prjCoreFT.Models
{
    public partial class Shop
    {
        public Shop()
        {
            ShopDetails = new HashSet<ShopDetail>();
        }

        public int 購物商店id { get; set; }
        public string? 品牌名稱 { get; set; }
        public string? 產品名稱 { get; set; }
        public string? 產品說明 { get; set; }
        public string? 產品圖片 { get; set; }
        public int? 庫存 { get; set; }
        public int? 單價 { get; set; }
        public string? 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string? 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual ICollection<ShopDetail> ShopDetails { get; set; }
    }
}
