using prjCoreFT.Models;
using System.ComponentModel;

namespace prjCoreFT.ViewModel
{
    public class CSetFoodViewModel
    {
        private SetFood _product; //_product 全域變數

        public SetFood Product
        {
            get { return _product; }
            set { _product = value; }
        }
        public CSetFoodViewModel()
        {
            _product = new SetFood();
        }

        public int 餐廳ID
        {
            get { return _product.餐廳id; }
            set { _product.餐廳id = value; }
        }


        [DisplayName("餐廳名")]
        public string? 餐廳名
        {
            get { return _product.餐廳名; }
            set { _product.餐廳名 = value; }
        }

        public string? 餐廳電話
        {
            get { return _product.餐廳電話; }
            set { _product.餐廳電話 = value; }
        }
       

        public string? 地址
        {
            get { return _product.地址; }
            set { _product.地址 = value; }
        }
        public string? 餐點細項
        {
            get { return _product.餐點細項; }
            set { _product.餐點細項 = value; }
        }
        
        
    }
}
