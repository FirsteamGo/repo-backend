namespace APIprjCroeFT.DTO
{
    public class SetOrderDetailDTO
    {
        public int 套裝行程id { get; set; }        
        public string 套裝方案 { get; set; }
        public string 套裝細項 { get; set; }
        public int? 套裝行程價格 { get; set; }            

        //營區細項 + 營區
        public string 營區名稱 { get; set; }
        
        public string 地區 { get; set; }
        public string 縣市 { get; set; }
        public string 營區介紹 { get; set; }
        public string 詳細內容 { get; set; }
        public string 活動圖片 { get; set; }
        public string 活動名稱 { get;set; }
        //營區樣式
        public string 項目內容 { get; set; }
    }
}
