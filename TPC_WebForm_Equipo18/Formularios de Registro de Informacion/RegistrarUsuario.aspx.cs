﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18
{
    public partial class RegistrarUsuario : System.Web.UI.Page
    {

        bool modoEdicion = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);

                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario aux = negocio.buscarPorID(id);

                inputCorreo.Text = aux.Email;
                inputContraseña.Text = aux.Contraseña;
                inputIDRol.Text = aux.IdRol.ToString();


                btnCrearUsuario.Text = "Modificar Usuario";
                modoEdicion = true;

            }
        }

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            Usuario aux = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            aux.IdRol = int.Parse(inputIDRol.Text);
            aux.Email = inputCorreo.Text;
            aux.Contraseña = inputContraseña.Text;


            if (modoEdicion == false)
            {

                try
                {
                    negocio.agregar(aux);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalseleccione", "abrirModal();", true);
                }
                catch (Exception ex)
                {
                    ex.ToString();
                }

            }
            else
            {
                try
                {
                    negocio.modificar(aux);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalseleccione", "abrirModal();", true);
                }
                catch(Exception ex)
                {
                    ex.ToString();
                }
            }

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarUsuarios.aspx");
        }
    }
}