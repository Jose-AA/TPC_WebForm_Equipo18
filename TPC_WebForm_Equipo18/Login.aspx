<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_WebForm_Equipo18.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerr" id="containerr">
        <div class="form-containerr sign-up">
            <form>
                <h1>Crear cuenta</h1>
                <asp:TextBox runat="server" placeholder="Nombre" ID="txtNombreRegistrar" />
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtNombreRegistrar" ForeColor="Red" runat="server" ValidationGroup="Save" />
                </div>
                <asp:TextBox runat="server" placeholder="Apellido" ID="txtApellidoRegistrar" />
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtApellidoRegistrar" ForeColor="Red" runat="server" ValidationGroup="Save" />
                </div>
                <asp:TextBox runat="server" placeholder="email" ID="txtEmailRegistrar" />
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtEmailRegistrar" ForeColor="Red" runat="server" ValidationGroup="Save" />
                    <asp:RegularExpressionValidator CssClass="error-message" ErrorMessage="* Debe ingresar un mail válido" ControlToValidate="txtEmailRegistrar" ForeColor="Red"
                        ValidationExpression="^([\w\.-]+)@((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(([\w-]+\.)+[a-zA-Z]{2,4}))$" runat="server" />
                </div>
                <div class="input-password">
                    <asp:TextBox runat="server" placeholder="Contraseña" type="password" ID="txtContraseñaRegistrar" />
                    <img src="Content/Icons/eye-closed.png" style="width: 25px; cursor: pointer; position: relative; left: -45px;" id="eye-icon-register" alt="" />
                </div>
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtContraseñaRegistrar" ForeColor="Red" runat="server" ValidationGroup="Save" />
                </div>
                <asp:TextBox runat="server" placeholder="Confirmar Contraseña" type="password" ID="txtValidarContraseñaRegistrar" />
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtValidarContraseñaRegistrar" ForeColor="Red" runat="server" ValidationGroup="Save" />
                    <asp:CompareValidator CssClass="error-message" ID="cvPasswords" runat="server" ControlToValidate="txtValidarContraseñaRegistrar"
                        ControlToCompare="txtContraseñaRegistrar" ErrorMessage="* Las contraseñas no coinciden" ForeColor="Red" ValidationGroup="Save"></asp:CompareValidator>
                </div>
                <asp:Button Text="Registrarse" ID="btnRegistrarUsuario" OnClick="btnRegistrarUsuario_Click" runat="server" />
            </form>
        </div>
        <div class="form-containerr sign-in">
            <form>
                <h1>Iniciar Sesión</h1>
                <asp:TextBox runat="server" placeholder="email" ID="txtEmailLogin" />
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtEmailLogin" ForeColor="Red" runat="server" ValidationGroup="Save" />
                </div>
                <div>
                    <asp:TextBox runat="server" type="password" placeholder="Contraseña" ID="txtContraseñaLogin" Style="width: 259px; position: relative; left:15px; padding: 10px 65px 10px 10px !important;"  />
                    <img src="Content/Icons/eye-closed.png" style="width: 25px; cursor: pointer; position: relative; left: -45px;" id="eye-icon-login" alt="" />
                </div>
                <div>
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtEmailLogin" ForeColor="Red" runat="server" ValidationGroup="Save" />
                </div>
                <a href="#">¿Olvidaste tu contraseña?</a>
                <asp:Button Text="Iniciar Sesión" ID="btnIniciarSesion" OnClick="btnIniciarSesion_Click" runat="server" />
                <asp:Label Text="" ForeColor="Red" ID="lblErrorLogin" runat="server" />
            </form>
        </div>
        <div class="toggle-containerr">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>¡Bienvenido de vuelta!</h1>
                    <p>Ingresa para acceder a todas las funcionalidades</p>
                    <button onclick="console.log('test'); return false;" class="hidden" id="login">Iniciar Sesión</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>¿Primera vez ingresando?</h1>
                    <p>Registrate para acceder a todas las funcionalidades</p>
                    <button onclick="console.log('test'); return false;" class="hidden" id="register">Registrarse</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        //Para el efecto de transición entre Login y Sign Up
        const contenedor = document.getElementById('containerr');
        const registerBtn = document.getElementById('register');
        const loginBtn = document.getElementById('login');

        registerBtn.addEventListener('click', () => {
            contenedor.classList.add("active");
        });

        loginBtn.addEventListener('click', () => {
            contenedor.classList.remove("active");
        });

        function errorSignUp() {
            contenedor.classList.add("active");
        }

        //Para mostrar u ocultar la contraseña
        const eyeIconRegister = document.getElementById("eye-icon-register");
        const eyeIconLogin = document.getElementById("eye-icon-login");
        const passwordRegister = document.getElementById("<%= txtContraseñaRegistrar.ClientID %>");
        const passwordLogin = document.getElementById("<%= txtContraseñaLogin.ClientID %>");

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
