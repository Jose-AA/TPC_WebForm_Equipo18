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
            Acargar = new Usuario();

            if(!IsPostBack)
            {
                ID = Convert.ToInt32(Session["id_usuario"]);

            }


        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if(ID != 0)
            {
                Acargar = new Usuario();
                Acargar.IdUsuario = ID;
                Acargar.Nombre = inputNombre.Text;
                Acargar.Apellido = inputApellido.Text;
                Acargar.Dni = Convert.ToInt64(inputDNI.Text);
                Acargar.Telefono = inputTelefono.Text;
                Acargar.Direccion = inputDireccion.Text;
                Acargar.FechaNacimiento = Convert.ToDateTime(inputFechaNacimiento.Text);

            }
                try
                {
                    Negocio.agregar(Acargar);
                    
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex);
                    
                }
        }
    }
}