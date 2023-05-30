using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DineSmartAPI.Models
{
    [Table("Products")]
    public class Products
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }
        public string name { get; set; }

        public string description { get; set; }

        public decimal price { get; set; }

        public int quanity { get; set; }

        public int branch_id { get; set; }

        [ForeignKey("branch_id")]
        public int branch { get; set; }
    }
}
