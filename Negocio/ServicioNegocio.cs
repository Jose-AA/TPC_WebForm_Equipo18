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

        public List<Servicio> listar()
        {
            List<Servicio> lista = new List<Servicio>();
            AccesoDatos datos = new AccesoDatos();

            string query = "select servicio_id, nombre, descripcion, duracion, precio from Servicios";


            try
            {
                datos.settearConsulta(query);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Servicio aux = new Servicio();
                    aux.Id = (int)datos.Lector["servicio_id"];
                    aux.Nombre = (string)datos.Lector["nombre"];
                    aux.Descripcion = (string)datos.Lector["descripcion"];
                    aux.Duracion = (int)datos.Lector["duracion"];
                    aux.Precio = (decimal)datos.Lector["precio"];

                    lista.Add(aux);
                }

                return lista;

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

        public void Eliminar(int servicioId)
        {
            AccesoDatos datos = new AccesoDatos();
            string query = "DELETE FROM Servicios WHERE servicio_id = @id";

            try
            {
                datos.settearConsulta(query);
                datos.setearParametro("@id", servicioId);
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
