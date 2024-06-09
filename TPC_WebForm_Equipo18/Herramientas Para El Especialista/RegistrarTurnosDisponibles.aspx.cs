using Dominio;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18.Herramientas_Para_El_Especialista
{
    public partial class RegistrarTurnosDisponibles : System.Web.UI.Page
    {
        public class Horario
        {
            public DateTime Fecha { get; set; }
            public string HoraDesde { get; set; }
            public string HoraHasta { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
           
                string fechaSeleccionada = FechaSeleccionada.Text;

                DateTime fecha;
                if (string.IsNullOrEmpty(fechaSeleccionada))
                {
                 
                    fecha = DateTime.Today.AddDays(-1); // Fecha de ayer
                }
                else
                {
                    // Convertir la fecha seleccionada en un objeto DateTime
                    fecha = DateTime.ParseExact(fechaSeleccionada, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                }

                List<Horario> horarios = new List<Horario>
                {

                    new Horario { Fecha = fecha, HoraDesde = "08:00", HoraHasta = "09:00" },
                    new Horario { Fecha = fecha, HoraDesde = "09:00", HoraHasta = "10:00" },
                    new Horario { Fecha = fecha, HoraDesde = "10:00", HoraHasta = "11:00" },
                    new Horario { Fecha = fecha, HoraDesde = "11:00", HoraHasta = "12:00" },
                    new Horario { Fecha = fecha, HoraDesde = "12:00", HoraHasta = "13:00" },
                    new Horario { Fecha = fecha, HoraDesde = "13:00", HoraHasta = "14:00" },
                    new Horario { Fecha = fecha, HoraDesde = "14:00", HoraHasta = "15:00" },
                    new Horario { Fecha = fecha, HoraDesde = "15:00", HoraHasta = "16:00" },
                    new Horario { Fecha = fecha, HoraDesde = "16:00", HoraHasta = "17:00" },
                    new Horario { Fecha = fecha, HoraDesde = "17:00", HoraHasta = "18:00" },
                    new Horario { Fecha = fecha, HoraDesde = "18:00", HoraHasta = "19:00" },
                    new Horario { Fecha = fecha, HoraDesde = "19:00", HoraHasta = "20:00" },
                    // Agrega más horarios aquí según sea necesario
                };

                // Asignamos la lista de horarios al GridView
                gridTurnos.DataSource = horarios;
                gridTurnos.DataBind();
            }
        }




        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gridTurnos.Rows)
            { 
                TurnoNegocio AgregarTurno = new TurnoNegocio();

                // Obtener el CheckBox de la fila actual
                CheckBox chkHabilitar = (CheckBox)row.FindControl("chkHabilitar");

                // Verificar si el CheckBox está marcado
                if (chkHabilitar.Checked)
                {
                    // Obtener los datos de la fila actual
                    string fecha = ((Label)row.FindControl("lblFecha")).Text;
                    DateTime fechaTurno = DateTime.ParseExact(fecha, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    Console.WriteLine(fechaTurno);
                    Console.WriteLine(fecha);
                    string horaDesde = row.Cells[1].Text; // Índice de la columna "Desde"
                    Turno nuevoTurno = new Turno();
                    nuevoTurno.FechaDeTurno = fechaTurno;
                    nuevoTurno.HoraDeTurno = TimeSpan.Parse(horaDesde);

                    //colocar por secion el id especialista
                    nuevoTurno.Especialista = new Especialista { IdUsuario = 1 };

                    //colocar por secion el id servicio
                    nuevoTurno.Servicio = new Servicio { Id = 1 };

                    nuevoTurno.Estado = 1;


                    AgregarTurno.Agregar(nuevoTurno);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalTurnoAgregado", "abrirModalTurnoCargado();", true);
                 

                   


                }
        }
    }


            protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void chkHabilitar_CheckedChanged(object sender, EventArgs e)
        {
          
        }

    protected void button3_Click(object sender, EventArgs e)
        {
            string fechaSeleccionada = FechaSeleccionada.Text;

            DateTime fecha;
            if (string.IsNullOrEmpty(fechaSeleccionada))
            {
                // Si la fecha seleccionada es nula o vacía, asignar la fecha de ayer
                fecha = DateTime.Today.AddDays(-1); // Fecha de ayer
            }
            else
            {
                // Convertir la fecha seleccionada en un objeto DateTime
                fecha = DateTime.ParseExact(fechaSeleccionada, "yyyy-MM-dd", CultureInfo.InvariantCulture);
            }

            List<Horario> horarios = new List<Horario>
                {

                    new Horario { Fecha = fecha, HoraDesde = "08:00", HoraHasta = "09:00" },
                    new Horario { Fecha = fecha, HoraDesde = "09:00", HoraHasta = "10:00" },
                    new Horario { Fecha = fecha, HoraDesde = "10:00", HoraHasta = "11:00" },
                    new Horario { Fecha = fecha, HoraDesde = "11:00", HoraHasta = "12:00" },
                    new Horario { Fecha = fecha, HoraDesde = "12:00", HoraHasta = "13:00" },
                    new Horario { Fecha = fecha, HoraDesde = "13:00", HoraHasta = "14:00" },
                    new Horario { Fecha = fecha, HoraDesde = "14:00", HoraHasta = "15:00" },
                    new Horario { Fecha = fecha, HoraDesde = "15:00", HoraHasta = "16:00" },
                    new Horario { Fecha = fecha, HoraDesde = "16:00", HoraHasta = "17:00" },
                    new Horario { Fecha = fecha, HoraDesde = "17:00", HoraHasta = "18:00" },
                    new Horario { Fecha = fecha, HoraDesde = "18:00", HoraHasta = "19:00" },
                    new Horario { Fecha = fecha, HoraDesde = "19:00", HoraHasta = "20:00" },
                };

           
            gridTurnos.DataSource = horarios;
            gridTurnos.DataBind();



        }
    }
}
