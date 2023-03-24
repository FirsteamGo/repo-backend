namespace APIprjCroeFT.DTO
{
    public class SelfOrderDTO
    {

        public int 自選訂單id { get; set; }     
        public int 會員id { get; set; }
        public string 自選訂單編號 { get; set; }
        public int? 租借總價 { get; set; }            
        public int? 自選訂單總價 { get; set; }


        //租賃商店
        public string 產品名稱 { get; set; }
        public string 產品說明 { get; set; }
        public string 圖片 { get; set; }
        public int? 單日租金 { get; set; }





    }
}
