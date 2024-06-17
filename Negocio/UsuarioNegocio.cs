using Dominio;
using negocio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public void agregar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.settearConsulta("insert into Usuarios (id_rol, correo_electronico, contraseña) values (@idRol, @email, @password)");
                datos.setearParametro("@idRol", usuario.IdRol);
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@password", usuario.Contraseña);
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

        public void modificar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.settearConsulta("update Usuarios set id_rol = @idRol, correo_electronico = @email, contraseña = @password where usuario_id = @id ");
                datos.setearParametro("@idRol", usuario.IdRol);
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@password", usuario.Contraseña);
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



        public List<Usuario> listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            string query = "select id_rol, usuario_id, correo_electronico, contraseña from Usuarios";

            try
            {
                datos.settearConsulta(query);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.IdRol = (int)datos.Lector["id_rol"];
                    aux.IdUsuario = (int)datos.Lector["usuario_id"];
                    aux.Email = (string)datos.Lector["correo_electronico"];
                    aux.Contraseña = (string)datos.Lector["contraseña"];

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

        public Usuario buscarPorID(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            string query = "select id_rol, usuario_id, correo_electronico, contraseña from Usuarios where usuario_id = " + id;
            Usuario aux = new Usuario();

            try
            {
                datos.settearConsulta(query);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    
                    aux.IdRol = (int)datos.Lector["id_rol"];
                    aux.IdUsuario = (int)datos.Lector["usuario_id"];
                    aux.Email = (string)datos.Lector["correo_electronico"];
                    aux.Contraseña = (string)datos.Lector["contraseña"];
                }
                return aux;
            }
            catch(Exception ex)
            {
                ex.ToString();
                return aux;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}