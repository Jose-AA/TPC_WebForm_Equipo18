using Dominio;
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
        public Usuario Acargar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Acargar = new Usuario();

            if(!IsPostBack)
            {

            }


        }
    }
}