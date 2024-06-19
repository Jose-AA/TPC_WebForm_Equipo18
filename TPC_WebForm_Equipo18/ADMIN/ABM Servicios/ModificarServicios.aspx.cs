﻿using Dominio;
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
    }


}