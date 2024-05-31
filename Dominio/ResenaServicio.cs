using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*
 (Martin)
  Tanto en esta como en ResenaEspecialista, será correcto agregar una propiedad identificatoria
  interna de cada clase? Es decir, int IDResenaServicio para esta y int IDResenaEspecialista en la otra.

  (Franco)
    A primera vista creería que no, el idResena debería ser único para cada turno para identificarlos inequivocamente
 */

namespace Dominio
{
    public class ResenaServicio : Resena
    {
        public Servicio ServicioCalificado { get; set; }
    }
}
