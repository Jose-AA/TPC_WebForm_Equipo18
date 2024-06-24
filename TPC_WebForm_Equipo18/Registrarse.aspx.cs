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
    public partial class Registrarse : System.Web.UI.Page
    {
        bool errorSignUp = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuarioLogueado = new Usuario();

            usuarioLogueado = (Usuario)Session["usuario"];

            if (usuarioLogueado != null)
            {
                Response.Redirect("Default.aspx");
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

            if (string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(apellido) || string.IsNullOrEmpty(email)
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
            Response.Redirect("IniciarSesion.aspx");
        }
    }
}