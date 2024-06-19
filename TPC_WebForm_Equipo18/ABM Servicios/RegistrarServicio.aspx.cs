﻿using Dominio;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            


        }

        protected void btnCrearServicio_Click(object sender, EventArgs e)
        {

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


    }





}


