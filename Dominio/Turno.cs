using System;
using System.Collections.Generic;
using System.Diagnostics.SymbolStore;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/* 
 (Martin)
    La clased turno tiene Composición con Cliente, Especialista y Servicio. Creen que será cómodo trabjarlo
    así o será mejor directo por número de ID?
    **Fecha y hora: Investigando vi que se puede usar de esta forma que me pareció más adecuada, la otra forma
    es usar todo junto en DateTime. Dejo comentada una de las opciones y activada la otra.

 (Franco)
    Es interesante manejar fecha y hora por separado, podría ser lo mejor.
    Teniendo la clase Turno por composición, contamos con los datos del usuario, del especialista y
    del servicio a brindar en caso de hacer recordatorios. Tal vez no es lo más eficiente a nivel espacio

*/



namespace Dominio
{
    public class Turno
    {
        public int ID { get; set; }
        public Cliente Cliente { get; set; }
        public Especialista Especialista { get; set; }
        public Servicio Servicio { get; set; }
        public DateTime FechaDeTurno { get; set; }
        public TimeSpan HoraDeTurno { get; set; }
        //public DateTime FechaYhora { get; set; }
        public bool Finalizado { get; set; }
        
    }
}
