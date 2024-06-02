using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

/*
   (Martin)
   Será conveniente usar una lista de Especialistas que den el servicio?
   Quizá en alguna página que hagamos necesitemos filtrar los especialistas
   que brindan los servicios. Lo dejo comentado.

   (Franco)
    Podríamos manejarlo mediante un método. Ya que un Servicio no tiene especialistas.
    Creo que la relación sería que un Especialista tiene Servicios
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

        public override string ToString()
        {
            return Nombre;
        }

    }


    
   
}
