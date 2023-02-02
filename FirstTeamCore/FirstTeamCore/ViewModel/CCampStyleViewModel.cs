using prjCoreFT.Models;
using System.ComponentModel;

namespace prjCoreFT.ViewModel
{
    public class CCampStyleViewModel
    {
        private CampStyle _product; //_product 全域變數

        public CampStyle Product
        {
            get { return _product; }
            set { _product = value; }
        }
        public CCampStyleViewModel()
        {
            _product = new CampStyle();
        }

        public int 露營形式id
        {
            get { return _product.露營形式id; }
            set { _product.露營形式id = value; }
        }
        
        public string? 項目內容
        {
            get { return _product.項目內容; }
            set { _product.項目內容 = value; }
        }

        public string? 建立人
        {
            get { return _product.建立人; }
            set { _product.建立人 = value; }
        }

        public DateTime? 建立時間
        {
            get { return _product.建立時間; }
            set { _product.建立時間 = value; }
        }

        public string? 修改人
        {
            get { return _product.修改人; }
            set { _product.修改人 = value; }
        }

        public DateTime? 修改時間
        {
            get { return _product.修改時間; }
            set { _product.修改時間 = value; }
        }



        public IFormFile photo { get; set; }
    }
}
