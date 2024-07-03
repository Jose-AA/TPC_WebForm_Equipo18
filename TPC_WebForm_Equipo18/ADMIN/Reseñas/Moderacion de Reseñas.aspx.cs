using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_WebForm_Equipo18.ADMIN.Reseñas
{
    public partial class Moderacion_de_Reseñas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarReseñas();
            }
        }

        private void CargarReseñas()
        {
            ReseñaNegocio negocioReseña = new ReseñaNegocio();
            List<Resena> reseñas = negocioReseña.Listar();

            int maxReseñasPorPestaña = 6; // 3 filas de 3 tarjetas por pestaña
            var reseñasGrupos = DividirLista(reseñas, maxReseñasPorPestaña);

            rptTabs.DataSource = reseñasGrupos;
            rptTabs.DataBind();

            rptTabContent.DataSource = reseñasGrupos;
            rptTabContent.DataBind();
        }

        private List<List<List<Resena>>> DividirLista(List<Resena> lista, int tamaño)
        {
            var listaExterna = new List<List<List<Resena>>>();
            for (int i = 0; i < lista.Count; i += tamaño)
            {
                var listaInterna = lista.GetRange(i, Math.Min(tamaño, lista.Count - i));
                listaExterna.Add(DividirListaInterna(listaInterna, 3));
            }
            return listaExterna;
        }

        private List<List<Resena>> DividirListaInterna(List<Resena> lista, int tamaño)
        {
            var listaReseñas = new List<List<Resena>>();
            for (int i = 0; i < lista.Count; i += tamaño)
            {
                listaReseñas.Add(lista.GetRange(i, Math.Min(tamaño, lista.Count - i)));
            }
            return listaReseñas;
        }

        protected string GenerarEstrellasSVG(int calificación)
        {
            StringBuilder estrellasHtml = new StringBuilder();

            for (int i = 0; i < 5; i++)
            {
                if (i < calificación)
                {
                    estrellasHtml.Append(@"<svg xmlns=""http://www.w3.org/2000/svg"" width=""16"" height=""16"" fill=""currentColor"" class=""bi bi-star-fill"" viewBox=""0 0 16 16"" style=""color:#FFC433;"">
              <path d=""M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"" />
            </svg>");
                }
                else
                {
                    estrellasHtml.Append(@"<svg xmlns=""http://www.w3.org/2000/svg"" width=""16"" height=""16"" fill=""currentColor"" class=""bi bi-star-fill"" viewBox=""0 0 16 16"" style=""color:#ccc;"">
              <path d=""M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"" />
            </svg>");
                }
            }

            return estrellasHtml.ToString();
        }

        protected void chkActivo_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            RepeaterItem item = (RepeaterItem)chk.NamingContainer;
            int resenaId = int.Parse(((HiddenField)item.FindControl("hfResenaId")).Value);

            ReseñaNegocio negocioResena = new ReseñaNegocio();

            bool estado;

            if(chk.Checked)
            {
                 estado = true;
            }
            else
            {
                 estado = false;
            }

            negocioResena.ActualizarEstado(resenaId, estado);

            // Recargar las reseñas para reflejar el cambio

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "showSuccessModal()", true);
        }
    }

}