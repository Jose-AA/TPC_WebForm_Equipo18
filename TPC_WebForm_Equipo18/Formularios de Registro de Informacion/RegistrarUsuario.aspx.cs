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
    public partial class RegistrarUsuario : System.Web.UI.Page
    {

        bool modoEdicion = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            ddlRoles.Items.Add("Administrador");
            ddlRoles.Items.Add("Especialista");
            ddlRoles.Items.Add("Cliente");

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);

                    UsuarioNegocio negocio = new UsuarioNegocio();
                    Usuario aux = negocio.buscarPorID(id);

                    inputCorreo.Text = aux.Email;
                    inputContraseña.Text = aux.Contraseña;
                    

                    if(aux.IdRol == 1)
                    {
                        ddlRoles.SelectedIndex = 0;
                    }
                    else if(aux.IdRol == 2)
                    {
                        ddlRoles.SelectedIndex = 1;
                    }
                    else if(aux.IdRol == 3)
                    {
                        ddlRoles.SelectedIndex = 2;
                    }


                    btnCrearUsuario.Text = "Modificar Usuario";
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
                

                string rol = ddlRoles.SelectedValue;

                if(rol == "Administrador")
                {
                    aux.IdRol = 1;
                }
                else if(rol == "Especialista")
                {
                    aux.IdRol = 2;
                }
                else if(rol == "Cliente")
                {
                    aux.IdRol = 3;
                }


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
                if (modoEdicion == false)
                {
                    negocio.agregar(aux);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalseleccione", "abrirModal();", true);
                }
                else
                {
                    negocio.modificar(aux);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalseleccione", "abrirModal();", true);
                }
            }
            catch(Exception ex)
            {
                ex.ToString();
            }

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarUsuarios.aspx");
        }
    }
}