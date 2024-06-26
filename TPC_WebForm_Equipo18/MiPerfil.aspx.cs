using Dominio;
using Negocio;
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

        public Usuario usuarioLogueado = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioLogueado = (Usuario)Session["usuario"];

            if (usuarioLogueado == null)
            {
                Response.Redirect("Default.aspx");
            }

            if(!String.IsNullOrEmpty(usuarioLogueado.Nombre))
                txtNombre.Text = usuarioLogueado.Nombre;

            if(!String.IsNullOrEmpty(usuarioLogueado.Apellido))
                txtApellido.Text = usuarioLogueado.Apellido;

            if(!String.IsNullOrEmpty(usuarioLogueado.Telefono) && !String.Equals("N/A", usuarioLogueado.Telefono))
                txtTelefono.Text = usuarioLogueado.Telefono;

            if(!String.IsNullOrEmpty(usuarioLogueado.Dni.ToString()) && !String.Equals("-1", usuarioLogueado.Dni.ToString()) )
                txtDNI.Text = usuarioLogueado.Dni.ToString();

            if(!String.IsNullOrEmpty(usuarioLogueado.FechaNacimiento.ToString()) && !String.Equals("1/1/1754 00:00:00", usuarioLogueado.FechaNacimiento.ToString()))
                txtFechaNacimiento.Text = usuarioLogueado.FechaNacimiento.ToString("yyyy-MM-dd");
            
            if(!String.IsNullOrEmpty(usuarioLogueado.Direccion) && !String.Equals("N/A", usuarioLogueado.Direccion))
                txtDomicilio.Text = usuarioLogueado.Direccion;

            
  
        }

        protected void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtNombre.Text))
                usuarioLogueado.Nombre = txtNombre.Text;

            if (!String.IsNullOrEmpty(txtApellido.Text))
                usuarioLogueado.Apellido = txtApellido.Text;

            if (!String.IsNullOrEmpty(txtTelefono.Text))
                usuarioLogueado.Telefono = txtTelefono.Text;

            if (!String.IsNullOrEmpty(txtDNI.Text))
                usuarioLogueado.Dni = int.Parse(hiddenField.Value);

            if (!String.IsNullOrEmpty(txtFechaNacimiento.Text))
                usuarioLogueado.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

            if (!String.IsNullOrEmpty(txtDomicilio.Text))
                usuarioLogueado.Direccion = txtDomicilio.Text;

            DatosPersonalesNegocio negocio = new DatosPersonalesNegocio();

            negocio.modificar(usuarioLogueado);

            Response.Redirect("MiPerfil.aspx");
        }
    }
}