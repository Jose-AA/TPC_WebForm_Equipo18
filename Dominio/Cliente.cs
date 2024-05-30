using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*
 (Martin)
   Será útil agregar a la clase Cliente un código de Cliente (string) para tener utilizar por ejemplo para 
   recuperar cuenta que olvidaron contraseña, pérdida de mail o similar? En el caso de Especialista no lo veo
   necesario ya que esas cuentas solo pueden crearla los administradores. 
 */


namespace Dominio
{
    public class Cliente : Usuario
    {
        public List<Turno> Turnos { get; set; }

    }
}
