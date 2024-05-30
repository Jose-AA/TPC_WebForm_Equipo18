using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*
   (Martin)
   Será conveniente usar una lista de Especialistas que den el servicio?
   Quizá en alguna página que hagamos necesitemos filtrar los especialistas
   que brindan los servicios. Lo dejo comentado.
 **/


namespace Dominio
{
    public class Servicio
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set;}
        public int Duracion { get; set; }
        public float Precio { get; set; }
        public List<Imagen> Imagenes { get; set; }
        //public List<Especialista> EspecilistasPrestadores { get; set; }
    }
}
