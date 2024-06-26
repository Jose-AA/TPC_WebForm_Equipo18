<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="TPC_WebForm_Equipo18.Registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerr active" id="containerr">
        <div class="form-containerr sign-up">
            <form>
                <h1>Crear cuenta</h1>
                <asp:TextBox runat="server" placeholder="Nombre" ID="txtNombreRegistrar" />
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtNombreRegistrar" ForeColor="Red" runat="server" ValidationGroup="Register" ID="requiredNombreRegister" />
                </div>
                <asp:TextBox runat="server" placeholder="Apellido" ID="txtApellidoRegistrar" />
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtApellidoRegistrar" ForeColor="Red" runat="server" ValidationGroup="Register" ID="requiredApellidoRegister" />
                </div>
                <asp:TextBox runat="server" placeholder="email" ID="txtEmailRegistrar" />
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtEmailRegistrar" ForeColor="Red" runat="server" ValidationGroup="Register" ID="requiredEmailRegister" />
                    <asp:RegularExpressionValidator CssClass="error-message" ErrorMessage="* Debe ingresar un mail válido" ControlToValidate="txtEmailRegistrar" ValidationGroup="Register" ForeColor="Red"
                        ValidationExpression="^([\w\.-]+)@((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(([\w-]+\.)+[a-zA-Z]{2,4}))$" runat="server" ID="regexEmailRegister" />
                </div>
                <div class="input-password">
                    <asp:TextBox runat="server" placeholder="Contraseña" type="password" ID="txtContraseñaRegistrar" />
                    <img src="Content/Icons/eye-closed.png" style="width: 25px; cursor: pointer; position: relative; left: -45px;" id="eye-icon-register" alt="" />
                </div>
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtContraseñaRegistrar" ForeColor="Red" runat="server" ValidationGroup="Register" ID="requiredContraseña1Register" />
                </div>
                <asp:TextBox runat="server" placeholder="Confirmar Contraseña" type="password" ID="txtValidarContraseñaRegistrar" />
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtValidarContraseñaRegistrar" ForeColor="Red" runat="server" ValidationGroup="Register" ID="requiredContraseña2Register" />
                    <asp:CompareValidator CssClass="error-message" ID="cvPasswords" runat="server" ControlToValidate="txtValidarContraseñaRegistrar"
                        ControlToCompare="txtContraseñaRegistrar" ErrorMessage="* Las contraseñas no coinciden" ForeColor="Red" ValidationGroup="Register"></asp:CompareValidator>
                </div>
                <asp:Button Text="Registrarse" ID="btnRegistrarUsuario" OnClick="btnRegistrarUsuario_Click" runat="server" />
                <asp:Label ID="lblMailYaRegistrado" Text="" runat="server" style="position: relative; left: -200px; top:-40px;" ForeColor="Red" />
            </form>
        </div>
        <div class="toggle-containerr">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>¡Bienvenido de vuelta!</h1>
                    <p>Ingresa para acceder a todas las funcionalidades</p>
                    <asp:Button Text="Iniciar Sesión" ID="btnIniciarSesion" OnClick="btnIniciarSesion_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>

    <script>

        const contenedor = document.getElementById('containerr');
        const registerBtn = document.getElementById('register');
        const loginBtn = document.getElementById('login');

        function errorSignUp() {
            contenedor.classList.add("active");
        }

        //Para mostrar u ocultar la contraseña
        const eyeIconRegister = document.getElementById("eye-icon-register");
        const passwordRegister = document.getElementById("<%= txtContraseñaRegistrar.ClientID %>");

        eyeIconRegister.onclick = function () {
            if (passwordRegister.type == "password") {
                passwordRegister.type = "text";
                eyeIconRegister.src = "Content/Icons/eye-open.png"
            }
            else {
                passwordRegister.type = "password"
                eyeIconRegister.src = "Content/Icons/eye-closed.png"
            }
        }

    </script>

</asp:Content>
