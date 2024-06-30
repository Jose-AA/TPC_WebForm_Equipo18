﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Modificar Turnos.aspx.cs" Inherits="TPC_WebForm_Equipo18.ADMIN.ABM_TURNOS.Modificar_Turnos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 style="margin-top: 100px; margin-left: 200px;">Modificar el estado de los turnos</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    <div class="modal fade" id="successModal" tabindex="-1" role="alert" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="alert">
            <div class="modal-content" style="background-color: #d1e7dd; border: none;">
                <div class="modal-body" style="padding: 0; padding-bottom: 0; border: none;">
                    <div class="alert alert-success d-flex align-items-center" role="alert" style="margin-bottom: 0">
                        <svg class="bi flex-shrink-0 me-2  " width="50" height="50" fill="currentColor" viewBox=" 0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.354 11.354l-3.5-3.5a.5.5 0 0 1 .707-.707L6.5 10.293l6-6a.5.5 0 0 1 .707.707l-6.5 6.5a.5.5 0 0 1-.707 0z" />
                        </svg>
                        <div>
                            Estado Actualizado
                   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="successModalnodatos" tabindex="-1" role="alert" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="alert">
            <div class="modal-content" style="background-color: #d1e7dd; border: none;">
                <div class="modal-body" style="padding: 0; padding-bottom: 0; border: none;">
                </div>
                <div class="alert alert-danger d-flex align-items-center" role="alert" style="margin-bottom: 0" >
                    <svg class="bi flex-shrink-0 me-2"  width="50" height="50" fill="currentColor" viewBox=" 0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.354 11.354l-3.5-3.5a.5.5 0 0 1 .707-.707L6.5 10.293l6-6a.5.5 0 0 1 .707.707l-6.5 6.5a.5.5 0 0 1-.707 0z" />
                    </svg>
                    <div>
                        No encontramos coincidencias para la fecha o descripcion especificada
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        #fechaInputContainer {
            margin-left: 200px;
            margin-top: 100px;
            margin-bottom: 30px;
        }
    </style>

    <div id="fechaInputContainer">
        <input type="date" id="fechaInput" onchange="mostrarFechaSeleccionada()" />
        <button onclick="limpiarFecha()">Limpiar Fecha </button>
        <asp:TextBox ID="FechaSeleccionada" runat="server" Style="display: none;" />
    </div>


    <asp:UpdatePanel ID="updatePanelGridView" runat="server">
        <ContentTemplate>

            <div style="margin-left: 200px; margin-top: 50px;">
                <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged">
                    <asp:ListItem Value="NombreServicio" Text="Nombre del Servicio"></asp:ListItem>
                    <asp:ListItem Value="NombreCliente" Text="Nombre del Cliente"></asp:ListItem>
                    <asp:ListItem Value="NombreEspecialista" Text="Nombre del Especialista"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtBuscar" runat="server" Visible="true" />

                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
            </div>




            <asp:GridView ID="gridTurnos" runat="server" AutoGenerateColumns="False" CssClass="table-dark table-bordered table-group-divider" Style="width: 60%; margin-left: 200px; margin-top: 150px; font-size: 18px;" RowStyle-Height="50px">
                <Columns>
                    <asp:BoundField DataField="TurnoID" HeaderText="ID" />
                    <asp:BoundField DataField="ClienteNombre" HeaderText="Cliente" />
                    <asp:BoundField DataField="EspecialistaNombre" HeaderText="Especialista" />
                    <asp:BoundField DataField="ServicioNombre" HeaderText="Servicio" />
                    <asp:BoundField DataField="FechaDeTurno" HeaderText="Fecha de Turno" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="HoraDeTurno" HeaderText="Hora de Turno" />
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <asp:Label ID="IddelTurno" runat="server" Visible="false" Text='<%# Eval("TurnoID") %>'></asp:Label>
                            <asp:RadioButtonList ID="rblEstado" runat="server" Enabled="true" RepeatLayout="Flow" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblEstado_SelectedIndexChanged" AutoPostBack="true" SelectedValue='<%# Eval("Estado") %>'>
                                <asp:ListItem Text="Vigente" Value="1" style="margin-right: 12px;"></asp:ListItem>
                                <asp:ListItem Text="Finalizado" Value="2" style="margin-right: 12px;"></asp:ListItem>
                                <asp:ListItem Text="Cancelado" Value="3" style="margin-right: 12px;"></asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script> 

  

        function showSuccessModal() {
            $('#successModal').modal('show');
            setTimeout(function () {
                $('#successModal').modal('hide');
            }, 1000);
        }

        function showSuccessModalnodatos() {
            $('#successModalnodatos').modal('show');
            setTimeout(function () {
                $('#successModalnodatos').modal('hide');
            }, 1500);
        }


        function mostrarFechaSeleccionada() {
            var fechaSeleccionada = document.getElementById("fechaInput").value;
            document.getElementById('<%= FechaSeleccionada.ClientID %>').value = fechaSeleccionada;
        }

        function limpiarFecha() {
            document.getElementById("fechaInput").value = ""; 
            document.getElementById('<%= FechaSeleccionada.ClientID %>').value = ""; 
        }

        </script>
    
    </asp:Content>


