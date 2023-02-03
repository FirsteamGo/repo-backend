using prjCoreFT.Models;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace prjCoreFT.Models
{
    public partial class MemberInfoMetadata
    {
        
        public int 會員id { get; set; }
        [Required(ErrorMessage = "姓名不可為空白")]
        public string? 姓名 { get; set; }
        public bool? 性別 { get; set; }
        public DateTime? 出生日期 { get; set; }
        [Required(ErrorMessage = "電話不可為空白")]
        public string? 電話號碼 { get; set; }
        public string? 連絡信箱 { get; set; }
        public string? 會員帳號 { get; set; }
        public string? 會員密碼 { get; set; }
        public string? 照片 { get; set; }
        public bool? 權限 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public DateTime? 修改時間 { get; set; }
        public string? 修改人 { get; set; }
    }

    public partial class CLoginMetadata 
    {
        [Required(ErrorMessage = "帳號不可為空白")]
        public string? txtAccount { get; set; }

        [Required(ErrorMessage = "密碼不可為空白")]
        public string? txtPassword { get; set; }
    }

    public partial class SelfOrderMetadata
    {
        
        public int 自選訂單id { get; set; }
        public int? 會員id { get; set; }
        public string? 自選訂單編號 { get; set; }
        public DateTime? 入住時間 { get; set; }
        public DateTime? 退住時間 { get; set; }
        
        public int? 露營天數 { get; set; }
        public int? 預計人數 { get; set; }
        public int? 營區細項id { get; set; }
        public int? 自選飲食id { get; set; }
        public int? 租賃商店id { get; set; }
        public int? 租借總價 { get; set; }
        public int? 自選訂單總價 { get; set; }
        public string? 評論 { get; set; }
        public int? 評分 { get; set; }
        public string? 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string? 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual MemberInfo? 會員 { get; set; }
        public virtual CampDetail? 營區細項 { get; set; }
        public virtual RentDetail? 租賃商店 { get; set; }
        public virtual SelfFood? 自選飲食 { get; set; }
    }

    public partial class SelfFoodMetadata
    {
        public SelfFoodMetadata()
        {
            SelfOrders = new HashSet<SelfOrder>();
        }

        public int 自選飲食id { get; set; }
        public string? 圖片 { get; set; }
        public int? 需求人數 { get; set; }
        public int? 需求份數 { get; set; }
        [DisplayName("飲食名稱")]
        public string? 商品名稱 { get; set; }
        public string? 商品內容 { get; set; }
        public int? 單價 { get; set; }
        public string? 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string? 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual ICollection<SelfOrder> SelfOrders { get; set; }
    }

    public partial class RentDetailMetadata
    {
        public RentDetailMetadata()
        {
            SelfOrders = new HashSet<SelfOrder>();
        }

        public int 租賃商店id { get; set; }
        [DisplayName("租賃商品")]
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

    public partial class ActEditMetadata
    {
        

        public int 活動id { get; set; }
       
        public string? 活動方式 { get; set; }
        public string? 活動種類 { get; set; }
        public string? 活動名稱 { get; set; }
        public DateTime? 開始日期 { get; set; }
        public DateTime? 結束日期 { get; set; }
        public int? 預計人數 { get; set; }
        public string? 活動介紹 { get; set; }
        public int? 門票價格 { get; set; }
        public string? 活動圖片 { get; set; }

        public IFormFile photo { get; set; }

    }
}
