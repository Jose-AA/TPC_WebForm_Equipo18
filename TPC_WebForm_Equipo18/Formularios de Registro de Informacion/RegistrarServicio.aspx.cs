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
            // Obtener los datos ingresados por el usuario
            string nombre = inputNombre.Text;
            string descripcion = inputDescripcion.Text;
            int duracion = Convert.ToInt32(inputDuracion.Text);
            float precio = Convert.ToSingle(inputPrecio.Text);

            // Crear un objeto Servicio con los datos ingresados
            Servicio nuevoServicio = new Servicio
            {
                Nombre = nombre,
                Descripcion = descripcion,
                Duracion = duracion,
                Precio = precio
            };

            try
            {
                // Instanciar la clase ServicioNegocio y llamar al método Agregar
                ServicioNegocio negocio = new ServicioNegocio();
                negocio.Agregar(nuevoServicio);

                // Llamar a la función para abrir la modal de éxito
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalServicioAgregado", "abrirModalServicioAgregado();", true);
            }
            catch (Exception ex)
            {
                // Manejar cualquier excepción aquí
                // Por ejemplo, podrías mostrar un mensaje de error en caso de que ocurra un problema al agregar el servicio
                Response.Write("Error al agregar el servicio: " + ex.Message);
            }
        }

    }



}