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
            uf = "", img = "", senha = "", documento = "", login = "", cep = "";

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
                                   <%= tprequerente.equals("PF") ? "checked" : ""%>
                                   type="radio" name="requerente"  id="gridRadios1" value="PF">
                            <label class="form-check-label" for="gridRadios1">
                                Pessoa Física
                            </label>
                        </div>
                        <div id="divjuridica" class="form-check">
                            <input class="form-check-input" 
                                   <%= tprequerente.equals("PJ") ? "checked" : ""%>
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
                               value="<%= nome%>">
                    </div>
                </div>

                <div class="form-group row">
                    <label id="lblCpfCnpj" for="txtCpfCnpj" class="col-sm-2 col-form-label">CPF</label>
                    <div class="col-sm-10">
                        <input type="text" name="documento" class="form-control" id="txtCpfCnpj" 
                               value="<%= documento%>">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtcep" class="col-sm-2 col-form-label">CEP</label>
                    <div class="col-sm-10">
                        <input id="txtcep"
                               name="cep"
                               placeholder="Informe o seu CEP aqui.."
                               type="text"
                               class="form-control"
                               value="<%= cep%>">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputLogradouro" class="col-sm-2 col-form-label">Logradouro</label>
                    <div class="col-sm-6">
                        <input type="text" 
                               value="<%= logradouro%>"
                               name="logradouro" 
                               class="form-control" id="txtlogradouro">
                    </div>
                    <label for="inputNumero" class="col-sm-2 col-form-label">Número</label>
                    <div class="col-sm-2">
                        <input type="text"  
                               value="<%= numero%>"
                               name="numero" 
                               class="form-control" id="txtnumero">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtDddTelefone" class="col-sm-2 col-form-label">Telefone</label>
                    <div class="col-sm-5">
                        <input type="text"  
                               value="<%= dddtelefone%>"
                               name="telefone" class="form-control" id="txtDddTelefone">
                    </div>
                </div>
                <div class="form-group row">

                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-5">
                        <input type="email"  
                               value="<%= email%>"
                               name="email"  class="form-control" id="inputEmail" size="20">
                    </div>



                    <label for="inputCidade" class="col-sm-2 col-form-label">Cidade</label>
                    <div class="col-sm-3">
                        <input type="text" 
                               value="<%= cidade%>"
                               name="cidade"
                               class="form-control" 
                               id="txtcidade">
                    </div>
                </div>


                <div class="form-group row">

                    <label for="inputBairro" class="col-sm-2 col-form-label">Bairro</label>
                    <div class="col-sm-3">
                        <input type="text"
                               name="bairro" 
                               class="form-control"
                               id="txtbairro"
                               value="<%=bairro%>">
                    </div>
                </div>


                <div class="form-group row">

                    <label for="sltestado" class="col-sm-2 col-form-label">UF:</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="sltestado" name="estado" value="<%=uf%>">
                            <option selected="" value="">Selecione o Estado (UF)</option>
                            <option value="">Selecione</option>
                            <option <%= uf.equals("AC") ? "selected" : ""%>
                                value="AC">Acre</option>
                            <option <%= uf.equals("AL") ? "selected" : ""%>
                                value="AL">Alagoas</option>
                            <option <%= uf.equals("AP") ? "selected" : ""%> 
                                value="AP">Amapá</option>
                            <option <%= uf.equals("AM") ? "selected" : ""%>
                                value="AM">Amazonas</option>
                            <option <%= uf.equals("BA") ? "selected" : ""%>
                                value="BA">Bahia</option>
                            <option <%= uf.equals("CE") ? "selected" : ""%>
                                value="CE">Ceará</option>
                            <option <%= uf.equals("DF") ? "selected" : ""%>
                                value="DF">Distrito Federal</option>
                            <option <%= uf.equals("ES") ? "selected" : ""%>
                                value="ES">Espirito Santo</option>
                            <option <%= uf.equals("GO") ? "selected" : ""%>
                                value="GO">Goiás</option>
                            <option <%= uf.equals("MA") ? "selected" : ""%>
                                value="MA">Maranhão</option>
                            <option <%= uf.equals("MS") ? "selected" : ""%>
                                value="MS">Mato Grosso do Sul</option>
                            <option <%= uf.equals("MT") ? "selected" : ""%> 
                                value="MT">Mato Grosso</option>
                            <option <%= uf.equals("MG") ? "selected" : ""%> 
                                value="MG">Minas Gerais</option>
                            <option <%= uf.equals("PA") ? "selected" : ""%> 
                                value="PA">Pará</option>
                            <option <%= uf.equals("PB") ? "selected" : ""%> 
                                value="PB">Paraíba</option>
                            <option <%= uf.equals("PR") ? "selected" : ""%> 
                                value="PR">Paraná</option>
                            <option <%= uf.equals("PE") ? "selected" : ""%>
                                value="PE">Pernambuco</option>
                            <option <%= uf.equals("PI") ? "selected" : ""%> 
                                value="PI">Piauí</option>
                            <option <%= uf.equals("RJ") ? "selected" : ""%> 
                                value="RJ">Rio de Janeiro</option>
                            <option <%= uf.equals("RN") ? "selected" : ""%> 
                                value="RN">Rio Grande do Norte</option>
                            <option <%= uf.equals("RS") ? "selected" : ""%> 
                                value="RS">Rio Grande do Sul</option>
                            <option <%= uf.equals("RO") ? "selected" : ""%> 
                                value="RO">Rondônia</option>
                            <option <%= uf.equals("RR") ? "selected" : ""%> 
                                value="RR">Roraima</option>
                            <option <%= uf.equals("SC") ? "selected" : ""%> 
                                value="SC">Santa Catarina</option>
                            <option <%= uf.equals("SP") ? "selected" : ""%> 
                                value="SP">São Paulo</option>
                            <option <%= uf.equals("SE") ? "selected" : ""%> 
                                value="SE">Sergipe</option>
                            <option <%= uf.equals("TO") ? "selected" : ""%> 
                                value="TO">Tocantins</option>
                        </select>
                    </div>
                    <label for="inputImgempresa" class="col-sm-2 col-form-label">Imagem da empresa </label>

                    <div class="col-sm-5">
                        <input type="file"  name="imagem" class="form-control" id="txtimagem" value="<%=img%>"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputsenha" class="col-sm-2 col-form-label">Senha</label>
                    <div class="col-sm-4">
                        <input type="password"  name="senha"  class="form-control" id="inputsenha" size="10" value="<%=senha%>">
                    </div>
                    <label for="#inputconfSenha" class="col-sm-2 col-form-label">Confirme Senha</label>
                    <div class="col-sm-4">
                        <input type="password"  name="confsenha" class="form-control" id="inputconfSenha" value="<%=senha%>">
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
                <button type="submit" class="botaocad" value="cadastrar">Cadastrar ponto de coleta</button>
            </form 
        </div>
    </div>

    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
    <script type="text/javascript" src="../js/jquery.mask.js"></script>
    <script type="text/javascript" src="../js/scriptcadastrar.js"></script>

    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            
            $('#txtcep').on("blur", function (e) {
                    const cep = $("#txtcep").val();
                    const ceplimpo = String(cep)
                            .replace(".", "")
                            .replace("-", "");
                    const urlAJAX = "https://viacep.com.br/ws/" + ceplimpo + "/json/"
                    $.ajax({
                        url: urlAJAX,
                        method: "GET",
                        success: function (resp) {
                            
                            console.log(resp);
                            const endereco = resp;

                            const bairro = endereco.bairro;
                            const logradouro = endereco.logradouro;
                            const cidade = endereco.localidade;
                            const estado = endereco.uf;
                            const complemento = endereco.complemento;

                            $("#txtlogradouro").val(logradouro);
                            $("#txtbairro").val(bairro);
                            $("#txtcidade").val(cidade);
                            $("#txtcomplemento").val(complemento);
                            $("#sltestado").val(estado);
                            

                        },
                        error: function (err) {
                            alert("Erro ao buscar o CEP" + err.toString());
                        }
                    });
                });
            
            
            
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
            $("#txtcep").on("click", function (e) {
                $("#txtcep").mask("00.000-000");
            });
        });
    </script>
</body>
</html>
