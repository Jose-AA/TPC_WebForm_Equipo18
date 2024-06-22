<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="TPC_WebForm_Equipo18.IniciarSesion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerr" id="containerr">
        <div class="form-containerr sign-in">
            <form>
                <h1 style="position:relative; left:55px; top:25px;" >Iniciar Sesión</h1>
                <asp:TextBox runat="server" Style="position:relative; left:65px; top:45px; width: 259px;" placeholder="email" ID="txtEmailLogin" />
                <div style="position:relative; left: 65px; top: 45px;">
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtEmailLogin" ForeColor="Red" runat="server" ID="requiredEmailLogin" ValidationGroup="iniciarSesion" />
                </div>
                <div style="position: relative; left: 50px; top: 45px;">
                    <asp:TextBox runat="server" type="password" placeholder="Contraseña" ID="txtContraseñaLogin" Style="width: 259px; position: relative; left: 15px; padding: 10px 65px 10px 10px !important;" />
                    <img src="Content/Icons/eye-closed.png" style="width: 25px; cursor: pointer; position: relative; left: -45px;" id="eye-icon-login" alt="" />
                </div>
                <div style="position:relative; left:65px; top:45px;">
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtContraseñaLogin" ForeColor="Red" runat="server" ID="requiredContraseñaLogin" ValidationGroup="iniciarSesion" />
                </div>
                <a href="#" style="position:relative; left: 115px; top: 55px;">¿Olvidaste tu contraseña?</a>
                <asp:Button style="position:relative; left: 25px; top: 65px;" Text="Ingresar" ID="btnIniciarSesion" OnClick="btnIniciarSesion_Click" runat="server" />
                <asp:Label style="position:relative; left: 120px; top:80px" Text="" ForeColor="Red" ID="lblErrorLogin" runat="server" />
            </form>
        </div>
        <div class="toggle-containerr">
            <div class="toggle">
                <div class="toggle-panel toggle-right">
                    <h1>¿Primera vez ingresando?</h1>
                    <p>Registrate para acceder a todas las funcionalidades</p>
                    <asp:Button Text="Registrarse" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>

    <script>

    //Para el efecto de transición entre Login y Sign Up
    const contenedor = document.getElementById('containerr');
    const registerBtn = document.getElementById('register');
    const loginBtn = document.getElementById('login');

    //Para mostrar u ocultar la contraseña
    const eyeIconLogin = document.getElementById("eye-icon-login");
    const passwordLogin = document.getElementById("<%= txtContraseñaLogin.ClientID %>");

    eyeIconLogin.onclick = function () {
        if (passwordLogin.type == "password") {
            passwordLogin.type = "text";
            eyeIconLogin.src = "Content/Icons/eye-open.png"
        }
        else {
            passwordLogin.type = "password"
            eyeIconLogin.src = "Content/Icons/eye-closed.png"
        }
    }


    </script>

</asp:Content>
