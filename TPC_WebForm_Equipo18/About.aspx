<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TPC_WebForm_Equipo18.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/login.css" rel="stylesheet" />
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Your application description page.</h3>
        <p>Use this area to provide additional information.</p>
        <asp:Button Text="Login" runat="server" ID="btnLogin" OnClick="btnLogin_Click" CssClass="btn btn-primary" />


        <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog custom-modal-size">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class=" btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!--
                            Inicio de Login Modal
                        !-->
                        <div class="containerr" id="containerr">
                            <div class="form-containerr sign-up">
                                <form>
                                    <h1>Crear cuenta</h1>
                                    <!--
                                    <div class="social-icons">
                                        <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                                        <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                                        <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                                    </div>
                                    <span>or use your email for registeration</span>
                                     !-->
                                    <asp:TextBox runat="server" placeholder="Nombre" ID="txtNombreRegistrar" />
                                    <div>
                                        <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ControlToValidate="txtNombreRegistrar" ForeColor="Red" runat="server" ValidationGroup="Save" />
                                    </div>
                                    <!--<input type="text" placeholder="Nombre">  !-->
                                    <!--<input type="email" placeholder="Email">!-->
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
                                        <img src="Content/Icons/eye-closed.png" style="width: 25px; cursor: pointer; position: relative; left: -45px;" id="eye-icon" alt="" />
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
                                    <!--<input type="password" placeholder="Contrasela"> !-->
                                    <button onclick="console.log('test'); return false;">Registrarse</button>
                                </form>
                            </div>
                            <div class="form-containerr sign-in">
                                <form>
                                    <h1>Iniciar Sesión</h1>
                                    <!--
                                    <div class="social-icons">
                                        <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                                        <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                                        <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                                    </div>
                                    <span>or use your email password</span>
                                    !-->
                                    <input type="email" placeholder="Email">
                                    <input type="password" placeholder="Contraseña">
                                    <a href="#">¿Olvidaste tu contraseña?</a>
                                    <button>Iniciar Sesión</button>
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
                        <!--
                            Fin de Login Modal
                        !-->
                    </div>
                </div>
            </div>
        </div>



    </main>


    <script>
        // esta funcion abre la modal cuando es llamada desde el codebehind
        function abirModalLoginSignUp() {
            var myModal = new bootstrap.Modal(document.getElementById('successModal'), {
                keyboard: false
            });
            myModal.show();
        }

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


        //Para mostrar u ocultar la contraseña
        const eyeIcon = document.getElementById("eye-icon");
        const password = document.getElementById("<%= txtContraseñaRegistrar.ClientID %>");

        eyeIcon.onclick = function () {
            if (password.type == "password") {
                password.type = "text";
                eyeIcon.src = "Content/Icons/eye-open.png"
            }
            else {
                password.type = "password"
                eyeIcon.src = "Content/Icons/eye-closed.png"
            }
        }


    </script>
</asp:Content>
