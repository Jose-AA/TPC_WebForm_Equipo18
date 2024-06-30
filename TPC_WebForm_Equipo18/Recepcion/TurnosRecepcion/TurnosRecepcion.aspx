<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="TurnosRecepcion.aspx.cs" Inherits="TPC_WebForm_Equipo18.Recepcion.TurnosRecepcion.TurnosRecepcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="grid-container">
        <div class="grid-scroll">
            <asp:GridView ID="GridTurnos" DataKeyNames="IDturno" CssClass="table table-success table-striped" AutoGenerateColumns="false" OnRowDataBound="GridTurnos_RowDataBound" runat="server">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="card">
                                <div class="card-content">
                                    <div><strong>Nombres:</strong> <%# Eval("NombreServ") %></div>
                                    <div><strong>Nombres:</strong> <%# Eval("Fecha") %></div>
                                    <div><strong>Nombres:</strong> <%# Eval("Hora") %></div>
                                    <div><strong>Nombres:</strong> <%# Eval("Especialista") %></div>
                                    <asp:Button ID="btnDarBaja" CssClass="btn btn-danger" runat="server" Text="Dar de baja" />
                                    
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>
    </div>


</asp:Content>
