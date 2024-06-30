using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace TPC_WebForm_Equipo18
{
     
    public partial class DetalleServicio : System.Web.UI.Page
    {
        public Servicio servicioSeleccionado;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                servicioSeleccionado = (Servicio)Session["ServicioSeleccionado"];

                if(servicioSeleccionado == null)
                {
                    Response.Redirect("/Default.aspx");
                }
            }
        }

        protected void btnSolicitarTurno_Click(object sender, EventArgs e)
        {
            Response.Redirect("/SolicitarTurno.aspx");
        }
    }
}