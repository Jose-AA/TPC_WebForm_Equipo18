using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

  /*
   (Martin) 
   Se me ocurrió que cada especialista podría tener su lista de reseñas y de esa forma que sea fácil 
   mostrar reseñas en alguna de las páginas, por ejemplo si decidimos que cada especialista pueda verlas
   o mejor aún, para preservar la identidad del cliente, que solo tenga acceso los administradores.

   (Franco)
   ¿Le agregamos como atributo una lista de Servicios por si tiene más de uno, o solo un Servicio?
  */


namespace Dominio
{
    public class Especialista : Usuario
    {
        public List<Resena> Resenas { get; set; }
    }
}
