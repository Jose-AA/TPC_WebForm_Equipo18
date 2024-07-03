using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Globalization;

namespace TPC_WebForm_Equipo18
{
    public partial class SolicitarTurno : System.Web.UI.Page
    {
        public Servicio servicioSeleccionado;
        public Especialista especialistaSeleccionado;
        public List<Especialista> especialistas;
        public List<Turno> listaTurnos;
        bool eventoAgregado;
        public bool primeraVisita;
        private DateTime fechaElegida;

        protected void Page_Load(object sender, EventArgs e)
        {

            Page.MaintainScrollPositionOnPostBack = true;

            servicioSeleccionado = (Servicio)Session["ServicioSeleccionado"];

            if (servicioSeleccionado == null)
            {
                Response.Redirect("/Default.aspx");
            }

            if(servicioSeleccionado != null && especialistaSeleccionado != null)
            {
                TurnoNegocio turnoNegocio = new TurnoNegocio();
                listaTurnos = turnoNegocio.listarPorServicio(especialistaSeleccionado, servicioSeleccionado);
            }

            if (ViewState["SelectedDate"] != null)
            {
                fechaElegida = (DateTime)ViewState["SelectedDate"];
            }


            if (!IsPostBack)
            {
                fechaElegida = DateTime.MinValue;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "mostrarCalendario", "ocultarCalendario();", true);
                EspecialistaNegocio especialistaNegocio = new EspecialistaNegocio();

                especialistas = especialistaNegocio.ListarEspecialistasysusservicosAsociados();
                primeraVisita = false;

                especialistaSeleccionado = new Especialista();

                var especialistasFiltrados = especialistas.Where(es => es.ServicioAsociado.Id == servicioSeleccionado.Id).ToList();

                repeaterEspecialistas.DataSource = especialistasFiltrados;
                repeaterEspecialistas.DataBind();
            }

            //configurarVisibilidadRetrocesoMes();

        }

        protected void calendarioTurnos_SelectionChanged(object sender, EventArgs e)
        {

            fechaElegida = calendarioTurnos.SelectedDate;
            ViewState["SelectedDate"] = fechaElegida;

            DateTime fechaSeleccionada = calendarioTurnos.SelectedDate;

            
            List<string> horariosDisponiblesParaFechaSeleccionada = obtenerHorasDisponiblesParaFecha(fechaSeleccionada);

            
            dibujarTiemposDisponibles(horariosDisponiblesParaFechaSeleccionada);

            Page.MaintainScrollPositionOnPostBack = false;
            ClientScript.RegisterStartupScript(this.GetType(), "scrollScript", "scrollToPositionTimes();", true);

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
                if(Session["turnos"] != null)
                {
                    listaTurnos = (List<Turno>)Session["turnos"];

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

            }

            if (e.Day.Date == fechaElegida)
            {
                e.Cell.BackColor = System.Drawing.Color.LightBlue; // Cambiar el color de fondo para indicar deshabilitación
                e.Cell.Controls.Clear(); // Remover el enlace
                e.Cell.Text = e.Day.Date.Day.ToString(); // Solo mostrar el texto de la fecha
            }

            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Gray;
                e.Cell.ForeColor = System.Drawing.Color.Black;
            }

        }

        protected void calendarioTurnos_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            //hiddenFieldFlagMostrarCalendario.Value = "true";
            
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

            listaTurnos = (List<Turno>)Session["turnos"];

            if (fechaSeleccionada.Date == ahora.Date)
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

        public void actualizarEspecialistaSeleccionado()
        {
            string idEspecialista = hiddenFieldIdEspecialista.Value;
            idEspecialista = idEspecialista.Replace("{", "");
            idEspecialista= idEspecialista.Replace("}", "");

            EspecialistaNegocio especialistaNegocio = new EspecialistaNegocio();

            especialistas = especialistaNegocio.ListarEspecialistasysusservicosAsociados();

            if (string.IsNullOrEmpty(idEspecialista))
            {
                return;
            }

            for(int i = 0; i < especialistas.Count; i++)
            {
                string auxid = especialistas[i].IdUsuario.ToString();

                if (String.Equals(auxid, idEspecialista))
                {
                    especialistaSeleccionado = especialistas[i];
                    lblNombreEspecialista.Text = "Especialista: " + especialistaSeleccionado.Nombre + ", " + especialistaSeleccionado.Apellido;
                    calendarioTurnos.SelectedDate = DateTime.MinValue;
                    break;
                }
            }
        }

        public void actualizarListaTurnos()
        {
            if (especialistaSeleccionado != null)
            {
                TurnoNegocio turnoNegocio = new TurnoNegocio();
                listaTurnos = turnoNegocio.listarPorServicio(especialistaSeleccionado, servicioSeleccionado);
                DateTime ahora = DateTime.Now;
                TimeSpan horaActual = ahora.TimeOfDay;

                listaTurnos = listaTurnos.Where(t => t.FechaDeTurno.Date > ahora.Date ||
                              (t.FechaDeTurno.Date == ahora.Date && t.HoraDeTurno > horaActual)).ToList();


                if (Session["turnos"] == null)
                {
                    Session.Add("turnos", listaTurnos);
                }
                else
                {
                    Session["turnos"] = listaTurnos;
                }
            }

            if(eventoAgregado == false)
            {
                calendarioTurnos.DayRender += new DayRenderEventHandler(calendarioTurnos_DayRender);
                eventoAgregado = true;
            }
        }

        protected void btnElegirEspecialista_Click(object sender, EventArgs e)
        {
            actualizarEspecialistaSeleccionado();
            actualizarListaTurnos();

            Page.MaintainScrollPositionOnPostBack = false;
            ClientScript.RegisterStartupScript(this.GetType(), "scrollScript", "scrollToPositionTimes();", true);
        }
    }
}