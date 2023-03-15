using prjCoreFT.Models;

namespace prjCoreFT.ViewModel
{
    public class CCampDetailModel
    {
        private CampDetail _product; //_product 全域變數

        public CampDetail Product
        {
            get { return _product; }
            set { _product = value; }
        }
        public CCampDetailModel()
        {
            _product = new CampDetail();
        }

        public int 營區細項編號
        {
            get { return _product.營區細項id; }
            set { _product.營區細項id = value; }
        }

        public int? 營區id
        {
            get { return _product.營區id; }
            set { _product.營區id = value; }
        }

        public int? 活動id
        {
            get { return _product.活動id; }
            set { _product.活動id = value; }
        }

        public int? 露營形式id
        {
            get { return _product.露營形式id; }
            set { _product.露營形式id = value; }
        }
        public string? 詳細內容
        {
            get { return _product.詳細內容; }
            set { _product.詳細內容 = value; }
        }
        public string? 圖片
        {
            get { return _product.圖片; }
            set { _product.圖片 = value; }
        }

        public int? 單價
        {
            get { return _product.單價; }
            set { _product.單價 = value; }
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
