namespace APIprjCroeFT.DTO
{
    public class SetOrderDTO
    {
        public int 套裝訂單id { get; set; }
        public int? 套裝行程id { get; set; }
        public int? 會員id { get; set; }
        public string 套裝訂單編號 { get; set; }
        public DateTime? 入住時間 { get; set; }
        public DateTime? 退住時間 { get; set; }
        public int? 預計人數 { get; set; }
        public int? 合計總價 { get; set; }
        public string 評論 { get; set; }
        public int? 評分 { get; set; }
    }
}
