using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{

    /*
     ROLES:
        - Cliente
        - Especialista
        - Administrador

    EN TODOS LOS CASOS, SERAN USUARIOS REGISTRADOS EN LA APLICACION WEB
     */


    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public string Email { get; set; }
        public string Contraseña { get; set; }
        public int IdRol { get; set; }
    }
}
