using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18.ABM_Datos_Personales
{
    public partial class Modificar_Datos_Pesonales : System.Web.UI.Page
    {
        List<Usuario> listusuarios = new List<Usuario>();
        DatosPersonalesNegocio negocio = new DatosPersonalesNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listusuarios = negocio.listar();

                var usuarioDisplayList = listusuarios.Select(u => new
                {
                    DisplayText = $"{u.Nombre} {u.Apellido} {u.Dni}",
                    u.IdUsuario
                }).ToList();

                UsuarioModificar.DataSource = usuarioDisplayList;
                UsuarioModificar.DataTextField = "DisplayText";
                UsuarioModificar.DataValueField = "IdUsuario";
                UsuarioModificar.DataBind();
                UsuarioModificar.Items.Insert(0, new ListItem("Seleccione un usuario", "0"));
            }
        }


        protected void UsuarioModificar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idUsuario = 0;
            idUsuario = Convert.ToInt32(UsuarioModificar.SelectedValue);
            List<Usuario> usuarios = new List<Usuario>();
            usuarios = negocio.listar();
            Usuario usuario = new Usuario();
            usuario = usuarios.Find(u => u.IdUsuario == idUsuario);

            if (usuario != null)
            {
                inputNombre.Text = usuario.Nombre;
                inputApellido.Text = usuario.Apellido;
                inputDNI.Text = usuario.Dni.ToString();
                inputTelefono.Text = usuario.Telefono.ToString();
                inputDireccion.Text = usuario.Direccion;
                inputFechaNacimiento.Text = usuario.FechaNacimiento.ToString("yyyy-MM-dd");

            }



        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
                int idseleccionado = 0;
                idseleccionado = Convert.ToInt32(UsuarioModificar.SelectedValue);

            if (idseleccionado != 0)
            {

                Usuario usuario = new Usuario();
                usuario.IdUsuario = Convert.ToInt32(UsuarioModificar.SelectedValue);
                usuario.Nombre = inputNombre.Text;
                usuario.Apellido = inputApellido.Text;
                usuario.Dni = Convert.ToInt64(inputDNI.Text);
                usuario.Telefono = inputTelefono.Text;
                usuario.Direccion = inputDireccion.Text;
                usuario.FechaNacimiento = Convert.ToDateTime(inputFechaNacimiento.Text);


                try
                {
                    negocio.modificar(usuario);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalModificado", "modificadoexitosamente()", true);

                }
                catch (Exception ex)
                {
                    Session.Add("error", ex);
                }

            }
            else {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalNoseleccionado", "seleccione()", true);


            }
        }
    }
}
