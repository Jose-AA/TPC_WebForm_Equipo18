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
        Usuario aux = new Usuario();
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
                        RescatarUsuario();
                    }

                }
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            
            UsuarioNegocio negocio = new UsuarioNegocio();
            DatosPersonalesNegocio negocioDP = new DatosPersonalesNegocio();
            string nuevaContrasena = string.IsNullOrEmpty(txtNuevaContrasena.Text) ? null : txtNuevaContrasena.Text;
            string confirmarContrasena = string.IsNullOrEmpty(txtConfirmarContrasena.Text) ? null : txtConfirmarContrasena.Text;
            if (ID != 0)
            {

                aux.IdUsuario = ID;
                aux.IdRol = 4;
                aux.Email = txtEmail.Text;
            
                if(txtNuevaContrasena.Text == txtConfirmarContrasena.Text)
                {
                    aux.Contraseña = txtConfirmarContrasena.Text;
                }
                aux.Nombre = txtNombre.Text;
                aux.Apellido = txtApellido.Text;
                aux.Dni = Convert.ToInt64(txtDNI.Text);
                aux.Telefono = txtTelefono.Text;
                aux.Direccion = txtDireccion.Text;
                aux.FechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text);
                aux.Telefono = txtTelefono.Text.ToString();
                try
                {
                    negocio.modificar(aux);
                    negocioDP.modificar(aux);
                    Response.Redirect("../ListarClientesRecepcion.aspx");
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }


        }

        protected void RescatarUsuario()
        {
            

            UsuarioNegocio negocio = new UsuarioNegocio();
            DatosPersonalesNegocio negocioDP = new DatosPersonalesNegocio();
            
            aux.IdUsuario = negocio.buscarPorID(ID).IdUsuario;
            aux.IdRol = negocio.buscarPorID(ID).IdRol;
            aux.Email = negocio.buscarPorID(ID).Email;
            aux.Contraseña = negocio.buscarPorID(ID).Contraseña;

            aux.IdUsuario = ID;
            aux.Nombre = negocioDP.recuperarDatosPersonalesLogin(ID).Nombre;
            aux.Apellido = negocioDP.recuperarDatosPersonalesLogin(ID).Apellido;
            aux.Telefono = negocioDP.recuperarDatosPersonalesLogin(ID).Telefono;
            aux.Direccion = negocioDP.recuperarDatosPersonalesLogin(ID).Direccion;
            aux.Dni = negocioDP.recuperarDatosPersonalesLogin(ID).Dni;


            txtEmail.Text = aux.Email.ToString();
            txtDNI.Text = aux.Dni.ToString();
            txtNuevaContrasena.Text = aux.Contraseña.ToString();
            txtConfirmarContrasena.Text = aux.Contraseña.ToString();
            txtNombre.Text = aux.Nombre.ToString();
            txtApellido.Text = aux.Apellido.ToString();
            txtDireccion.Text = aux.Direccion.ToString();
            txtTelefono.Text = aux.Telefono.ToString();
            txtFechaNacimiento.Text = aux.FechaNacimiento.ToString("dd-MM-yyyy");

            string script = $"<script type=\"text/javascript\">setPasswordField('{aux.Contraseña}');</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "SetPasswordField", script);



        }
    }
}