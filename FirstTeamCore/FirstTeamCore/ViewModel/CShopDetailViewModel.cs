using prjCoreFT.Models;

namespace prjCoreFT.ViewModel
{
    public class CShopDetailViewModel
    {
        private ShopDetail _product;
        public ShopDetail Product
        {
            get { return _product; }
            set { _product = value; }
        }
        public CShopDetailViewModel()
        {
            _product = new ShopDetail();
        }
        public int 商品細項id
        {
            get { return _product.商品細項id; }
            set { _product.商品細項id = value; }
        }
        public string? 品牌名稱
        {
            get { return _product.品牌名稱; }
            set { _product.品牌名稱 = value; }
        }
        public string? 產品名稱
        {
            get { return _product.產品名稱; }
            set { _product.產品名稱 = value; }
        }
        public string? 產品說明
        {
            get { return _product.產品說明; }
            set { _product.產品說明 = value; }
        }
        public string? 產品圖片
        {
            get { return _product.產品圖片; }
            set { _product.產品圖片 = value; }
        }
        public int? 庫存
        {
            get { return _product.庫存; }
            set { _product.庫存 = value; }
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

