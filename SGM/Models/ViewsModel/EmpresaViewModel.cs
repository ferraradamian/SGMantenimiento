using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SGM.Models.ViewsModel
{
    public class EmpresaViewModel
    {
        [Key]
        public int empresa_id { get; set; }

        [Required]
        [Display(Name = "Nombre Empeado")]
        [StringLength(50,MinimumLength =3)]
        public string nombre { get; set; }

        [DataType(DataType.PhoneNumber)]
        [Display(Name = "Telefono")]
        public string telefono { get; set; }

        [DataType(DataType.EmailAddress)]
        [Display(Name = "Correo Electronico")]
        public string email { get; set; }

        public List<Empleado> Empleados { get; set; }
    }
}