﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_WebForm_Equipo18.Formularios_de_Registro_de_Informacion;

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
                // Cargamos la lista desplegable de especialistas   
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                List<Usuario> Especialistas = new List<Usuario>();
                Especialistas = usuarioNegocio.listarEspecialistas();

                var usuarioDisplayList = Especialistas.Select(u => new
                {
                    DisplayText = $"{u.Nombre} {u.Apellido}",
                    u.IdUsuario
                }).ToList();

                Especialistaslist.DataSource = usuarioDisplayList;
                Especialistaslist.DataTextField = "DisplayText";
                Especialistaslist.DataValueField = "IdUsuario";
                Especialistaslist.DataBind();
                Especialistaslist.Items.Insert(0, new ListItem("Seleccione un especialista", "0"));

                // <---------------------------------------------->

                //Cargamos la lista de servicios 

                ServicioNegocio negocio = new ServicioNegocio();
                List<Servicio> listaServicios = new List<Servicio>();
                listaServicios = negocio.listar();
                ListadeServicios.DataSource = listaServicios;
                ListadeServicios.DataTextField = "Nombre";
                ListadeServicios.DataValueField = "Id";
                ListadeServicios.DataBind();
                ListadeServicios.Items.Insert(0, new ListItem("Seleccione un servicio", "0"));

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
            // validamos que se haya seleccionado especialista y servicio 
            
            if(Especialistaslist.SelectedValue == "0" || ListadeServicios.SelectedValue == "0")
            {
               string mensajeError = "Debe seleccionar un especialista y un servicio para poder continuar.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalError", $"abrirModalEspecialistaServicioRequerido('{mensajeError}');", true);
                return;
           
            }


            // validamos que se haya seleccionado al menos un turno 

            bool hayTurnosSeleccionados = false;

            foreach (GridViewRow row in gridTurnos.Rows)
            {
                CheckBox chkHabilitar = (CheckBox)row.FindControl("chkHabilitar");
                if (chkHabilitar.Checked)
                {
                    hayTurnosSeleccionados = true;
                    break;
                }
            }

            if (hayTurnosSeleccionados == false)
            {
                string mensajeError = "Debe seleccionar al menos un turno para poder continuar.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalError", $"abrirModalTurnoRequerido('{mensajeError}');", true);
                return;
            }

            List<string> turnosDadoDeAlta = new List<string>();
            List<string> turnosExistente = new List<string>();
            List<string> turnosIncoherentes = new List<string>();

            foreach (GridViewRow row in gridTurnos.Rows)
            {
                TurnoNegocio AgregarTurno = new TurnoNegocio();

                // Obtener el CheckBox de la fila actual
                CheckBox chkHabilitar = (CheckBox)row.FindControl("chkHabilitar");

                // Verificar si el CheckBox está marcado
                if (chkHabilitar.Checked)
                {
                    // Obtener los datos de la fila actual
                    DateTime ahora = DateTime.Now;
                    string fecha = ((Label)row.FindControl("lblFecha")).Text;
                    DateTime fechaTurno = DateTime.ParseExact(fecha, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    string horaDesde = row.Cells[1].Text; // Índice de la columna "Desde"
                    Turno nuevoTurno = new Turno();
                    nuevoTurno.FechaDeTurno = fechaTurno;
                    nuevoTurno.HoraDeTurno = TimeSpan.Parse(horaDesde);

                 
                    nuevoTurno.Especialista = new Especialista();

                    nuevoTurno.Especialista.IdUsuario = int.Parse(Especialistaslist.SelectedValue);

               
                    nuevoTurno.Servicio = new Servicio();
                    nuevoTurno.Servicio.Id = int.Parse(ListadeServicios.SelectedValue);

                    nuevoTurno.Estado = 1;

                    string horarioTurno = $"{fecha} {horaDesde}";

                    if (fechaTurno < ahora.Date || (fechaTurno == ahora.Date && nuevoTurno.HoraDeTurno < ahora.TimeOfDay))
                    {
                        turnosIncoherentes.Add(horarioTurno);
                    }
                    else

                    if (AgregarTurno.VerificarExistencia(nuevoTurno.FechaDeTurno, nuevoTurno.HoraDeTurno.ToString()))
                    {
                        turnosExistente.Add(horarioTurno);
                    }
                    else
                    {
                        AgregarTurno.Agregar(nuevoTurno);
                        turnosDadoDeAlta.Add(horarioTurno);
                    }


                }
            }




            if (turnosDadoDeAlta.Count > 0)
            {
                string mensajeTurnosDadoDeAlta = string.Join("<br>", turnosDadoDeAlta);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalTurnosDadoDeAlta", $"abrirModalTurnosDadoDeAlta('{mensajeTurnosDadoDeAlta}');", true);
            }

            if (turnosExistente.Count > 0)
            {
                string mensajeTurnosExistente = string.Join("<br>", turnosExistente);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalTurnosExistente", $"abrirModalTurnosExistente('{mensajeTurnosExistente}');", true);
            }

            if(turnosIncoherentes.Count > 0)
            {
                string mensajeTurnosIncoherentes = string.Join("<br>", turnosIncoherentes);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalTurnosIncoherentes", $"abrirModalTurnosIncoherentes('{mensajeTurnosIncoherentes}');", true);
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
