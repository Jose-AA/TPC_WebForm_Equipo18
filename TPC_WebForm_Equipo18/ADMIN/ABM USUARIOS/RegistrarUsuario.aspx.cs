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
          
            


            if (!IsPostBack)
            {
                ddlRoles.Items.Add("Administrador");
                ddlRoles.Items.Add("Especialista");
                ddlRoles.Items.Add("Recepcionista");
                ddlRoles.Items.Add("Cliente");

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

                    else if (aux.IdRol == 4)
                    {
                        ddlRoles.SelectedIndex = 3;
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
            DatosPersonalesNegocio negocioDP = new DatosPersonalesNegocio();

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
                else if(rol == "Recepcionista")
                {
                    aux.IdRol = 3;
                }

                else if (rol == "Cliente")
                {
                    aux.IdRol = 4;
                }


                aux.Email = inputCorreo.Text;
                aux.Contraseña = inputContraseña.Text;
                aux.Nombre = inputNombre.Text;
                aux.Apellido = inputApellido.Text;
                aux.Dni = -1;
                aux.FechaNacimiento = new DateTime(1900, 1, 1);
                aux.Telefono = "";
                aux.Direccion = ""; 




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
                   Usuario aux2=aux;
                    negocio.agregar(aux);

                    int idusario = negocio.recuperaridusuario(aux.Email);

                    aux2.IdUsuario = idusario;

                    negocioDP.agregar(aux2);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalseleccione", "abrirModal();", true);
                }
                else
                {
                    negocio.modificar(aux);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalseleccione", "abrirModal();", true);
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "delayRedireccion", "redirectAfterDelay();", true);
            }
            catch(Exception ex)
            {
                throw ex;
            }

        }

    }
}