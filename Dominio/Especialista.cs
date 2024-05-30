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

   
  */


namespace Dominio
{
    public class Especialista : Usuario
    {
        public List<Resena> Resenas { get; set; }
    }
}
