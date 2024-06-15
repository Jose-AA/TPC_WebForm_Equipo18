using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18.Formularios_de_Registro_de_Informacion
{
    public partial class RegistrarServicio : System.Web.UI.Page
    {

        List<Servicio> listaServicios = new List<Servicio>();

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

                EliminarDropDownList.DataSource = listaServicios;
                EliminarDropDownList.DataTextField = "Nombre";
                EliminarDropDownList.DataValueField = "Id";
                EliminarDropDownList.DataBind();
                EliminarDropDownList.Items.Insert(0, new ListItem("Seleccione un servicio", "0"));
            }
        }

        protected void btnCrearServicio_Click(object sender, EventArgs e)
        {

            //Validamos, y si algo da error terminamos la ejecucion del evento
            Page.Validate();
            if (!Page.IsValid)
                return;

            if (String.IsNullOrEmpty(inputNombre.Text) || String.IsNullOrEmpty(inputDescripcion.Text)
                || String.IsNullOrEmpty(inputDuracion.Text) || String.IsNullOrEmpty(inputPrecio.Text))
            {
                return;
            }

            if (inputDescripcion.Text.Trim().Length > 100 || inputNombre.Text.Trim().Length > 50)
            {
                return;
            }

           
            string nombre = inputNombre.Text.Trim();
            string descripcion = inputDescripcion.Text.Trim();
            int duracion = Convert.ToInt32(inputDuracion.Text.Trim());
            decimal precio = Convert.ToDecimal(inputPrecio.Text.Trim());

           
            Servicio nuevoServicio = new Servicio
            {
                Nombre = nombre,
                Descripcion = descripcion,
                Duracion = duracion,
                Precio = precio
            };

            try
            {
             
                ServicioNegocio negocio = new ServicioNegocio();
                negocio.Agregar(nuevoServicio);

              
                List<Servicio> aux = (List<Servicio>)Session["ListaServicios"];
                aux.Add(nuevoServicio);
                Session["ListaServicios"] = aux;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalServicioAgregado", "abrirModalServicioAgregado();", true);

                //Limpiamos las cajas de texto para la siguiente carga de datos:
                inputNombre.Text = "";
                inputDescripcion.Text = "";
                inputDuracion.Text = "";
                inputPrecio.Text = "";

                //Aunque tal vez mejor que limpiar, sería hacer un redirect al panel de administrador...
            }
            catch (Exception ex)
            {
                Response.Write("Error al agregar el servicio: " + ex.Message);
            }
        }


        protected void ModificarDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idServicio = int.Parse(ModificarDropDownList.SelectedValue);
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

                }
            }
        }

        protected void EliminarDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idServicio = int.Parse(EliminarDropDownList.SelectedValue);
            List<Servicio> listaServicios = new List<Servicio>();
            ServicioNegocio negocio = new ServicioNegocio();
            listaServicios = negocio.listar();
            if (idServicio != 0)
            {
                Servicio servicio = listaServicios.FirstOrDefault(s => s.Id == idServicio);
                if (servicio != null)
                {
                    inputNombreEliminar.Text = servicio.Nombre;
                    inputDescripcionEliminar.Text = servicio.Descripcion;
                    inputDuracionEliminar.Text = servicio.Duracion.ToString();

                    // Convertir el precio a string y reemplazar la coma por el punto
                    string precio = servicio.Precio.ToString().Replace(',', '.');

                    // Asignar el precio al TextBox
                    inputPrecioEliminar.Text = precio;
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

        protected void btnEliminarServicio_Click(object sender, EventArgs e)
        {
            int idServicio = int.Parse(EliminarDropDownList.SelectedValue);
            ServicioNegocio negocio = new ServicioNegocio();

            if (idServicio != 0)
            {
                try
                {
                    // Llamar al método eliminar del negocio pasando el idServicio
                    negocio.Eliminar(idServicio);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalServicioAgregado", "Eliminadoexitosamente()", true);
                    
                    



                }
                catch (Exception ex)
                {
                    // Manejar la excepción si ocurre algún error
                  
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalServicioAgregado", "seleccione()", true);
            }
        }

    }





}


