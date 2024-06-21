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
            if (Session["usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            usuarioLogueado = (Usuario)Session["Usuario"];

            txtNombre.Text = usuarioLogueado.Nombre;
            txtApellido.Text = usuarioLogueado.Apellido;
        }
    }
}