using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ImagenNegocio
    {
        public void agregar(Imagen nueva)
        {
            AccesoDatos datos = new AccesoDatos();
            string query = "insert into Imagenes(url_imagen) values (@urlImagen)";

            try
            {
                datos.settearConsulta(query);
                datos.setearParametro("@urlImagen", nueva.Url);
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
        }


        public Imagen recuperarUltimaImagen()
        {
            AccesoDatos datos = new AccesoDatos();
            string query = "select top 1 imagen_id, url_imagen from Imagenes order by imagen_id desc";
            Imagen aux = new Imagen();


            try
            {
                datos.settearConsulta(query);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    aux.IDImagen = (int)datos.Lector["imagen_id"];
                    aux.Url = (string)datos.Lector["url_imagen"];

                }

                return aux;

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

        public void eliminar(int idImagen)
        {
            AccesoDatos datos = new AccesoDatos();
            string query = "delete from Imagenes where imagen_id = @IdImagen";

            try
            {
                datos.settearConsulta(query);
                datos.setearParametro("@IdImagen", idImagen);
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
        }
    }
}
