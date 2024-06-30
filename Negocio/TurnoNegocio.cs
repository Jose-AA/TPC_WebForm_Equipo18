using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class TurnoNegocio
{
    public void Agregar(Turno turno)
    {
        AccesoDatos datos = new AccesoDatos();
        string query = @"INSERT INTO Turnos (especialista_id, servicio_id, fecha_turno, hora_turno, estado_id) 
                     VALUES (@especialista_id, @servicio_id, @fecha_turno, @hora_turno, @estado_id)";

        try
        {
            datos.settearConsulta(query);
            datos.setearParametro("@especialista_id", turno.Especialista.IdUsuario);
            datos.setearParametro("@servicio_id", turno.Servicio.Id);
            datos.setearParametro("@fecha_turno", turno.FechaDeTurno);
            datos.setearParametro("@hora_turno", turno.HoraDeTurno);
            datos.setearParametro("@estado_id", turno.Estado);

            datos.ejecutarAccion(); // Esta línea ejecuta la consulta SQL
        }
        catch (Exception ex)
        {
            // Aquí podrías agregar algún manejo de excepciones más específico si es necesario
            throw ex;
        }
        finally
        {
            datos.cerrarConexion(); // Asegurarse de cerrar la conexión en el bloque finally
        }
    }

    public bool VerificarExistencia(DateTime fechaTurno, string horaTurno, int especialistaId)
    {
        int cantidadTurnos = 0;
        AccesoDatos datos = new AccesoDatos();
        try
        {
            // Construir la consulta SQL para contar los turnos en la fecha, hora y con el especialista especificado
            string query = @"SELECT COUNT(*) FROM Turnos WHERE fecha_turno = @fecha_turno AND hora_turno = @hora_turno AND especialista_id = @especialista_id";

            // Setear la consulta en el comando
            datos.settearConsulta(query);

            // Setear los parámetros de la consulta
            datos.setearParametro("@fecha_turno", fechaTurno);
            datos.setearParametro("@hora_turno", horaTurno);
            datos.setearParametro("@especialista_id", especialistaId);

            // Ejecutar la consulta y obtener el resultado
            datos.ejecutarLectura();

            // Verificar si se obtuvieron resultados y asignar la cantidad de turnos
            if (datos.Lector.HasRows)
            {
                datos.Lector.Read(); // Leer el primer resultado
                cantidadTurnos = Convert.ToInt32(datos.Lector[0]); // Obtener la cantidad de turnos
            }

            // Cerrar la conexión
            datos.cerrarConexion();
        }
        catch (Exception ex)
        {
            throw ex;
        }

       if(cantidadTurnos > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public void ActualizarEstado(Turno turno)
    {
        AccesoDatos datos = new AccesoDatos();
        string query = @"UPDATE Turnos SET estado_id = @estado_id WHERE turno_id = @turno_id";

        try
        {
            datos.settearConsulta(query);
            datos.setearParametro("@estado_id", turno.Estado);
            datos.setearParametro("@turno_id", turno.ID);

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

