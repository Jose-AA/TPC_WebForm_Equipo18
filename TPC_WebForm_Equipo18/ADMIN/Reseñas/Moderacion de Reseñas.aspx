<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Moderacion de Reseñas.aspx.cs" Inherits="TPC_WebForm_Equipo18.ADMIN.Reseñas.Moderacion_de_Reseñas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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


    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <h1 style="margin-top: 30px; margin-bottom: 30px; margin-left: 400px">Listado General de reseñas </h1>

    <input id="date" type="date" style="margin-top: 30px; margin-bottom: 30px; margin-left: 400px" />

    <asp:UpdatePanel ID="updatePanelGridView" runat="server">
        <ContentTemplate>

            <div class="container" style="margin-top: 50px; margin-bottom: 30px; margin-left: 400px">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <!-- Pestañas dinámicas -->
                    <asp:Repeater ID="rptTabs" runat="server">
                        <ItemTemplate>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link <%# Container.ItemIndex == 0 ? "active" : "" %>" id="tab<%# Container.ItemIndex %>" data-bs-toggle="tab" data-bs-target="#tab-pane<%# Container.ItemIndex %>" type="button" role="tab" aria-controls="tab-pane<%# Container.ItemIndex %>" aria-selected="<%# Container.ItemIndex == 0 %>"><%# Container.ItemIndex + 1 %></button>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <!-- Contenido de pestañas dinámicas -->
                    <asp:Repeater ID="rptTabContent" runat="server">
                        <ItemTemplate>
                            <div class="tab-pane fade <%# Container.ItemIndex == 0 ? "show active" : "" %>" id="tab-pane<%# Container.ItemIndex %>" role="tabpanel" aria-labelledby="tab<%# Container.ItemIndex %>" tabindex="0">
                                <asp:Repeater ID="rptReseñas" runat="server" DataSource='<%# Container.DataItem %>'>
                                    <ItemTemplate>
                                        <div class="row mb-3">
                                            <asp:Repeater ID="rptInnerReseñas" runat="server" DataSource='<%# Container.DataItem %>'>
                                                <ItemTemplate>
                                                    <div class="col-md-4">
                                                        <div class="card mb-3" style="max-width: 350px;">
                                                            <div class="row g-0">
                                                                <div class="col-md-4">
                                                                    <img src="https://avatars.githubusercontent.com/u/129862385?v=4" class="img-fluid rounded-start" alt="..." />
                                                                </div>                                                             
                                                                    <asp:UpdatePanel ID="updatePanelGridView2" runat="server">
                                                                        <ContentTemplate>
                                                                            <div class="card-body">
                                                                                <h5 class="card-title"><%# Eval("Cliente.Nombre") %> <%# Eval("Cliente.Apellido") %></h5>
                                                                                <p class="card-text"><%# Eval("Comentario") %></p>
                                                                                <%# GenerarEstrellasSVG(Convert.ToInt32(Eval("Calificacion"))) %>
                                                                                <p class="card-text"><small class="text-muted"><%# Eval("CreadoEn") %></small></p>
                                                                                <asp:Label ID="lblServicioId" runat="server" Visible="false" Text='<%# Eval("Servicio.Id") %>'></asp:Label>
                                                                                <asp:HiddenField ID="hfResenaId" runat="server" Value='<%# Eval("ResenaId") %>' />
                                                                                <asp:CheckBox ID="chkActivo" runat="server" Checked='<%# Eval("Activo") %>' Text="Activo" OnCheckedChanged="chkActivo_CheckedChanged" AutoPostBack="true" />
                                                                            </div>                                                                          
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </div>
                                                            </div>
                                                        </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript">
    function showSuccessModal() {
        $('#successModal').modal('show');
        setTimeout(function () {
            $('#successModal').modal('hide');
        }, 1000); 
    }
    </script>


</asp:Content>
