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
    public partial class ListarClientesRecepcion : System.Web.UI.Page
    {
        public List<Usuario> listaUsuario = new List<Usuario>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    refrescarLista();
                }
                catch (Exception ex)
                {
                    ex.ToString();
                }
            }

            refrescarLista();
        }

        ///ACAAAAAAAA
        private void refrescarLista()
        {
            DatosPersonalesNegocio negocio = new DatosPersonalesNegocio();

            listaUsuario = negocio.listar();

            gridUsuarios.DataSource = listaUsuario;
            gridUsuarios.DataBind();
        }

     

        protected void btnAgregarCliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("Alta de Clientes/AltaClientes.aspx");
        }

        protected void btnModificarCliente_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnEliminarCliente_Click(object sender, EventArgs e)
        {

        }
        
        protected void gridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gridUsuarios.Rows)
            {
                if (row.RowIndex == gridUsuarios.SelectedIndex)
                {
                    row.CssClass = "selected-row"; 
                }
                else
                {
                    row.CssClass = "selected-row";
                    //row.CssClass = string.Empty;
                }
            }
        }

        protected void gridUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string postBackEventReference = Page.ClientScript.GetPostBackClientHyperlink(gridUsuarios, "Select$" + e.Row.RowIndex, true);
                e.Row.Attributes["onclick"] = postBackEventReference;
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void gridUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int userId = Convert.ToInt32(gridUsuarios.DataKeys[rowIndex].Values[0]);

                UsuarioNegocio negocio = new UsuarioNegocio();
                
            }
        }

        protected void btnVerTurnos_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerHistorial_Click(object sender, EventArgs e)
        {

        }

        protected void btnBlanqueo_Click(object sender, EventArgs e)
        {

        }
    }
}