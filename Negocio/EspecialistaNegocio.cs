using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EspecialistaNegocio
    {
        public List<Especialista> ListarEspecialistasysusservicosAsociados()
        {
            List<Especialista> lista = new List<Especialista>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"
                    SELECT 
                        u.usuario_id, 
                        ISNULL(dp.nombre, 'Sin Nombre') as nombre,
                        ISNULL(dp.apellido,'Sin Apellido') as apellido, 
                        ISNULL(s.servicio_id, -1) AS servicio_id, 
                        ISNULL(s.nombre, 'Sin Servicio Asociado') AS nombre_servicio, 
                         ISNULL(s.descripcion, 'Sin Servicio Asociado') AS descripcion_servicio                     
                    FROM 
                        Usuarios u
                    LEFT JOIN 
                        Datos_Personales dp ON u.usuario_id = dp.usuario_id
                    LEFT JOIN 
                        ServiciosxEspecialistas se ON u.usuario_id = se.especialista_id
                    LEFT JOIN 
                        Servicios s ON se.servicio_id = s.servicio_id
                    WHERE 
                        u.id_rol = 2";

                datos.settearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    int usuarioId = (int)datos.Lector["usuario_id"];
                    Especialista especialista = lista.Find(e => e.IdUsuario == usuarioId);

                    if (especialista == null)
                    {
                        especialista = new Especialista
                        {
                            IdUsuario = usuarioId,
                            Nombre = (string)datos.Lector["nombre"],
                            Apellido = (string)datos.Lector["apellido"],
                            Resenas = new List<Resena>(),
                            ServicioAsociado = new Servicio()
                        };

                        lista.Add(especialista);
                    }

                    especialista.ServicioAsociado = new Servicio
                    {
                        Id = (int)datos.Lector["servicio_id"],
                        Nombre = (string)datos.Lector["nombre_servicio"],
                        Descripcion = datos.Lector["descripcion_servicio"] as string
                    };
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar especialistas con servicios", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


        public void ActualizarServicioAsociado(int especialistaId, int servicioId)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.settearConsulta("SELECT COUNT(*) FROM ServiciosxEspecialistas WHERE especialista_id = @especialistaId");
                datos.setearParametro("@especialistaId", especialistaId);
                datos.ejecutarLectura();

                datos.Lector.Read();
                int count = (int)datos.Lector[0];
                datos.cerrarConexion();

                if (count > 0)
                {
                    
                    datos.settearConsulta("UPDATE ServiciosxEspecialistas SET servicio_id = @servicioId2 WHERE especialista_id = @especialistaId2");
                }
                else
                {
                    datos.settearConsulta("INSERT INTO ServiciosxEspecialistas (especialista_id, servicio_id) VALUES (@especialistaId2, @servicioId2)");
                }

                datos.setearParametro("@especialistaId2", especialistaId);
                datos.setearParametro("@servicioId2", servicioId);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar servicio asociado", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }



    }
}
