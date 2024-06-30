using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18.Recepcion
{
    public partial class RegistroUsuariosDesdeRecepcion : System.Web.UI.Page
    {
        bool modoEdicion = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    
                    modoEdicion = true;
                }
            }
        }

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            Usuario aux = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            if (IsPostBack)
            {
                aux.IdRol = 4;
                aux.Email = inputCorreo.Text;
                aux.Contraseña = inputContraseña.Text;

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    aux.IdUsuario = id;
                    modoEdicion = true;
                }
            }

            try
            {
                if (!modoEdicion)
                {
                    negocio.agregar(aux);

                    int newId = negocio.buscarIDPorEmail(aux.Email);
                    string url = "DatosPersonalesClientes.aspx?id=" + newId;
                    Response.Redirect(url);
                }
                else
                {
                    negocio.modificar(aux);
                    Response.Redirect("DatosPersonalesClientes.aspx?id=" + aux.IdUsuario);
                }
            }
            catch (Exception ex)
            {
                
                Response.Write(ex.ToString());
            }
        }
    }
}
