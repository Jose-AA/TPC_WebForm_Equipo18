using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18.ABM_SERVICIO
{
    public partial class ModificarServicios : System.Web.UI.Page
    {

        List<Servicio> listaServicios = new List<Servicio>();
        public List<Imagen> listaImagenesxServicio = new List<Imagen>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ServicioNegocio negocio = new ServicioNegocio();
                listaServicios = negocio.listar();


                ModificarDropDownList.DataSource = listaServicios;
                ModificarDropDownList.DataTextField = "Nombre";
                ModificarDropDownList.DataValueField = "Id";
                ModificarDropDownList.DataBind();
                ModificarDropDownList.Items.Insert(0, new ListItem("Seleccione un servicio", "0"));
            }
           

        }

        protected void ModificarDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idServicio = 0;
            idServicio = int.Parse(ModificarDropDownList.SelectedValue);
            List<Servicio> listaServicios = new List<Servicio>();
            ServicioNegocio negocio = new ServicioNegocio();
            listaServicios = negocio.listar();

            if (idServicio != 0)
            {
                Servicio servicio = listaServicios.FirstOrDefault(s => s.Id == idServicio);
                if (servicio != null)
                {
                    inputNombreModificar.Text = servicio.Nombre;
                    inputDescripcionModificar.Text = servicio.Descripcion;
                    inputDuracionModificar.Text = servicio.Duracion.ToString();
                    // Convertir el precio a string y reemplazar la coma por el punto
                    string precio = servicio.Precio.ToString().Replace(',', '.');

                    // Asignar el precio al TextBox
                    inputPrecioModificar.Text = precio;

                    //Asignar las imagenes al Servicio
                    listaImagenesxServicio = negocio.listarImagenes(servicio.Id);

                }
            }

        }

        protected void btnModificarServicio_Click(object sender, EventArgs e)
        {

            int idServicio = int.Parse(ModificarDropDownList.SelectedValue);
            List<Servicio> listaServicios = new List<Servicio>();
            ServicioNegocio negocio = new ServicioNegocio();
            listaServicios = negocio.listar();

            if (idServicio != 0)
            {
                // Obtener el servicio de la lista por su ID
                Servicio servicio = listaServicios.FirstOrDefault(s => s.Id == idServicio);
                if (servicio != null)
                {
                    // Actualizar los campos del objeto Servicio con los valores de los TextBox
                    servicio.Nombre = inputNombreModificar.Text;
                    servicio.Descripcion = inputDescripcionModificar.Text;
                    servicio.Duracion = int.Parse(inputDuracionModificar.Text);
                    string precio = inputPrecioModificar.Text.Replace('.', ',');
                    servicio.Precio = decimal.Parse(precio); // Asegúrate de convertir a decimal si corresponde

                    try
                    {


                        negocio.Modificar(servicio);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "modalServicioAgregado", "modificadoexitosamente()", true);

                    }
                    catch (Exception ex)
                    {
                        ex.ToString(); // Manejar la excepción
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalServicioAgregado", "seleccione()", true);
            }


        }

        protected void btnAgregarImagen_Click(object sender, EventArgs e)
        {
            int idServicio = int.Parse(ModificarDropDownList.SelectedValue);

            if(idServicio != 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalAgregarImagen", "modalAgregarImagen();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalServicioAgregado", "seleccione()", true);
            }

        }

        protected void btnGuardarImagen_Click(object sender, EventArgs e)
        {
            ServicioNegocio negocio = new ServicioNegocio();

            Imagen nuevaImagen = new Imagen();
            nuevaImagen.Url = txtUrlImagen.Text;

            int servicioId = int.Parse(ModificarDropDownList.SelectedValue);

            negocio.agregarImagen(servicioId, nuevaImagen);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "modalServicioAgregado", "modificadoexitosamente()", true);



        }

        protected void btnMostrarImagenes_Click(object sender, EventArgs e)
        {
            int idServicio = int.Parse(ModificarDropDownList.SelectedValue);

            if (idServicio != 0)
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "modalMostrarImagenes", "modalMostrarImagenes();", true);
                Response.Redirect("ModificarImagenesPorServicio.aspx?id=" + idServicio);
            }
            else
            {
                Session.Add("listaImagenesxServicio", listaImagenesxServicio);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalServicioAgregado", "seleccione()", true);
            }
        }
    }


}