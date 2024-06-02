using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ServicioNegocio
    {
        public void Agregar(Servicio nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            string query = "INSERT INTO Servicios (nombre, descripcion, duracion, precio) VALUES (@nombre, @descripcion, @duracion, @precio)";

            try
            {
                datos.settearConsulta(query);
                datos.setearParametro("@nombre", nuevo.Nombre);
                datos.setearParametro("@descripcion", nuevo.Descripcion);
                datos.setearParametro("@duracion", nuevo.Duracion);
                datos.setearParametro("@precio", nuevo.Precio);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void Modificar(Servicio servicio)
        {
            AccesoDatos datos = new AccesoDatos();
            string query = "UPDATE Servicios SET nombre = @nombre, descripcion = @descripcion, duracion = @duracion, precio = @precio WHERE servicio_id = @id";

            try
            {
                datos.settearConsulta(query);
                datos.setearParametro("@nombre", servicio.Nombre);
                datos.setearParametro("@descripcion", servicio.Descripcion);
                datos.setearParametro("@duracion", servicio.Duracion);
                datos.setearParametro("@precio", servicio.Precio);
                datos.setearParametro("@id", servicio.Id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
