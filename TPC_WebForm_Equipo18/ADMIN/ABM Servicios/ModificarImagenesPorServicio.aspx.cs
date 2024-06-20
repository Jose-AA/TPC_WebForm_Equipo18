using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_WebForm_Equipo18.ADMIN.ABM_Servicios
{
    public partial class ModificarImagenesPorServicio : System.Web.UI.Page
    {
        public List<Imagen> listaImagenes = new List<Imagen>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    ServicioNegocio negocio = new ServicioNegocio();

                    listaImagenes = negocio.listarImagenes(id);
                }

                repetidorImagenes.DataSource = listaImagenes;
                repetidorImagenes.DataBind();
            }


        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarServicios.aspx");
        }

        protected void btnEliminarImagen_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string idImagen = btn.CommandArgument;
            int idImagenInt = int.Parse(idImagen);

            ServicioNegocio negocio = new ServicioNegocio();
            negocio.desasociarImagen(idImagenInt);

            if (Request.QueryString["id"] != null)
            {
                int idServicio = int.Parse(Request.QueryString["id"]);
                Response.Redirect("ModificarImagenesPorServicio.aspx?id=" + idServicio);
            }
        }
    }
}