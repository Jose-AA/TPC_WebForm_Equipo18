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
    public partial class DatosPersonalesClientes : System.Web.UI.Page
    {
        DatosPersonalesNegocio Negocio = new DatosPersonalesNegocio();
        int ID = 0;
        public Usuario Acargar { get; set; }

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
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idseleccionado = 0;
            if (Session["id_usuario"] != null)
            {
                idseleccionado = Convert.ToInt32(Session["id_usuario"]);
            }

            if (idseleccionado != 0)
            {
                Usuario usuario = new Usuario
                {
                    IdUsuario = idseleccionado,
                    Nombre = inputNombre.Text,
                    Apellido = inputApellido.Text,
                    Dni = Convert.ToInt64(inputDNI.Text),
                    Telefono = inputTelefono.Text,
                    Direccion = inputDireccion.Text,
                    FechaNacimiento = Convert.ToDateTime(inputFechaNacimiento.Text)
                };

                try
                {
                    Negocio.agregar(usuario);
                    Response.Redirect("../ListarClientesRecepcion.aspx");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalModificado", "modificadoexitosamente()", true);
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex);
                }
            }
            
        }
    }
}
