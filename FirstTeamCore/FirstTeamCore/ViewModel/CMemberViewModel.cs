using prjCoreFT.Models;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace prjCoreFT.ViewModel
{
    public class CMemberViewModel
    {
        private MemberInfo _customer;
        private MemberInfo customer
        {
            get { return _customer; }
            set { _customer = value; }
        }
        public CMemberViewModel()
        {
            _customer = new MemberInfo();
        }

        public int 會員編號ID
        {
            get { return _customer.會員id; }
            set { _customer.會員id = value; }
        }
        [DisplayName("姓名")]
        [Required(ErrorMessage = "姓名不可空白")]
        public string? 姓名
        {
            get { return _customer.姓名; }
            set { _customer.姓名 = value; }
        }
        [DisplayName("電話")]
        [Required(ErrorMessage = "電話號碼不可空白")]
        public string? 電話號碼
        {
            get { return _customer.電話號碼; }
            set { _customer.電話號碼 = value; }
        }

        [DisplayName("連絡信箱")]
        public string? 連絡信箱
        {
            get { return _customer.連絡信箱; }
            set { _customer.連絡信箱 = value; }
        }

        [DisplayName("密碼")]
        public string? 會員密碼
        {
            get { return _customer.會員密碼; }
            set { _customer.會員密碼 = value; }
        }

        public string? 照片
        {
            get { return _customer.照片; }
            set { _customer.照片 = value; }
        }
        public bool 性別
        {
            get { return (bool)_customer.性別; }
            set { _customer.性別 = value; }

        }
        
        public DateTime? 出生日期
        {
            get { return _customer.出生日期; }
            set { _customer.出生日期 = value; }
        }
        public IFormFile photo { get; set; } //要上傳照片，要用IFormFile屬性。
    }
}
