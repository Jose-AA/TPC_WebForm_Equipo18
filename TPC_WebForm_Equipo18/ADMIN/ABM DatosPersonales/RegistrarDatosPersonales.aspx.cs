using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_WebForm_Equipo18
{
    public partial class DatosPersonales : System.Web.UI.Page
    {
        List<Usuario> list = new List<Usuario>();
        DatosPersonalesNegocio negocio = new DatosPersonalesNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                list = negocio.listardelatabadeUsuarios();


                UsuarioaCargar.DataTextField = "Email";
                UsuarioaCargar.DataValueField = "IdUsuario";


                UsuarioaCargar.DataSource = list;
                UsuarioaCargar.DataBind();


                UsuarioaCargar.Items.Insert(0, new ListItem("Seleccione el correo electrónico del usuario", "0"));
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            int idUsuario = 0;
            idUsuario = Convert.ToInt32(UsuarioaCargar.SelectedValue);


            if (idUsuario != 0)
            {


                List<Usuario> usuarios = new List<Usuario>();
                usuarios = negocio.listar();
                Usuario usuario = new Usuario();
                usuario = usuarios.Find(u => u.IdUsuario == idUsuario);

                List<Usuario> listadelaTablausuarios = new List<Usuario>();
                listadelaTablausuarios = negocio.listardelatabadeUsuarios();

                if (usuario == null)
                {
                    Usuario nuevoUsuario = new Usuario();
                    nuevoUsuario.Nombre = inputNombre.Text;
                    nuevoUsuario.Apellido = inputApellido.Text;
                    nuevoUsuario.Dni = long.Parse(inputDNI.Text);
                    nuevoUsuario.Telefono = inputTelefono.Text;
                    nuevoUsuario.Direccion = inputDireccion.Text;
                    nuevoUsuario.FechaNacimiento = Convert.ToDateTime(inputFechaNacimiento.Text);
                    nuevoUsuario.Email = listadelaTablausuarios.Find(u => u.IdUsuario == idUsuario).Email;
                    nuevoUsuario.IdUsuario = listadelaTablausuarios.Find(u => u.IdUsuario == idUsuario).IdUsuario;

                    try
                    {
                        negocio.agregar(nuevoUsuario);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "modalseleccione", "DatosPersonalescargadosExitosamente()", true);

                    }
                    catch (Exception ex)
                    {
                        ex.ToString();

                    }
                }
                
                else if (usuario.Nombre != null)
                {


                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalseleccione", "Datosyacargados()", true);

                }

            }

            else
            {


                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalseleccione", "seleccione()", true);



            }


        }
    }
}
