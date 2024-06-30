using negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class VisualizacionTurnosAdminNegocio
    {

        public List<VisualizaciondeturnosAdmin> ListarTurnos()
        {
            List<VisualizaciondeturnosAdmin> lista = new List<VisualizaciondeturnosAdmin>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string query = @"SELECT 
                                    t.turno_id AS TurnoID,
                                    ISNULL(dc.nombre + ' ' + dc.apellido, 'Sin cliente asociado') AS ClienteNombre,
                                    de.nombre + ' ' + de.apellido AS EspecialistaNombre,
                                    s.nombre AS ServicioNombre,
                                    t.fecha_turno AS FechaDeTurno,
                                    t.hora_turno AS HoraDeTurno,
                                    t.estado_id AS Estado
                                 FROM Turnos t
                                 INNER JOIN Usuarios es ON t.especialista_id = es.usuario_id
                                 LEFT JOIN Datos_Personales de ON es.usuario_id = de.usuario_id
                                 LEFT JOIN Usuarios cl ON t.cliente_id = cl.usuario_id
                                 LEFT JOIN Datos_Personales dc ON cl.usuario_id = dc.usuario_id
                                 INNER JOIN Servicios s ON t.servicio_id = s.servicio_id
                                 WHERE t.fecha_turno >= CAST(GETDATE() AS DATE);";

                datos.settearConsulta(query);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    VisualizaciondeturnosAdmin turno = new VisualizaciondeturnosAdmin();

                    turno.TurnoID = (int)datos.Lector["TurnoID"];
                    turno.ClienteNombre = (string)datos.Lector["ClienteNombre"];
                    turno.EspecialistaNombre = (string)datos.Lector["EspecialistaNombre"];
                    turno.ServicioNombre = (string)datos.Lector["ServicioNombre"];
                    turno.FechaDeTurno = ((DateTime)datos.Lector["FechaDeTurno"]).Date;
                    turno.HoraDeTurno = TimeSpan.Parse(datos.Lector["HoraDeTurno"].ToString()); // Formatear hora
                    turno.Estado = (int)datos.Lector["Estado"];

                    lista.Add(turno);

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



    }
}
