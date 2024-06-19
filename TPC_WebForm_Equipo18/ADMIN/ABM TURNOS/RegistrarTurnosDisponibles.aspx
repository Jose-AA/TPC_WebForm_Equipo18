﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="RegistrarTurnosDisponibles.aspx.cs" Inherits="TPC_WebForm_Equipo18.Herramientas_Para_El_Especialista.RegistrarTurnosDisponibles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
     <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
   <div id="TurnosDadoDeAlta" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Turnos Dados de Alta Exitosamente</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="mensajeTurnosDadoDeAlta"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal de Turnos Existente -->
<div id="TurnosExistente" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Los Siguientes turnos ya existen o estan dados de alta: </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="mensajeTurnosExistente"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal para turnos con horario incoherente -->
<div class="modal fade" id="abrirModalTurnosIncoherentes" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalFechaHoraIncoherenteLabel">A intentado dar de alta turnos con un Horario/Fecha Incoherentes</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p id="mensajeFechaHoraIncoherente"></p>
      </div>
    </div>
  </div>
</div>

   <main style="margin-top: 50px; margin-left: 350px; margin-right: 350px;">
    <h1 style="margin-top: 20px; margin-left: 20px; margin-right: 20px;">Registrar Turnos Disponibles</h1>

<div style="margin-top: 50px;" >

    <h5>Seleccione la fecha para la que desea registrar turnos disponibles :</h5></div>

      <asp:ScriptManager ID="ScriptManager1" runat="server" />

       <div style="margin-top: 30px;" >
       <asp:DropDownList ID="Especialistaslist" runat="server" ></asp:DropDownList>
       </div>

      <asp:UpdatePanel ID="ActualizarFecha" runat="server"> 
      <ContentTemplate>  

    <div style="margin-top: 25px;">
    <input type="date" id="fechaInput" onchange="mostrarFechaSeleccionada()">

    <asp:TextBox ID="FechaSeleccionada" runat="server" style="display:none;" ></asp:TextBox>
    <asp:Button ID="button3" runat="server" Text="Actualizar Fecha Grilla" OnClick="button3_Click"  />
    </div>
       </contenttemplate>
       </asp:UpdatePanel>
     
       <hr />
  

        <asp:UpdatePanel ID="updatePanelGrid" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="button3" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <asp:GridView ID="gridTurnos" runat="server" CssClass="table" AutoGenerateColumns="false" style= "margin-top: 50px">
                    <Columns>
                        <asp:TemplateField HeaderText="Fecha">
                            <ItemTemplate>
                                <asp:Label ID="lblFecha" CssClass="fecha" runat="server" Text='<%# Bind("Fecha", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HoraDesde" HeaderText="Desde" />
                        <asp:BoundField DataField="HoraHasta" HeaderText="Hasta" />
                        <asp:TemplateField HeaderText="Habilitar">
                            <ItemTemplate>
                                <div class="form-check form-switch">
                                    <asp:CheckBox ID="chkHabilitar" runat="server" AutoPostBack="true" OnCheckedChanged="chkHabilitar_CheckedChanged" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>


        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <table style="width: 90%; margin-top: 30px;">
                    <tr>
                        <td style="text-align: center;">
                            <button type="button" class="btn btn-success" onclick="clickGuardar()">Registrar</button>
                        </td>
                        <td></td>
                        <td style="text-align: center;">
                            <button type="button" class="btn btn-danger" onclick="clickCancelar()">Cancelar</button>
                        </td>
                    </tr>
                </table>

                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" style="display:none;" />   
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" style="display:none;" /> 
            </ContentTemplate>
        </asp:UpdatePanel>

<script src="https://cdn.ulpgc.es/ulpgcds/1.0/js/jquery.ui/datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-beta3/js/bootstrap.min.js"></script>
    
    
</main>

  <script type="text/javascript">

      function mostrarFechaSeleccionada() {
          var fechaSeleccionada = document.getElementById("fechaInput").value;
          document.getElementById('<%= FechaSeleccionada.ClientID %>').value = fechaSeleccionada;
     }

      function clickGuardar() {
          document.getElementById('<%= btnGuardar.ClientID %>').click();
            console.log("PRESIONASTE EL CLICK DE GUARDAR");
        }

        function clickCancelar() {
            document.getElementById('<%= btnCancelar.ClientID %>').click();
          console.log("PRESIONASTE EL CLICK DE CANCELAR");
        }
        document.addEventListener("DOMContentLoaded", function () {
          document.querySelector(".btn-success").addEventListener("click", clickGuardar);
          document.querySelector(".btn-danger").addEventListener("click", clickCancelar);
      });
      function setearFechaAyer() {
          // Obtener la fecha de ayer
          var fechaAyer = new Date();
          fechaAyer.setDate(fechaAyer.getDate() - 1);

          // Formatear la fecha de ayer en el formato YYYY-MM-DD requerido por el input type="date"
          var fechaFormateada = fechaAyer.toISOString().split('T')[0];

          // Establecer la fecha de ayer en el input del calendario
          document.getElementById("fechaInput").value = fechaFormateada;
      }

      document.addEventListener("DOMContentLoaded", function () {
          // Llamar a la función para establecer la fecha de ayer cuando se carga la página
          setearFechaAyer();
      });

      function abrirModalTurnosDadoDeAlta(mensaje) {
          document.getElementById('mensajeTurnosDadoDeAlta').innerHTML = mensaje;
          var myModal = new bootstrap.Modal(document.getElementById('TurnosDadoDeAlta'), {
              keyboard: true
          });
          myModal.show();
      }

      function abrirModalTurnosExistente(mensaje) {
          document.getElementById('mensajeTurnosExistente').innerHTML = mensaje;
          var myModal = new bootstrap.Modal(document.getElementById('TurnosExistente'), {
              keyboard: true
          });
          myModal.show();
      }

      function abrirModalTurnosIncoherentes(mensaje) {
          document.getElementById('mensajeFechaHoraIncoherente').innerHTML = mensaje;
          var myModal = new bootstrap.Modal(document.getElementById('abrirModalTurnosIncoherentes'), {
              keyboard: true
          });
          myModal.show();
      }
      

    </script>



</asp:Content>

