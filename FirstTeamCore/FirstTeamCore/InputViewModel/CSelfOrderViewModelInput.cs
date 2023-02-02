namespace prjCoreFT.InputViewModel
{
    public class CSelfOrderViewModelInput
    {
        public int 自選訂單id { get; set; }
        public DateTime? 入住時間 { get; set; }
        public DateTime? 退住時間 { get; set; }
        public int? 露營天數 { get; set; }
        public int? 預計人數 { get; set; }
        public int? 租借總價 { get; set; }
        public int? 自選訂單總價 { get; set; }
        public string? 評論 { get; set; }
        public int? 評分 { get; set; }
    }
}
