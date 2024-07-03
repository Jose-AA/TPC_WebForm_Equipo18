using Dominio;
using negocio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18.Recepcion.Alta_de_clientes
{
    public partial class ModificacionClientesRecepcion : System.Web.UI.Page
    {
        Usuario aux;
        int ID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int userId;
                    if (int.TryParse(Request.QueryString["id"], out userId))
                    {

                        ID = userId;
                        Session["id_usuario"] = ID;
                    }

                }
            }
                RescatarUsuario();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            // datos.settearConsulta("update Usuarios set id_rol = @idRol, correo_electronico = @email, contraseña = @password where usuario_id = @id ");
            UsuarioNegocio negocio = new UsuarioNegocio();
            DatosPersonalesNegocio negocioDP = new DatosPersonalesNegocio();

            //negocio.modificar(aux);
            //negocioDP.modificar(aux);


        }

        protected void RescatarUsuario()
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            DatosPersonalesNegocio negocioDP = new DatosPersonalesNegocio();
            aux = new Usuario();

            aux.IdUsuario = negocio.buscarPorID(ID).IdUsuario;
            aux.IdRol = negocio.buscarPorID(ID).IdRol;
            aux.Email = negocio.buscarPorID(ID).Email;
            aux.Contraseña = negocio.buscarPorID(ID).Contraseña;

            aux.Nombre = negocioDP.recuperarDatosPersonalesLogin(ID).Nombre;
            aux.Apellido = negocioDP.recuperarDatosPersonalesLogin(ID).Apellido;
            aux.Telefono = negocioDP.recuperarDatosPersonalesLogin(ID).Telefono;
            aux.Direccion = negocioDP.recuperarDatosPersonalesLogin(ID).Direccion;
            aux.Dni = negocioDP.recuperarDatosPersonalesLogin(ID).Dni;


            txtEmail.Text = aux.Email.ToString();
            txtNuevaContrasena.Text = aux.Contraseña.ToString();
            txtConfirmarContrasena.Text = aux.Contraseña.ToString();
            txtNombre.Text = aux.Nombre.ToString();
            txtApellido.Text = aux.Apellido.ToString();
            txtDireccion.Text = aux.Direccion.ToString();
            txtTelefono.Text = aux.Telefono.ToString();
            txtFechaNacimiento.Text = aux.FechaNacimiento.ToString();


            
        }
    }
}