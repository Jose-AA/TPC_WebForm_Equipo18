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

        public void agregarImagen(int servicioId, Imagen imagen)
        {

            AccesoDatos datos = new AccesoDatos();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            string query = "insert into ImagenesxServicios(servicio_id, imagen_id) values (@idServicio, @idImagen)";

            try
            {
                imagenNegocio.agregar(imagen);

                imagen = imagenNegocio.recuperarUltimaImagen();

                datos.settearConsulta(query);
                datos.setearParametro("@idServicio", servicioId);
                datos.setearParametro("@idImagen", imagen.IDImagen);
                datos.ejecutarAccion();


            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }


            imagenNegocio.agregar(imagen);


        }

        
        public List<Imagen> listarImagenes(int servicioId)
        {

            List<Imagen> lista = new List<Imagen>();

            AccesoDatos datos = new AccesoDatos();
            string query = "select IxS.imagen_id, I.url_imagen from ImagenesxServicios as IxS inner join Imagenes I on I.imagen_id = IxS.imagen_id where servicio_id = @idServicio";

            try
            {
                datos.settearConsulta(query);
                datos.setearParametro("@idServicio", servicioId);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Imagen aux = new Imagen();

                    aux.IDImagen = (int)datos.Lector["imagen_id"];
                    aux.Url = (string)datos.Lector["url_imagen"];

                    lista.Add(aux);
                }

                return lista;

            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void desasociarImagen(int idImagen)
        {
            AccesoDatos datos = new AccesoDatos();
            ImagenNegocio imagenNegocio = new ImagenNegocio();
            string query = "delete from ImagenesxServicios where imagen_id = @IdImagen";

            try
            {
                datos.settearConsulta(query);
                datos.setearParametro("@IdImagen", idImagen);
                datos.ejecutarAccion();

                imagenNegocio.eliminar(idImagen);
            }
            catch(Exception ex)
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
