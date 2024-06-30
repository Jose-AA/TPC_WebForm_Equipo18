using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace TPC_WebForm_Equipo18
{
    public partial class SolicitarTurno : System.Web.UI.Page
    {
        public Servicio servicioSeleccionado = new Servicio();
        public Especialista especialistaSeleccionado = new Especialista();
        public List<Turno> listaTurnos = new List<Turno>();

        public bool fechaSeleccionada = false;

        protected void Page_Load(object sender, EventArgs e)
        {

            servicioSeleccionado = (Servicio)Session["ServicioSeleccionado"];

            if(servicioSeleccionado == null)
            {
                Response.Redirect("/Default.aspx");
            }

            UsuarioNegocio usuarionegocio = new UsuarioNegocio();
            TurnoNegocio turnoNegocio = new TurnoNegocio();

            //Usuario aux = usuarionegocio.buscarPorID(2);

            //Deberiamos traer los datos del especialista...

            especialistaSeleccionado.IdRol = 2;
            especialistaSeleccionado.IdUsuario = 2;
            especialistaSeleccionado.Apellido = "Doe";
            especialistaSeleccionado.Nombre = "Jane";

            listaTurnos = turnoNegocio.listarPorServicio(especialistaSeleccionado, servicioSeleccionado);

            //configurarVisibilidadRetrocesoMes();

        }

        protected void calendarioTurnos_SelectionChanged(object sender, EventArgs e)
        {
            DateTime fechaSeleccionada = calendarioTurnos.SelectedDate;

            
            List<string> horariosDisponiblesParaFechaSeleccionada = obtenerHorasDisponiblesParaFecha(fechaSeleccionada);

            
            dibujarTiemposDisponibles(horariosDisponiblesParaFechaSeleccionada);

        }

        
        protected void calendarioTurnos_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime fechaActual = DateTime.Now.Date;

            // Si la fecha actual es una de las fechas no seleccionables
            if (e.Day.Date < fechaActual)
            {
                // Deshabilita la celda
                e.Day.IsSelectable = false;

                // Aplica un estilo para que la fecha deshabilitada se vea diferente
                e.Cell.BackColor = System.Drawing.Color.Gray;
                e.Cell.ForeColor = System.Drawing.Color.Black;
            }
            else
            {
                // Verificar si hay turnos disponibles para la fecha
                bool hayTurnos = listaTurnos.Any(turno => turno.FechaDeTurno.Date == e.Day.Date);

                if (!hayTurnos)
                {
                    e.Day.IsSelectable = false;
                    e.Cell.BackColor = System.Drawing.Color.Gray;
                    e.Cell.ForeColor = System.Drawing.Color.Black;
                }
                else
                {
                    // Opcional: resaltar fechas con turnos disponibles
                    // Si queremos, un color verde por ejemplo...
                }
            }



            foreach (Turno turno in listaTurnos)
            {
                if (turno.FechaDeTurno.Date == e.Day.Date)
                {
                    
                }
            }


            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Gray;
                e.Cell.ForeColor = System.Drawing.Color.Black;
            }

        }

        /*
        protected void calendarioTurnos_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            DateTime today = DateTime.Today;
            Calendar calendar = sender as Calendar;



            
            DateTime nextMonth = today.AddMonths(1);
            if (e.NewDate > nextMonth)
            {
                calendar.VisibleDate = nextMonth;
                // Oculta el enlace para adelantar de mes si se alcanza el límite
                calendar.NextMonthText = string.Empty;
            }
            else
            {
                // Muestra el enlace para adelantar de mes
                calendar.NextMonthText = ">";
            }
        }
        */

        /*
        private void configurarVisibilidadRetrocesoMes()
        {
            DateTime today = DateTime.Today;

            if (calendarioTurnos.VisibleDate.Year < today.Year || (calendarioTurnos.VisibleDate.Year == today.Year && calendarioTurnos.VisibleDate.Month <= today.Month))
            {
                calendarioTurnos.PrevMonthText = string.Empty; // Ocultar el enlace para retroceder de mes
            }
            else
            {
                calendarioTurnos.PrevMonthText = "<"; // Mostrar el enlace para retroceder de mes
            }
        }
        */

        private List<String> obtenerHorasDisponiblesParaFecha(DateTime fechaSeleccionada)
        {
            List<String> horariosTurnos = new List<string>();
            DateTime ahora = DateTime.Now;

            if(fechaSeleccionada.Date == ahora.Date)
            {
                for (int i = 0; i < listaTurnos.Count; i++)
                {
                    if (listaTurnos[i].FechaDeTurno.Date == fechaSeleccionada.Date && listaTurnos[i].HoraDeTurno > ahora.TimeOfDay)
                    {
                        horariosTurnos.Add(listaTurnos[i].HoraDeTurno.ToString());
                    }
                }
            }
            else
            {
                if(fechaSeleccionada > ahora)
                {
                    for (int i = 0; i < listaTurnos.Count; i++)
                    {
                        if (listaTurnos[i].FechaDeTurno.Date == fechaSeleccionada.Date)
                        {
                            horariosTurnos.Add(listaTurnos[i].HoraDeTurno.ToString());
                        }
                    }
                }
            }


            return horariosTurnos;
        }


        private void dibujarTiemposDisponibles(List<string> horariosTurnos)
        {

            StringBuilder sb = new StringBuilder();
            foreach (string time in horariosTurnos)
            {
                sb.AppendFormat("<div class='time-slot show' data-id='{0}' data-time='{1}'>{2} - {3}</div>", recuperarIdTurnoSegunFechaYHora(time), time, ConvertTo12HourFormat(time), ConvertTo12HourFormat(AddOneHour(time)));
            }

            // Injecta el HTML en la página
            string script = string.Format("document.getElementById('available-times').classList.add('show'); document.getElementById('time-slots-container').innerHTML = \"{0}\";", sb.ToString().Replace("\"", "\\\""));

            ClientScript.RegisterStartupScript(this.GetType(), "showTimes", script, true);
        }

        private int recuperarIdTurnoSegunFechaYHora(string hora)
        {
            int idTurno = 0;
            string fechaSeleccionada = calendarioTurnos.SelectedDate.Date.ToString();

            for(int i = 0; i < listaTurnos.Count; i++)
            {
                if (listaTurnos[i].FechaDeTurno.Date.ToString() == fechaSeleccionada && listaTurnos[i].HoraDeTurno.ToString() == hora)
                {
                    idTurno = listaTurnos[i].ID;
                    break;
                }
            }

            return idTurno;
            
        }


        private string ConvertTo12HourFormat(string time)
        {
            DateTime dt = DateTime.Parse(time);
            return dt.ToString("hh:mm tt");
        }

        private string AddOneHour(string time)
        {
            DateTime dt = DateTime.Parse(time);
            return dt.AddHours(1).ToString("HH:mm");
        }

        protected void btnConfirmarTurno_Click(object sender, EventArgs e)
        {
            TurnoNegocio negocio = new TurnoNegocio();
            string idTurno = hiddenFieldIdTurno.Value;

            negocio.tomarTurno(6, int.Parse(idTurno));

            ScriptManager.RegisterStartupScript(this, this.GetType(), "modalTurnoConfirmado", "modalTurnoExitoso();", true);

        }

        protected void btnNoConfirmarTurno_Click(object sender, EventArgs e)
        {
            return;
        }
    }
}