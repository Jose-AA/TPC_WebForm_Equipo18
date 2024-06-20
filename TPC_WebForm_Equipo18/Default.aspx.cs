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
    public partial class _Default : Page
    {
        public string invalidUrl = "https://static.vecteezy.com/system/resources/previews/004/639/366/non_2x/error-404-not-found-text-design-vector.jpg";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Servicio> Servicios = new List<Servicio>();
                try
                {
                    ServicioNegocio negocio = new ServicioNegocio();
                    Servicios = negocio.listar();
                    Servicios = Servicios.GroupBy(s => s.Id).Select(g => g.First()).ToList();
                }
                catch (Exception ex)
                {
                    Session["Error"] = ex.Message;
                    Response.Redirect("Error.aspx");
                }

                repRepetidor.DataSource = Servicios;
                repRepetidor.DataBind();
            }


        }

        private Servicio buscarPorId(string idServicio)
        {

            List<Servicio> list = new List<Servicio>();
            ServicioNegocio negocio = new ServicioNegocio();
            list = negocio.listar();
            Servicio aux = new Servicio();
            

            aux = list.Find(x => x.Id == int.Parse(idServicio));

            return aux;
        }

        protected void btnDetalles_Click(object sender, EventArgs e)
        {
        
            string idServicio = ((Button)sender).CommandArgument;

            Servicio seleccionado = buscarPorId(idServicio);

            //Guardamos en session la seleccion del servicio
            Session.Add("ServicioSeleccionado", seleccionado);

            //Llevamos al usuario a la pagina donde se mostraran los datos
            Response.Redirect("DetalleServicio.aspx");



        }
    }
}