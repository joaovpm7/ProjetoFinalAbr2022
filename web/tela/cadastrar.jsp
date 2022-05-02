<%-- 
    Document   : login
    Created on : 05/04/2022, 10:56:04
    Author     : sala306b
--%>

<%@page import="modelo.Usuario"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String acao = "cadastrar";
    String nome = "", tprequerente = "PF", idusuario = "",
            numero = "", complemento = "",
            dddtelefone = "", email = "",
            cidade = "", logradouro = "", bairro = "",
            uf = "", img = "", senha = "", documento = "", login = "";

    if (request.getParameter("acao") != null) {

        if (request.getParameter("acao").equals("editar")) {
            
            idusuario = request.getParameter("idusuario");
            acao = request.getParameter("acao");

            Cliente cli = new Cliente();
            cli.setId(Integer.parseInt(idusuario));
            boolean achou = cli.BuscarPorId();

            if (achou) {
                tprequerente = cli.getTpRequerente();
                documento = cli.getDocumento();
                dddtelefone = "(" + cli.getDdd() + ") " + cli.getTelefone();
                email = cli.getEmail();
                cidade = cli.getCidade();
                complemento = cli.getComplemento();
                logradouro = cli.getLogradouro();
                numero = cli.getNumero();
                bairro = cli.getBairro();
                uf = cli.getUf();
                img = cli.getImagem();

                Usuario use = new Usuario();
                boolean achouuser = use.BuscarPorId(request.getParameter("idusuario"));
                senha = use.getSenha();
                login = use.getLogin();
            }

        }

    }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Ponto</title>
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="../css/bootstrap.css" >

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="../css/estilocadastrar.css">
    </head>
    <body>

        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">
                    <img alt="logo" src="../img/LogoIni.png" />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sobre</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">Contato</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">Cadastro</a>
                        </li>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>


                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>


            <form action="../ClienteServlet" method="POST">
                <input type="hidden" name="acao" value="<%= acao%>"/>
                <input type="hidden" name="idusuario" value="<%= idusuario%>"/>  

                <h1>Dados da Entidade</h1> 

                <fieldset class="form-group row">
                    <legend class="col-form-label col-sm-2 float-sm-left pt-0">Tipo do Requerente</legend>
                    <div class="col-sm-10">
                        <div id="divfisica" class="form-check">
                            <input class="form-check-input" 
                                   <%= tprequerente.equals("PF") ? "checked" : "" %>
                                   type="radio" name="requerente"  id="gridRadios1" value="PF">
                            <label class="form-check-label" for="gridRadios1">
                                Pessoa Física
                            </label>
                        </div>
                        <div id="divjuridica" class="form-check">
                            <input class="form-check-input" 
                                   <%= tprequerente.equals("PJ") ? "checked" : "" %>
                                   type="radio" name="requerente" id="gridRadios2" value="PJ" >
                            <label class="form-check-label" for="gridRadios2">
                                Pessoa Jurídica
                            </label>
                        </div>

                    </div>
                </fieldset>


                <div class="form-group row">
                    <label id="lblNomeRazao" for="lblNome" class="col-sm-2 col-form-label">Nome</label>
                    <div class="col-sm-10">
                        <input type="text" name="nomerazao" class="form-control" id="inputNome" 
                               value="<%= nome %>">
                    </div>
                </div>

                <div class="form-group row">
                    <label id="lblCpfCnpj" for="txtCpfCnpj" class="col-sm-2 col-form-label">CPF</label>
                    <div class="col-sm-10">
                        <input type="text" name="documento" class="form-control" id="txtCpfCnpj" 
                               value="<%= documento %>">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputLogradouro" class="col-sm-2 col-form-label">Logradouro</label>
                    <div class="col-sm-6">
                        <input type="text" 
                               value="<%= logradouro %>"
                               name="logradouro" 
                               class="form-control" id="inputLogradouro">
                    </div>
                    <label for="inputNumero" class="col-sm-2 col-form-label">Número</label>
                    <div class="col-sm-2">
                        <input type="text"  
                               value="<%= numero %>"
                               name="numero" 
                               class="form-control" id="inputNumero">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtDddTelefone" class="col-sm-2 col-form-label">Telefone</label>
                    <div class="col-sm-5">
                        <input type="text"  
                               value="<%= dddtelefone %>"
                               name="telefone" class="form-control" id="txtDddTelefone">
                    </div>
                </div>
                <div class="form-group row">

                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-5">
                        <input type="email"  
                               value="<%= email %>"
                               name="email"  class="form-control" id="inputEmail" size="20">
                    </div>



                    <label for="inputCidade" class="col-sm-2 col-form-label">Cidade</label>
                    <div class="col-sm-3">
                        <input type="text" 
                               value="<%= cidade %>"
                               name="cidade" class="form-control" id="inputCidade">
                    </div>
                </div>


                <div class="form-group row">
                  
                    <label for="inputBairro" class="col-sm-2 col-form-label">Bairro</label>
                    <div class="col-sm-3">
                        <input type="text"  name="bairro" class="form-control" id="inputBairro">
                    </div>
                </div>


                <div class="form-group row">

                    <label for="sltUf" class="col-sm-2 col-form-label">UF:</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="sltUf" name="uf">
                            <option value="ES">Espirito Santo </option>
                            <option value="MG">Minas Gerais </option>
                            <option value="SP">São Paulo </option>
                            <option value="RJ"> Rio de janeiro</option>

                        </select>

                    </div>
                    <label for="inputImgempresa" class="col-sm-2 col-form-label">Imagem da empresa </label>

                    <div class="col-sm-5">
                        <input type="file"  name="imagemempresa" class="form-control" id="inputImgempresa" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputsenha" class="col-sm-2 col-form-label">Senha</label>
                    <div class="col-sm-4">
                        <input type="password"  name="senha"  class="form-control" id="inputsenha" size="10">
                    </div>
                    <label for="#inputconfSenha" class="col-sm-2 col-form-label">Confirme Senha</label>
                    <div class="col-sm-4">
                        <input type="password"  name="confsenha" class="form-control" id="inputconfSenha">
                    </div>
                </div>
                <table cellpadding="20px" cellspacing="4">
                    <tr>
                        <td><h2>Selecione a localização do ponto de coleta</h2> </td>
                    <tr>   
                </table>
                <table cellpadding="20px" cellspacing="4">
                    <img src="../img/mapa3.jfif" style="width: 100%"/>
                </table>
                <br><br>
                <button type="submit" class="botaocad">Cadastrar ponto de coleta</button>
            </form 
        </div>
    </div>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.mask.js"></script>
    <script type="text/javascript" src="../js/scriptcadastrar.js"></script>
    //lblCpfCnpf
    <script>
        jQuery(document).ready(function ($) {
            $("#txtCpfCnpj").mask("000.000.000-00");
            $("#divfisica").on("click", function (e) {
                $("#lblNomeRazao").html("Nome");
            });
            $("#divjuridica").on("click", function (e) {
                $("#lblNomeRazao").html("Jurídica");
            });
            $("#divfisica").on("click", function (e) {
                $("#txtCpfCnpj").mask("000.000.000-00");
                $("#lblCpfCnpj").html("CPF");
            });
            $("#divjuridica").on("click", function (e) {
                $("#txtCpfCnpj").mask("00000000000000000");
                $("#lblCpfCnpj").html("CNPJ");
            });
            $("#txtDddTelefone").on("click", function (e) {
                $("#txtDddTelefone").mask("(00) 00000-0000");
            });
        });
    </script>
</body>
</html>
