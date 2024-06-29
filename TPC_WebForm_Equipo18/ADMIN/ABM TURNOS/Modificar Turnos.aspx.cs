using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18.ADMIN.ABM_TURNOS
{
    
    public partial class Modificar_Turnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) CargarTurnos();
           

        }

        protected void gridTurnos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Obtener el RadioButtonList dentro de la fila actual
                RadioButtonList rblEstado = (RadioButtonList)e.Row.FindControl("rblEstado");

                // Obtener el valor del EstadoID
                int estadoID = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "EstadoID"));

                // Seleccionar el ListItem correspondiente según el EstadoID
                switch (estadoID)
                {
                    case 1:
                        rblEstado.SelectedValue = "True"; // Vigente
                        break;
                    case 2:
                        rblEstado.SelectedValue = "False"; // Finalizado
                        break;
                    case 3:
                        rblEstado.SelectedValue = "3"; // Cancelado
                        break;
                    default:
                        // Manejar cualquier otro caso si es necesario
                        break;
                }
            }

        }

        protected void rblEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rblEstado = (RadioButtonList)sender;
            GridViewRow row = (GridViewRow)rblEstado.NamingContainer;
            Label lblTurnoID = (Label)row.FindControl("IddelTurno");
            int turnoID = Convert.ToInt32(lblTurnoID.Text);
            int estadoSeleccionado = Convert.ToInt32(rblEstado.SelectedValue);

            // Aquí realizas la actualización en la base de datos
            Turno turno = new Turno();
            turno.ID = turnoID;
            turno.Estado = estadoSeleccionado;

            TurnoNegocio negocio = new TurnoNegocio();

            negocio.ActualizarEstado(turno);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "showSuccessModal()", true);
            CargarTurnos();

        }
        private void CargarTurnos()
        {
            VisualizacionTurnosAdminNegocio negocio = new VisualizacionTurnosAdminNegocio();
            List<VisualizaciondeturnosAdmin> lista = negocio.ListarTurnos();

            string busqueda = txtBuscar.Text.ToLower();
            string fechaSeleccionada = FechaSeleccionada.Text;

            string filtro = ddlFiltro.SelectedValue;


            switch (filtro)
            {
                case "NombreServicio":
                    if (!string.IsNullOrEmpty(busqueda))
                    {
                        lista = lista.FindAll(x => x.ServicioNombre.ToLower().Contains(busqueda));
                    }
                    break;

                case "NombreCliente":
                    if (!string.IsNullOrEmpty(busqueda))
                    {
                        lista = lista.FindAll(x => x.ClienteNombre.ToLower().Contains(busqueda));
                    }
                    break;

                case "NombreEspecialista":
                    if (!string.IsNullOrEmpty(busqueda))
                    {
                        lista = lista.FindAll(x => x.EspecialistaNombre.ToLower().Contains(busqueda));
                    }
                    break;

                default:
                  
                    break;
            }
          
            if (!string.IsNullOrEmpty(fechaSeleccionada))
            {
                DateTime fecha;
                if (DateTime.TryParse(fechaSeleccionada, out fecha))
                {
                    lista = lista.FindAll(x => x.FechaDeTurno.Date == fecha.Date);
                }
            }

            gridTurnos.DataSource = lista;
            gridTurnos.DataBind();
        }


        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarTurnos();

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }
    }
}