using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{   /*
     (Franco)
    RESEÑA:
     - SE PODRIA RESEÑAR SERVICIO, ESPECIALISTA Y TURNO POR SEPARADO
     - TAMBIEN SE PODRIA RESEÑAR SOLO EL SERVICIO, Y OBTENER UN PUNTAJE PARA EL ESPECIALISTA EN BASE A PROMEDIO
     - DE FORMA SIMILAR CON LOS TURNOS, AUNQUE LOS VEO COMO ALGO MAS PRIVADO COMO PARA PUNTUAR

    (Martin)
    Cree dos clases que van a heredar de esta, una para servicios y otra para especialistas, de esa forma
    queda más ordenado y cada tipo de reseña tiene su clase.
    */
    public class Resena
    {
        public int IdReseña { get; set; }

        public Cliente Cliente { get; set; }
        public DateTime FechaHora { get; set; }
        public int Calificacion { get; set; }
        public string Mensaje { get; set; }
        public bool Estado { get; set; }
    }
}

