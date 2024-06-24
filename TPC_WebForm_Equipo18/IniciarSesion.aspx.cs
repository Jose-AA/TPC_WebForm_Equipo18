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
    public partial class IniciarSesion : System.Web.UI.Page
    {
        bool errorLogin = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuarioLogueado = new Usuario();

            usuarioLogueado = (Usuario)Session["usuario"];

            if (usuarioLogueado != null)
            {
                Response.Redirect("Default.aspx");
            }

            if (IsPostBack)
            {
                if (errorLogin == true)
                {
                    lblErrorLogin.Text = "* Credenciales incorrectas";
                    errorLogin = false;
                }
            }
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {

            Page.Validate();

            if (!Page.IsValid)
            {
                errorLogin = true;
                return;
            }

            string email = txtEmailLogin.Text;
            string contraseña = txtContraseñaLogin.Text;

            if (String.IsNullOrEmpty(email) || string.IsNullOrEmpty(contraseña))
            {
                return;
            }

            UsuarioNegocio usuarionegocio = new UsuarioNegocio();

            Usuario logueado = new Usuario();

            //Verificamos si el usuario existe segun las credenciales ingresadas
            logueado = usuarionegocio.login(email, contraseña);

            if (logueado.IdUsuario == 0)
            {
                errorLogin = true;
                lblErrorLogin.Text = "* Credenciales incorrectas";
                return;
            }

            //Recuperamos los datos personales asociados al usuario en una variable auxiliar
            //Y procedemos a asignarle los datos al usuario logueado
            DatosPersonalesNegocio datosPersonalesNegocio = new DatosPersonalesNegocio();
            Usuario auxDatosPersonales = datosPersonalesNegocio.recuperarDatosPersonalesLogin(logueado.IdUsuario);

            logueado.Nombre = auxDatosPersonales.Nombre;
            logueado.Apellido = auxDatosPersonales.Apellido;
            logueado.Direccion = auxDatosPersonales.Direccion;
            logueado.Telefono = auxDatosPersonales.Telefono;
            logueado.Dni = auxDatosPersonales.Dni;
            logueado.FechaNacimiento = auxDatosPersonales.FechaNacimiento;

            Session.Add("usuario", logueado);
            Response.Redirect("MiPerfil.aspx");
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrarse.aspx");
        }
    }
}