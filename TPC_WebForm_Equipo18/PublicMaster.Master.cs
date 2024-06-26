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
    public partial class PublicMaster : System.Web.UI.MasterPage
    {
        public List<Servicio> list = new List<Servicio>();

        public Usuario usuarioLogueado = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {

            usuarioLogueado = (Usuario)Session["usuario"];
            ServicioNegocio negocio = new ServicioNegocio();


            try
            {
                if (!IsPostBack)
                {
                    list = negocio.listar();
                    Session.Add("ListaServicios", list);
                }
                else
                {
                    list = (List<Servicio>)Session["ListaServicios"];
                }

                ServicioRepeater.DataSource = list;
                ServicioRepeater.DataBind();
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }



        }

        private Servicio buscarPorId(string idServicio)
        {
            Servicio aux = new Servicio();

            aux = list.Find(x => x.Id == int.Parse(idServicio));

            return aux;
        }

        protected void btnServicio_Click(object sender, EventArgs e)
        {
            LinkButton clickedButton = (LinkButton)sender;
            string idServicio = clickedButton.CommandArgument;

            Servicio seleccionado = buscarPorId(idServicio);

            //Guardamos en session la seleccion del servicio
            Session.Add("ServicioSeleccionado", seleccionado);

            //Llevamos al usuario a la pagina donde se mostraran los datos
            Response.Redirect("DetalleServicio.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("IniciarSesion.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            //La funcion sera llamada cuando se presione el boton salir en el panel de cliente
            //Eliminamos la sesion activa, y redirigimos nuevamente a la pagina principal
            Session["usuario"] = null;

            Response.Redirect("Default.aspx");
        }

        protected void btnPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("MiPerfil.aspx");
        }
    }
}