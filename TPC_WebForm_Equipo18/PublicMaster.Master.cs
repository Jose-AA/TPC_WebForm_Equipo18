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

            /*
            Servicio S1 = new Servicio();
            Servicio s2 = new Servicio();
            Servicio s3 = new Servicio();
            Servicio s4 = new Servicio();
            S1.Id = 1;
            s2.Id = 2;
            
            S1.Precio = 5000;
            s2.Precio = 10000;

            S1.Nombre = "Skin care";
            s2.Nombre = "Depilacion definitiva";
            s3.Nombre = "Uñitas garra";
            s4.Nombre = "Chanchitos coquetos";
            S1.Duracion = 45;
            s2.Duracion = 60;

            S1.Descripcion = "Si tu piel es grasa seguramente has optado por productos secantes. " +
                             "Tal vez piensas que por tener este tipo de piel es imposible tenerla " +
                             "deshidratada y que un jabón suave no es lo mejor para ti. Como podrás " +
                             "ver, estos son algunos de los mitos más comunes sobre piel grasa;  " +
                             "seguirlos podría agravar todavía más esta condición. Aunque cueste " +
                             "creerlo, una piel grasa puede ser un gran regalo si logras equilibrar " +
                             "la producción de sebo, porque ésta nos ayuda a combatir ciertas " +
                             "infecciones y también  a que las líneas de expresión aparezcan más " +
                             "tarde. Piensa tu rutina como una forma de equilibrar tu rostro y no " +
                             "simplemente como la eliminación de la grasa y comedones, ya que " +
                             "enfocarte en estos efectos te lleva a tomar decisiones que no solucionan " +
                             "el problema de fondo.";

            s2.Descripcion = "La depilación láser se utiliza para reducir el vello no deseado. Los " +
                             "lugares frecuentes donde se realiza el tratamiento son piernas, axilas, " +
                             "labio superior, mentón y línea del bikini. Sin embargo, es posible tratar" +
                             " el vello no deseado en casi cualquier zona, excepto los párpados o la " +
                             "zona de alrededor. La piel con tatuajes tampoco debe tratarse.";

            List<Imagen> l1 = new List<Imagen>();
            List<Imagen> l2 = new List<Imagen>();

            Imagen i1 = new Imagen();
            Imagen i2 = new Imagen();
            Imagen i3 = new Imagen();
            Imagen i4 = new Imagen();

            i1.Url = "FPF/SkinCare/skin1.jpg";
            i1.IDImagen = 1;

            l1.Add(i1);

            list.Add(S1);
            list.Add(s2);
            list.Add(s3);
            list.Add(s4);

            */

            usuarioLogueado = (Usuario)Session["usuario"];

            hlCerrarSesion.NavigateUrl = cerrarSesionUrl();


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

        private string cerrarSesionUrl()
        {
            //La funcion sera llamada cuando se presione el boton salir en el panel de cliente
            //Eliminamos la sesion activa, y redirigimos nuevamente a la pagina principal
            Session["usuario"] = null;

            return "Default.aspx";
        }
    }
}