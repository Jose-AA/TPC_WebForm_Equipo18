<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="ModificarImagenesPorServicio.aspx.cs" Inherits="TPC_WebForm_Equipo18.ADMIN.ABM_Servicios.ModificarImagenesPorServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="row row-cols-1 row-cols-md-3 g-4 mt-3">
                <asp:Repeater runat="server" ID="repetidorImagenes">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card" style="width: 18rem;">
                                <div class="card-body">
                                    <img src="<%# ((Dominio.Imagen)Container.DataItem).Url %>"" class="card-img-top" alt="Imagen de servicio">
                                    <asp:Button runat="server" ID="btnEliminarImagen" Text="Eliminar" CssClass="btn btn-primary" OnClick="btnEliminarImagen_Click"  CommandArgument='<%# Eval("IDImagen") %>' />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
           </div>

            <div id="EliminacionExitosa" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalExitoEliminarLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalExitoEliminarLabel">¡Imagen Eliminada Exitosamente!</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                             </button>
                         </div>
                        <div class="modal-body">
                            <p>Se ha eliminado la imagen exitosamente.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                        </div>
                    </div>
                </div>
            </div>

    <asp:Button Text="Regresar" ID="btnRegresar" CssClass="btn btn-primary" OnClick="btnRegresar_Click" runat="server" />
</asp:Content>
