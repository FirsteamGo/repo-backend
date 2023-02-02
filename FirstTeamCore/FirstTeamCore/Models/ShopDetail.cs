using System;
using System.Collections.Generic;

namespace prjCoreFT.Models
{
    public partial class ShopDetail
    {        
        
        public ShopDetail()
        {
            ShopOrders = new HashSet<ShopOrder>();
        }

        public int 商店id { get; set; }
        public int 商品細項id { get; set; }
        
        public string? 會員名稱 { get; set; }
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

        public virtual ICollection<ShopOrder> ShopOrders { get; set; }
    }
}
