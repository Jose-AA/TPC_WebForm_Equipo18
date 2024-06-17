using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_WebForm_Equipo18.Formularios_de_Registro_de_Informacion
{
    public partial class ListarUsuarios : System.Web.UI.Page
    {

        public List<Usuario> listaUsuario = new List<Usuario>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    UsuarioNegocio negocio = new UsuarioNegocio();

                    listaUsuario = negocio.listar();

                    gridUsuarios.DataSource = listaUsuario;
                    gridUsuarios.DataBind();

                }
                catch(Exception ex)
                {
                    ex.ToString();
                }
            }

        }

        protected void btnNuevoUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrarUsuario.aspx");
        }

        protected void gridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {

            string idSeleccion = gridUsuarios.SelectedDataKey.Value.ToString();
            Response.Redirect("RegistrarUsuario.aspx?id=" + idSeleccion);

        }
    }
}