using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18
{
    public partial class MiPerfil : System.Web.UI.Page
    {

        public Usuario usuarioLogueado;
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuarioLogueado = new Usuario();

            usuarioLogueado = (Usuario)Session["usuario"];

            if (usuarioLogueado == null)
            {
                Response.Redirect("Default.aspx");
            }

            txtNombre.Text = usuarioLogueado.Nombre;
            txtApellido.Text = usuarioLogueado.Apellido;
        }
    }
}