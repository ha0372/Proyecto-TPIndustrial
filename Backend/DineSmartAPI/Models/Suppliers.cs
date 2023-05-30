using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DineSmartAPI.Models
{
    [Table("Suppliers")]
    public class Suppliers
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int supplier_id { get; set; }
        public string name { get; set; }

        public string address { get; set; }

        public string phone { get; set; }

        public int email { get; set; }


    }
}
