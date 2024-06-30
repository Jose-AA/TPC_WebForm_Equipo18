using Dominio;
using Negocio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18.ADMIN.ABM_Servicios
{
    public partial class AsociacionSevicioEspecialista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                CargarEspecialistas();

            }
           

        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            CargarEspecialistas();

        }

        protected void ddlServicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlServicios = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlServicios.NamingContainer;
            Label lblEspecialistaId = (Label)row.FindControl("lblEspecialistaId");

            if (lblEspecialistaId != null && int.TryParse(lblEspecialistaId.Text, out int especialistaId))
            {
                int servicioId = int.Parse(ddlServicios.SelectedValue);
                
                if(servicioId > 0) {
                    
                EspecialistaNegocio especialistaNegocio = new EspecialistaNegocio();
                especialistaNegocio.ActualizarServicioAsociado(especialistaId, servicioId);

                CargarEspecialistas();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "showSuccessModal()", true);
                }
            }



        }
        private void CargarEspecialistas()
        {
            EspecialistaNegocio negocio = new EspecialistaNegocio();
            List<Especialista> especialistas = negocio.ListarEspecialistasysusservicosAsociados();

            string busqueda = txtBuscar.Text.ToLower();
            string filtro = ddlFiltro.SelectedValue;

            switch (filtro)
            {
                case "NombreEspecialista":
                    if (!string.IsNullOrEmpty(busqueda))
                    {
                        especialistas = especialistas.FindAll(x => (x.Nombre.ToLower().Contains(busqueda) || x.Apellido.ToLower().Contains(busqueda)));
                    }
                    break;

                case "NombreServicio":
                    if (!string.IsNullOrEmpty(busqueda))
                    {
                        especialistas = especialistas.FindAll(x => x.ServicioAsociado != null && x.ServicioAsociado.Nombre.ToLower().Contains(busqueda));
                    }
                    break;

                default:
                    break;
            }
            if (especialistas == null || especialistas.Count < 1)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "showSuccessModalnodatos()", true);


            }

            gridEspecialistas.DataSource = especialistas;
            gridEspecialistas.DataBind();

            foreach (GridViewRow row in gridEspecialistas.Rows)
            {
                DropDownList ddlServicios = (DropDownList)row.FindControl("ddlServicios");
                if (ddlServicios != null)
                {
                    ServicioNegocio servicioNegocio = new ServicioNegocio();
                    List<Servicio> servicios = servicioNegocio.listar();

                    ddlServicios.DataSource = servicios;
                    ddlServicios.DataTextField = "Nombre";
                    ddlServicios.DataValueField = "Id";
                    ddlServicios.DataBind();

               
                    ddlServicios.Items.Insert(0, new ListItem("Sin Servicio Asociado", "-1"));

                   
                    Label lblEspecialistaId = (Label)row.FindControl("lblEspecialistaId");
                    if (lblEspecialistaId != null)
                    {
                        int especialistaId = int.Parse(lblEspecialistaId.Text);
                        Especialista especialista = especialistas.Find(e => e.IdUsuario == especialistaId);
                        if (especialista != null && especialista.ServicioAsociado != null)
                        {
                            ddlServicios.SelectedValue = especialista.ServicioAsociado.Id.ToString();
                        }
                        else
                        {
                            ddlServicios.SelectedValue = "-1";
                        }
                    }
                }
            }
        }
    }

}