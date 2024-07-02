<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="TurnosRecepcion.aspx.cs" Inherits="TPC_WebForm_Equipo18.Recepcion.TurnosRecepcion.TurnosRecepcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    .grid-container {
        width: 80%;
        margin: auto;
        border-color: transparent;
    }
    .grid-scroll {
        height: 600px;
        overflow-y: scroll;
    }
    .card {
        background-color: white;
        border-radius: 15px;
        box-shadow: 0 4px 8px 0 rgba(255, 0, 0, 0.2);
        transition: 0.3s;
        margin-bottom: 20px;
        padding: 20px;
    }
    .card:hover {
        box-shadow: 0 8px 16px 0 rgba(255, 0, 0, 0.2);
    }
    .card-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .card-content div {
        margin-right: 10px;
    }
    .btn-delete {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
    }
    .btn-delete:hover {
        background-color: #c82333; 
    }
</style>


    <div class="grid-container">
        <div class="grid-scroll">
            <asp:GridView ID="GridTurnos" DataKeyNames="ID" AutoGenerateColumns="false" OnRowDataBound="GridTurnos_RowDataBound" runat="server">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="card">
                                <div class="card-content">
                                    
                                    <div><strong>Fecha de Turno:</strong> <%# Eval("FechaDeTurno", "{0:dd/MM/yyyy}") %></div>
                                    <div><strong>Hora de Turno:</strong> <%# Eval("HoraDeTurno") %></div>
                                    <div><strong>Especialista:</strong> <%# Eval("Especialista.Nombre") %></div>
                                    <div><strong>Servicio:</strong> <%# Eval("Servicio.Nombre") %></div>
                                    <asp:Button ID="btnDarBaja" OnClick="btnDarBaja_Click" CommandName="DarDeBaja" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-danger" runat="server" Text="Dar de baja" />
                                    
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>
    </div>


</asp:Content>
