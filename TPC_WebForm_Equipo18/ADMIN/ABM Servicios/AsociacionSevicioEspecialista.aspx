<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="AsociacionSevicioEspecialista.aspx.cs" Inherits="TPC_WebForm_Equipo18.ADMIN.ABM_Servicios.AsociacionSevicioEspecialista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <h1 style="margin-left: 200px; margin-top: 50px;" >Asociar o Modificar Servicios Asociados al Especialista </h1>

      <div class="modal fade" id="successModal" tabindex="-1" role="alert" aria-labelledby="successModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="alert">
          <div class="modal-content" style="background-color: #d1e7dd; border: none;">
              <div class="modal-body" style="padding: 0; padding-bottom: 0; border: none;">
                  <div class="alert alert-success d-flex align-items-center" role="alert" style="margin-bottom: 0">
                      <svg class="bi flex-shrink-0 me-2  " width="50" height="50" fill="currentColor" viewBox=" 0 0 16 16">
                          <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.354 11.354l-3.5-3.5a.5.5 0 0 1 .707-.707L6.5 10.293l6-6a.5.5 0 0 1 .707.707l-6.5 6.5a.5.5 0 0 1-.707 0z" />
                      </svg>
                      <div>
                          Asociacion Actualizada
                 
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
                      No encontramos coincidencias para la  descripcion especificada
                  </div>
              </div>
          </div>
      </div>
  </div>



  <asp:UpdatePanel ID="updatePanelGridView" runat="server">
    <ContentTemplate>
        <div style="margin-left: 200px; margin-top: 50px;">
            <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged">
                <asp:ListItem Value="NombreServicio" Text="Nombre del Servicio"></asp:ListItem>
                <asp:ListItem Value="NombreEspecialista" Text="Nombre o Apellido del Especialista"></asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtBuscar" runat="server" Visible="true" />
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
        </div>
        <asp:GridView ID="gridEspecialistas" runat="server" AutoGenerateColumns="False" CssClass="table-dark table-bordered table-group-divider" Style="width: 60%; margin-left: 200px; margin-top: 150px; font-size: 18px;" RowStyle-Height="50px">
            <Columns>
                <asp:BoundField DataField="IdUsuario" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                <asp:BoundField DataField="ServicioAsociado.Nombre" HeaderText="Servicio Asociado" />
                <asp:TemplateField HeaderText="Asociar o Cambiar Servicio Asociado">
                    <ItemTemplate>
                        <asp:Label ID="lblEspecialistaId" runat="server" Visible="false" Text='<%# Eval("IdUsuario") %>'></asp:Label>
                        <asp:DropDownList ID="ddlServicios" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlServicios_SelectedIndexChanged"></asp:DropDownList>
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

    </script>


</asp:Content>
