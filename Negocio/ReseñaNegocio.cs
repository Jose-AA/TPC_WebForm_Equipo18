using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ReseñaNegocio
    {

        public List<Resena> Listar()
        {
            List<Resena> lista = new List<Resena>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"
             SELECT 
               r.reseña_id, 
               r.cliente_id, 
               r.especialista_id, 
                r.servicio_id, 
                 r.calificacion, 
                 r.comentario, 
    r.activo, 
    r.creado_en,
    ISNULL(dc.nombre, 'Cliente sin nombre') AS cliente_nombre, 
    ISNULL(dc.apellido, 'Cliente sin apellido') AS cliente_apellido,
    ISNULL(de.nombre, 'Especialista sin nombre') AS especialista_nombre, 
    ISNULL(de.apellido, 'Especialista sin apellido') AS especialista_apellido,
    ISNULL(s.nombre, 'Servicio sin nombre') AS servicio_nombre
FROM 
    Reseñas r
    LEFT JOIN Usuarios uc ON r.cliente_id = uc.usuario_id
    LEFT JOIN Datos_Personales dc ON uc.usuario_id = dc.usuario_id
    LEFT JOIN Usuarios ue ON r.especialista_id = ue.usuario_id
    LEFT JOIN Datos_Personales de ON ue.usuario_id = de.usuario_id
    LEFT JOIN Servicios s ON r.servicio_id = s.servicio_id";

                datos.settearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Cliente cliente = new Cliente
                    {
                        IdUsuario = (int)datos.Lector["cliente_id"],
                        Nombre = (string)datos.Lector["cliente_nombre"],
                        Apellido = (string)datos.Lector["cliente_apellido"]
                    };

                    Especialista especialista = new Especialista
                    {
                        IdUsuario = (int)datos.Lector["especialista_id"],
                        Nombre = (string)datos.Lector["especialista_nombre"],
                        Apellido = (string)datos.Lector["especialista_apellido"]
                    };

                    Servicio servicio = new Servicio
                    {
                        Id = (int)datos.Lector["servicio_id"],
                        Nombre = (string)datos.Lector["servicio_nombre"]
                    };

                    Resena resena = new Resena
                    {
                        ResenaId = (int)datos.Lector["reseña_id"],
                        Cliente = cliente,
                        Especialista = especialista,
                        Servicio = servicio,
                        Calificacion = (int)datos.Lector["calificacion"],
                        Comentario = (string)datos.Lector["comentario"],
                        Activo = (bool)datos.Lector["activo"],
                        CreadoEn = (DateTime)datos.Lector["creado_en"]
                    };

                    lista.Add(resena);
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
