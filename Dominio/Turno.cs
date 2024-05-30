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
