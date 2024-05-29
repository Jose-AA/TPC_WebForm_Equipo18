using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    //RESEÑA:
    // - SE PODRIA RESEÑAR SERVICIO, ESPECIALISTA Y TURNO POR SEPARADO
    // - TAMBIEN SE PODRIA RESEÑAR SOLO EL SERVICIO, Y OBTENER UN PUNTAJE PARA EL ESPECIALISTA EN BASE A PROMEDIO
    // - DE FORMA SIMILAR CON LOS TURNOS, AUNQUE LOS VEO COMO ALGO MAS PRIVADO COMO PARA PUNTUAR

    public class Resena
    {
        public int IdReseña { get; set; }

        //public Cliente Cliente { get; set; }

        //public Especialista Especialista { get; set; }
        public Servicio Servicio { get; set; }
        public DateTime FechaHora { get; set; }
        public int Calificacion { get; set; }
        public string Mensaje { get; set; }
        public bool Estado { get; set; }
    }
}
}
