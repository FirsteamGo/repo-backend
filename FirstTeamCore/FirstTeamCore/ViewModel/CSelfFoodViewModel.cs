using prjCoreFT.Models;
using System.ComponentModel;

namespace prjCoreFT.ViewModel
{
    public class CSelfFoodViewModel
    {
        private SelfFood _product; //_product 全域變數

        public SelfFood Product
        {
            get { return _product; }
            set { _product = value; }
        }
        public CSelfFoodViewModel()
        {
            _product = new SelfFood();
        }

        public int 自選飲食id
        {
            get { return _product.自選飲食id; }
            set { _product.自選飲食id = value; }
        }


        
        public string? 商品名稱
        {
            get { return _product.商品名稱; }
            set { _product.商品名稱 = value; }
        }

        public string? 商品內容
        {
            get { return _product.商品內容; }
            set { _product.商品內容 = value; }
        }

        public int? 單價
        {
            get { return _product.單價; }
            set { _product.單價 = value; }
        }
        public int? 需求人數
        {
            get { return _product.需求人數; }
            set { _product.需求人數 = value; }
        }
        public int? 需求份數
        {
            get { return _product.需求份數; }
            set { _product.需求份數 = value; }
        }

        public string? 圖片
        {
            get { return _product.圖片; }
            set { _product.圖片 = value; }
        }

        public IFormFile photo { get; set; }
    }

}

