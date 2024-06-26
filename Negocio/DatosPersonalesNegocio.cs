using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class DatosPersonalesNegocio
    {


        public List<Usuario> listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            string query = "SELECT D.usuario_id, D.nombre, D.apellido, D.dni, D.telefono, D.direccion, D.fecha_nacimiento, U.correo_electronico " +
                           "FROM Datos_Personales D " +
                           "INNER JOIN Usuarios U ON D.usuario_id = U.usuario_id";

            try
            {
                datos.settearConsulta(query);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.IdUsuario = (int)datos.Lector["usuario_id"];
                    aux.Nombre = (string)datos.Lector["nombre"];
                    aux.Apellido = (string)datos.Lector["apellido"];
                    aux.Dni = (long)datos.Lector["dni"];
                    aux.Telefono = (string)datos.Lector["telefono"];
                    aux.Direccion = (string)datos.Lector["direccion"];
                    aux.FechaNacimiento = (DateTime)datos.Lector["fecha_nacimiento"];
                    aux.Email = (string)datos.Lector["correo_electronico"];  // Usar el alias de la columna

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                // Aquí podrías manejar o registrar el error de alguna manera
                throw ex; // Puedes considerar cambiar esto dependiendo de tus necesidades
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void modificar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.settearConsulta("update Datos_Personales set nombre = @nombre, apellido = @apellido, dni = @dni, telefono = @telefono, direccion = @direccion, fecha_nacimiento = @fecha_nacimiento where usuario_id = @id");
                datos.setearParametro("@nombre", usuario.Nombre);
                datos.setearParametro("@apellido", usuario.Apellido);
                datos.setearParametro("@dni", usuario.Dni);
                datos.setearParametro("@telefono", usuario.Telefono);
                datos.setearParametro("@direccion", usuario.Direccion);
                datos.setearParametro("@fecha_nacimiento", usuario.FechaNacimiento);
                datos.setearParametro("@id", usuario.IdUsuario);
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

        public void agregar(Usuario usuario )
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.settearConsulta("insert into Datos_Personales (usuario_id, nombre, apellido, dni, telefono, direccion, fecha_nacimiento) values (@id, @nombre, @apellido, @dni, @telefono, @direccion, @fecha_nacimiento)");
                datos.setearParametro("@id", usuario.IdUsuario);
                datos.setearParametro("@nombre", usuario.Nombre);
                datos.setearParametro("@apellido", usuario.Apellido);
                datos.setearParametro("@dni", usuario.Dni);
                datos.setearParametro("@telefono", usuario.Telefono);
                datos.setearParametro("@direccion", usuario.Direccion);
                datos.setearParametro("@fecha_nacimiento", usuario.FechaNacimiento);
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

        public List<Usuario> listardelatabadeUsuarios()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            string query = "SELECT usuario_id, correo_electronico FROM Usuarios";

            try
            {
                datos.settearConsulta(query);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.IdUsuario = (int)datos.Lector["usuario_id"];
                    usuario.Email = (string)datos.Lector["correo_electronico"];

                    listaUsuarios.Add(usuario);
                }

                return listaUsuarios;
            }
            catch (Exception ex)
            {
                // Manejar o registrar el error, según sea necesario
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


        public Usuario recuperarDatosPersonalesLogin(int idUsuario)
        {
            Usuario aux = new Usuario();
            AccesoDatos datos = new AccesoDatos();
            string query = "select nombre, apellido, dni, telefono, direccion, fecha_nacimiento from Datos_Personales where usuario_id = @id";

            try
            {
                datos.settearConsulta(query);
                datos.setearParametro("@id", idUsuario);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    aux.Nombre = (string)datos.Lector["nombre"];
                    aux.Apellido = (string)datos.Lector["apellido"];
                    aux.Dni = (long)datos.Lector["dni"];
                    aux.Telefono = (string)datos.Lector["telefono"];
                    aux.Direccion = (string)datos.Lector["direccion"];
                    aux.FechaNacimiento = (DateTime)datos.Lector["fecha_nacimiento"];
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



    }
}
