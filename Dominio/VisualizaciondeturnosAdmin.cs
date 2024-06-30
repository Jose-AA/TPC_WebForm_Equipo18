using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class VisualizaciondeturnosAdmin
    {
        public int TurnoID { get; set; }
        public string ClienteNombre { get; set; }
        public string EspecialistaNombre { get; set; }
        public string ServicioNombre { get; set; }
        public DateTime FechaDeTurno { get; set; }
        public TimeSpan HoraDeTurno { get; set; }
        public int Estado { get; set; }


    }
}
