using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{

    /*
     (Franco)
     ROLES:
        - Cliente
        - Especialista
        - Administrador

    EN TODOS LOS CASOS, SERAN USUARIOS REGISTRADOS EN LA APLICACION WEB
    //---------------------------------------------------------//
    (Martin)
    Le saque el signo de pregunta a la propiedad DateTime ya que es la que 
    deberíamos usar.

    **IDRol: Será necesario? porque ya que usamos herencia me parece que no cumpliría una
             función útil. 
    **Contraseña: C# admite la 'Ñ' ?
    **Foto de perfil: Para dar posibilidad a que cada usuario tenga su avatar o foto, en este 
      caso no hay lista como en servicios, string o composición con Imagen? 

    ** Códigos: Será conveniente que cada clase que hereda de Usuario tenga su propio codigo?
       Ejemplo:
       Admistrador - string codigoAdimistrador
       Cliente - string codigoCliente
       Especialista - string codigoEspecialista


    (Franco)
        - Datetime? es un tipo de dato que admite una fecha o null como posibles valores. Lo había propuesto porque 
          no obligamos en la base de datos cargar la fecha de nacimiento, así que podria quedar como nulo.
        - Si queremos implementar foto de perfil, usaría una Imagen foto (para asociar en caso de haber con SQL)
        - C# Parece que si admite la ñ, pero git hace cosas raras
        - Según como querramos implementarlo podemos manejar el código por string o el idRol
     */


    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public int Dni { get; set; }
        public string Email { get; set; }
        public string Contraseña { get; set; }
        public int IdRol { get; set; }

        /*public Imagen foto { get; set; }
              ó
        public string UrlFoto { get; set; }

        */
    }
}
