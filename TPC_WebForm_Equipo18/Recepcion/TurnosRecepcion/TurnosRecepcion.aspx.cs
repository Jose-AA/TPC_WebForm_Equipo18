using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
------------------------------------------------------------------------
--- Query para traer lo que necesito en los turnos de los clientes   ---
--- Pero sin el nombre de los clientes, solo el de los especialistas ---
--- Solo los agregué para chequear que traiga la info correcta       ---
------------------------------------------------------------------------
select D.nombre, D.apellido, T.fecha_turno, T.hora_turno, U2.nombre, S.nombre from Turnos T
Inner join Usuarios U on U.usuario_id = T.cliente_id
Inner join Datos_Personales U2 on U2.usuario_id = T.especialista_id
Inner join Datos_Personales D on D.usuario_id = U.usuario_id
inner join ServiciosxEspecialistas SE on SE.especialista_id = U2.usuario_id
Inner join Servicios S on S.servicio_id = SE.servicio_id
---------------------------------------------------------------------- 
*/



namespace TPC_WebForm_Equipo18.Recepcion.TurnosRecepcion
{
    public partial class TurnosRecepcion : System.Web.UI.Page
    {
        public List<Turno> listaTurnos  = new List<Turno>();
        int ID = 0;
        Turno baja;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    
                        ID = int.Parse(Request.QueryString["id"]);
                        actualizarListaTurnos();
                    

                }
            }
        }
        protected void GridTurnos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        /*
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string postBackEventReference = Page.ClientScript.GetPostBackClientHyperlink(GridTurnos, "Select$" + e.Row.RowIndex, true);
                e.Row.Attributes["onclick"] = postBackEventReference;
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        */
        }
        protected void actualizarListaTurnos()
        {
            TurnoNegocio negocio = new TurnoNegocio();
            listaTurnos = negocio.listarTurnosPorCliente(ID);

            GridTurnos.DataSource = listaTurnos;
            GridTurnos.DataBind();

        }

        protected void btnDarBaja_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            
            int idTurno = Convert.ToInt32(btn.CommandArgument);

            
            DarDeBajaTurno(idTurno);

            
            actualizarListaTurnos();
        }

        protected void DarDeBajaTurno(int id)
        {
            Turno aux = new Turno();
            TurnoNegocio negocio = new TurnoNegocio();
            baja = new Turno();
            aux = negocio.obtenerPorID(id);

            baja.ID = aux.ID;
            baja.FechaDeTurno = aux.FechaDeTurno;
            baja.HoraDeTurno = aux.HoraDeTurno;
            baja.Especialista = aux.Especialista;
            baja.Estado = 2;
            baja.Cliente = aux.Cliente;
            baja.Servicio = aux.Servicio;

            negocio.ActualizarEstado(baja);

            
            
        }

        
    }
}