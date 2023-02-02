using prjCoreFT.Models;

namespace prjCoreFT.ViewModel
{
    public class CActViewModel
    {
        private ActDetail _product; //_product 全域變數

        public ActDetail Product
        {
            get { return _product; }
            set { _product = value; }
        }
        public CActViewModel()
        {
            _product = new ActDetail();
        }

        public int 活動編號
        {
            get { return _product.活動id; }
            set { _product.活動id = value; }
        }

        public int? 營區編號
        {
            get { return _product.營區id; }
            set { _product.營區id = value; }
        }

        public string? 活動方式
        {
            get { return _product.活動方式; }
            set { _product.活動方式 = value; }
        }

        public string? 活動種類
        {
            get { return _product.活動種類; }
            set { _product.活動種類 = value; }
        }
        public string? 活動名稱
        {
            get { return _product.活動名稱; }
            set { _product.活動名稱 = value; }
        }
        public DateTime? 開始日期
        {
            get { return _product.開始日期; }
            set { _product.開始日期 = value; }
        }

        public DateTime? 結束日期
        {
            get { return _product.結束日期; }
            set { _product.結束日期 = value; }
        }

        public int? 預計人數
        {
            get { return _product.預計人數; }
            set { _product.預計人數 = value; }
        }

        public string? 活動介紹
        {
            get { return _product.活動介紹; }
            set { _product.活動介紹 = value; }
        }

        public int? 門票價格
        {
            get { return _product.門票價格; }
            set { _product.門票價格 = value; }
        }

        public string? 活動圖片
        {
            get { return _product.活動圖片; }
            set { _product.活動圖片 = value; }
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
