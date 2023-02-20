using prjCoreFT.Models;

namespace prjCoreFT.InputViewModel
{
    public class CSetOrderDetailInput

    {
        private SetOrderDetail _product;
        public SetOrderDetail Product
        {
            get { return _product; }
            set { _product = value; }
        }

        public CSetOrderDetailInput()
        {
            _product = new SetOrderDetail();
        }
        public int 套裝行程ID
        {
            get { return _product.套裝行程id; }
            set { _product.套裝行程id = value; }
        }
        public int? 營地ID
        {
            get { return _product.營地id; }
            set { _product.營地id = value; }
        }       
        public int? 活動ID
        {
            get { return _product.營區細項.活動id; }
            set { _product.營區細項.活動id = value; }
        }
        public int? 餐廳ID
        {
            get { return _product.餐廳id; }
            set { _product.餐廳id = value; }
        }
        
        public string? 套裝方案
        {
            get { return _product.套裝方案; }
            set { _product.套裝方案 = value; }
        }
        public string? 套裝細項
        {
            get { return _product.套裝細項; }
            set { _product.套裝細項 = value; }
        }

        public int? 套裝行程價格
        {
            get { return _product.套裝行程價格; }
            set { _product.套裝行程價格 = value; }
        }
    }
}
