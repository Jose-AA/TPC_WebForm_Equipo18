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
    public partial class Login : System.Web.UI.Page
    {
        bool errorSignUp = false;
        bool errorLogin = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(errorSignUp == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mostrarVentanaSignUp", "errorSignUp();", true);
                errorSignUp = false;
            }

            if(errorLogin == true)
            {
                lblErrorLogin.Text = "* Usuario o contraseña incorrecto";
                errorLogin = false;
            }
        }

        protected void btnRegistrarUsuario_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (!Page.IsValid)
            {
                errorSignUp = true;
                return;
            }

            string nombre = txtNombreRegistrar.Text;
            string apellido = txtApellidoRegistrar.Text;
            string email = txtEmailRegistrar.Text;
            string contraseña = txtContraseñaRegistrar.Text;
            string repetirContraseña = txtValidarContraseñaRegistrar.Text;

            if(string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(apellido) || string.IsNullOrEmpty(email)
                || string.IsNullOrEmpty(contraseña) || string.IsNullOrEmpty(repetirContraseña))
            {
                return;
            }

            Usuario nuevo = new Usuario();
            nuevo.Nombre = nombre;
            nuevo.Apellido = apellido;
            nuevo.Email = email;
            nuevo.Contraseña = contraseña;
            nuevo.IdRol = 4; //Rol de cliente
            nuevo.Dni = -1; //Valor auxiliar, la base de datos lo tiene como not null. A modificar por el usuario
            nuevo.Telefono = "N/A"; //Valor auxiliar, a modificar por el usuario
            nuevo.Direccion = "N/A"; //Valor auxiliar, a modificar por el usuario
            nuevo.FechaNacimiento = new DateTime(1754, 1, 1); //Valor auxiliar, a modificar por el usuario

            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            usuarioNegocio.agregar(nuevo);

            //Recuperamos el ID para registrar los datos personales
            nuevo.IdUsuario = usuarioNegocio.buscarIDPorEmail(nuevo.Email);

            //Registramos los datos personales obligatorios para la base de datos
            DatosPersonalesNegocio datosPersonalesNegocio = new DatosPersonalesNegocio();
            datosPersonalesNegocio.agregar(nuevo);

            Session.Add("usuario", nuevo);
            Response.Redirect("MiPerfil.aspx");
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

            if(String.IsNullOrEmpty(email) || string.IsNullOrEmpty(contraseña))
            {
                return;
            }

            UsuarioNegocio usuarionegocio = new UsuarioNegocio();

            Usuario logueado = new Usuario();

            //Verificamos si el usuario existe segun las credenciales ingresadas
            logueado = usuarionegocio.login(email, contraseña);

            if(logueado == null)
            {
                errorLogin = true;
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
    }
}