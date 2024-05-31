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

 (Franco)
   Para el caso de olvidar contraseña, podemos enviar un mail para su recuperación / modificación
   Si olvida también el mail es más complicado, creo que debería intervenir el administrador
   Con el nombre completo + Fecha nacimiento se podría buscar coincidencias en la base de datos 
   y así asociar el mail. La idea de un código de cliente único también puede ser útil
 */


namespace Dominio
{
    public class Cliente : Usuario
    {
        public List<Turno> Turnos { get; set; }

    }
}
