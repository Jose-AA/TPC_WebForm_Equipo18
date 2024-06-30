<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Bajalogica-AltaLogica.aspx.cs" Inherits="TPC_WebForm_Equipo18.ADMIN.ABM_Servicios.Bajalogica_AltaLogica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 style="margin-top: 100px; margin-left: 300px;">Activar o desactivar servicios</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

   <!-- Modal -->
<div class="modal fade" id="successModal" tabindex="-1" role="alert" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="alert">
        <div class="modal-content" style=" background-color:#d1e7dd; border:none; ">
            <div class="modal-body" style=" padding:0; padding-bottom:0; border:none; "  >
                <div class="alert alert-success d-flex align-items-center" role="alert"  style=" margin-bottom:0"  >
                    <svg class="bi flex-shrink-0 me-2  " width="50" height="50" fill="currentColor" viewBox=" 0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.354 11.354l-3.5-3.5a.5.5 0 0 1 .707-.707L6.5 10.293l6-6a.5.5 0 0 1 .707.707l-6.5 6.5a.5.5 0 0 1-.707 0z"/>
                    </svg>
                    <div>
                        Estado Actualizado
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
   

    <asp:UpdatePanel ID="updatePanelGridView" runat="server">
    <ContentTemplate>
        <asp:GridView ID="gridServicios" runat="server" AutoGenerateColumns="False" OnRowDataBound="gridServicios_RowDataBound" CssClass="table-dark table-bordered table-group-divider "  style="width: 60%; margin-left: 300px; margin-top: 150px; font-size: 18px;  " RowStyle-Height="50px"  >
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                <asp:BoundField DataField="Duracion" HeaderText="Duración" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" />
                <asp:TemplateField HeaderText="Estado">
                    <ItemTemplate>
                        <asp:Label ID="Iddelservicio" runat="server" Visible="false" Text='<%# Eval("Id") %>'></asp:Label>
                        <asp:RadioButtonList ID="rblEstado" runat="server" Enabled="true" RepeatLayout="Flow"
                            RepeatDirection="Horizontal" OnSelectedIndexChanged="rblEstado_SelectedIndexChanged1" AutoPostBack="true">
                            <asp:ListItem Text="Activado" Value="true" style="margin-right: 12px;"></asp:ListItem>
                            <asp:ListItem Text="Desactivado" Value="false" style="margin-right: 12px;"></asp:ListItem>
                        </asp:RadioButtonList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>


       <script type="text/javascript">
           function showSuccessModal() {
               $('#successModal').modal('show');
               setTimeout(function () {
                   $('#successModal').modal('hide');
               }, 1000); 
           }
          </script>


</asp:Content>
