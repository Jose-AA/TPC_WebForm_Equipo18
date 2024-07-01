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
        int IDSeleccionado = 0;
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
            if (gridUsuarios.SelectedDataKey != null)
            {
                string idSeleccion = gridUsuarios.SelectedDataKey.Value.ToString();

                //Response.Redirect(".aspx?id=" + idSeleccion);
            }
        }

        protected void btnEliminarCliente_Click(object sender, EventArgs e)
        {
            //Por el momento no habrá baja lógica ni física de cliente. Dejo el botón por las dudas
            //de que lo implementemos. De última, antes de la entrega se saca.
        }
        
        protected void gridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
            foreach (GridViewRow row in gridUsuarios.Rows)
            {
                if (row.RowIndex == gridUsuarios.SelectedIndex)
                {
                    row.CssClass = "selected-row"; 
                }
                else
                {
                    
                    row.CssClass = string.Empty;
                }
            }*/
            IDSeleccionado = Convert.ToInt32(gridUsuarios.SelectedDataKey.Value);
            Session["IDSeleccionado"] = IDSeleccionado;

            foreach (GridViewRow row in gridUsuarios.Rows)
            {
                if (row.RowIndex == gridUsuarios.SelectedIndex)
                {
                    row.CssClass = "selected-row";
                }
                else
                {
                    row.CssClass = string.Empty;
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
                IDSeleccionado = Convert.ToInt32(gridUsuarios.DataKeys[rowIndex].Values[0]);

                UsuarioNegocio negocio = new UsuarioNegocio();
                
            }
        }

        protected void btnVerTurnos_Click(object sender, EventArgs e)
        {
            if (gridUsuarios.SelectedDataKey != null)
            {
                string idSeleccion = gridUsuarios.SelectedDataKey.Value.ToString();

                Response.Redirect("TurnosRecepcion/TurnosRecepcion.aspx?id=" + idSeleccion);
            }
        }

        protected void btnVerHistorial_Click(object sender, EventArgs e)
        {
            if (gridUsuarios.SelectedDataKey != null)
            {
                string idSeleccion = gridUsuarios.SelectedDataKey.Value.ToString();
                
                Response.Redirect("HistorialesClinicos/HistorialClinicoRecepcion.aspx?id=" + idSeleccion);
            }
        }

        protected void btnBlanqueo_Click(object sender, EventArgs e)
        {
            IDSeleccionado = (int)Session["IDSeleccionado"];
            Usuario u = new Usuario();
            Usuario aux = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            u = negocio.buscarPorID(IDSeleccionado);
            aux.IdUsuario = u.IdUsuario;
            aux.IdRol = u.IdRol;
            aux.Email = u.Email;
            aux.Contraseña = "1234";
            negocio.modificar(aux);
        }
    }
}