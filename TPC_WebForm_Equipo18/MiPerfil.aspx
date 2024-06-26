<%@ Page Title="Perfil" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="TPC_WebForm_Equipo18.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .container {
            max-width: 800px !important;
        }

        h3 {
            margin-bottom: 20px;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        button {
            width: 100%;
        }

        .text-center img {
            max-width: 150px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>¡Bienvenido Sr, Que tenga buen desarrollo !</h1>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4 text-center">
                <asp:Image ImageUrl="https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg" CssClass="img-fluid rounded-circle mb-3" runat="server" />
                <h4><%: usuarioLogueado.Nombre + " " + usuarioLogueado.Apellido %></h4>
                <p><%: usuarioLogueado.Email %></p>
                <asp:Button ID="btnCargarImagen" Text="Subir foto de perfil" CssClass="btn btn-primary btn-block" runat="server" />
            </div>
            <div class="col-md-8">
                <h3>Opciones de perfil</h3>
                <form>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="txtNombre">Nombre</label>
                            <asp:TextBox runat="server" for="txtNombre" ID="txtNombre" CssClass="form-control" placeholder="Nombre" />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="txtApellido">Apellido</label>
                            <asp:TextBox runat="server" for="txtApellido" ID="txtApellido" CssClass="form-control" placeholder="Apellido" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtTelefono">Teléfono</label>
                        <asp:TextBox runat="server" for="txtTelefono" ID="txtTelefono" CssClass="form-control" placeholder="Teléfono" />
                    </div>
                    <div class="form-group">
                        <label for="txtDNI">DNI</label>
                        <asp:TextBox runat="server" for="txtDNI" ID="txtDNI" CssClass="form-control" placeholder="DNI" onkeypress="return isNumberKey(event)" />
                        <asp:HiddenField ID="hiddenField" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="txtFechaNacimiento">Fecha de nacimiento</label>
                        <asp:TextBox TextMode="Date" runat="server" for="txtFechaNacimiento" ID="txtFechaNacimiento" CssClass="form-control" placeholder="Fecha de nacimiento" />
                    </div>
                    <div class="form-group">
                        <label for="txtDomicilio">Domicilio</label>
                        <asp:TextBox runat="server" for="txtDomicilio" ID="txtDomicilio" CssClass="form-control" placeholder="Domicilio" />
                    </div>
                    <asp:Button Text="Guardar cambios" ID="btnGuardarCambios" runat="server" CssClass="btn btn-primary btn-block" OnClick="btnGuardarCambios_Click" OnClientClick="storeValue()" />
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        //Funcion para que solo puedan ingresarse numeros para el campo DNI
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function storeValue() {
            var txtNumero = document.getElementById('<%= txtDNI.ClientID %>').value;
            document.getElementById('<%= hiddenField.ClientID %>').value = txtNumero;
        }

</script>

</asp:Content>
