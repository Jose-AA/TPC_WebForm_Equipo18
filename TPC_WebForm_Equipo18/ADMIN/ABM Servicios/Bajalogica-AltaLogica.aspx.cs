using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18.ADMIN.ABM_Servicios
{
    public partial class Bajalogica_AltaLogica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarServicios();
            }
        }

        private void CargarServicios()
        {
            List<Servicio> lista = new List<Servicio>();
            ServicioNegocio negocio = new ServicioNegocio();
            lista = negocio.listar();
            gridServicios.DataSource = lista;
            gridServicios.DataBind();
        }

        protected void rblEstado_SelectedIndexChanged1(object sender, EventArgs e)
        {
            RadioButtonList rblEstado = (RadioButtonList)sender;
            GridViewRow gridViewRow = (GridViewRow)rblEstado.NamingContainer;

            if (gridViewRow != null && gridViewRow.RowType == DataControlRowType.DataRow)
            {
                int servicioId = Convert.ToInt32(((Label)gridViewRow.FindControl("Iddelservicio")).Text);

                // Obtener el servicio asociado al ítem del GridView
                Servicio servicioModificado = new Servicio();
                servicioModificado.Id = servicioId;
                servicioModificado.Activo = Convert.ToBoolean(rblEstado.SelectedValue);

                // Actualizar en la base de datos utilizando el objeto negocio correspondiente
                ServicioNegocio negocio = new ServicioNegocio();
                negocio.ActualizarEstado(servicioModificado);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "showSuccessModal()", true);
                // Volver a cargar los servicios en el GridView
                CargarServicios();
                
            }
        }

        protected void gridServicios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Servicio servicio = (Servicio)e.Row.DataItem;
                RadioButtonList rblEstado = (RadioButtonList)e.Row.FindControl("rblEstado");

                if (rblEstado != null)
                {
                    // Configurar el estado activo o desactivo según el valor de la propiedad
                    rblEstado.SelectedValue = servicio.Activo ? "true" : "false";
                }
            }

        }
    }
}