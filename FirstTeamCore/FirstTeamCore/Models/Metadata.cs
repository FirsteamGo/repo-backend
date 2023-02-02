using prjCoreFT.Models;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace prjCoreFT.Models
{
    //public class TCustomerMetadata
    //{

    //    public int FId { get; set; }

    //    [Display(Name = "姓名")]
    //    public string FName { get; set; }

    //    [Display(Name = "電話")]
    //    public string FPhone { get; set; }

    //[Display(Name = "電子郵件")]
    //public string FEmail { get; set; }
    //    public string FAddress { get; set; }
    //    public string FPassword { get; set; }
    //}
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


}
