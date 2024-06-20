<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="ModificarImagenesPorServicio.aspx.cs" Inherits="TPC_WebForm_Equipo18.ADMIN.ABM_Servicios.ModificarImagenesPorServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Imágenes asociadas al servicio</h1>
       <% if (listaImagenes.Count == 0)
           {%>
                <h2>No hay imágenes asociadas al servicio. Agregue imágenes para poder visualizarlas</h2>    
            <%}
          else
          { %>
        
            <div class="row row-cols-1 row-cols-md-3 g-4 mt-3">
                <asp:Repeater runat="server" ID="repetidorImagenes">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card" style="width: 18rem;">
                                <div class="card-body">
                                    <div>
                                        <img src="<%# ((Dominio.Imagen)Container.DataItem).Url %>"" class="card-img-top" alt="Imagen de servicio" onerror="this.onerror=null;this.src='https://static.vecteezy.com/system/resources/previews/004/639/366/non_2x/error-404-not-found-text-design-vector.jpg';">
                                    </div>
                                    <div>
                                        <asp:Button runat="server" ID="btnEliminarImagen" Text="Eliminar" CssClass="btn btn-primary" Style="position: relative; left: 80px; top: 7px;" OnClick="btnEliminarImagen_Click"  CommandArgument='<%# Eval("IDImagen") %>' />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
           </div>

        <%} %>

    <asp:Button Text="Regresar" ID="btnRegresar" CssClass="btn btn-primary" OnClick="btnRegresar_Click" runat="server" style="margin-top: 20px; margin-left: 20px;"/>
</asp:Content>
