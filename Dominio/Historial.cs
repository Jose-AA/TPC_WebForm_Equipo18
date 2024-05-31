using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


    

namespace Dominio
{
    public class Historial
    {
        /*
        Opción 1:
            public Cliente Cliente { get; set; }
            public Especialista Especialista { get; set; }
            public Servicio Servicio { get; set; }
        
        Opción 2:
            public Turno Turno { get; set; }

        Opción 3:
            Agregar la propiedad observaciones a la clase Turno ya que todo turno que se
            concrete va a tener historial. Además cada cliente tiene su lista de turnos.

        (Franco)
        La idea de usar una lista de Turnos está buena porque contiene el resto de datos
        */
        public string Observaciones { get; set; }

    }
}
