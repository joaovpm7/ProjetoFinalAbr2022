<%-- 
    Document   : cadastrar2.jsp
    Created on : 16/04/2022, 18:52:18
    Author     : Paulo Henrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


            <form>
                
                <%
                        Object iduser = (request.getAttribute("bananauser") != null) ? 
                                request.getAttribute("bananauser") : "0";
                        
                        %>

                        <input type="hidden" name="cadastrar" value="1"/>
                        <input type="hidden" name="id" value="<% out.print(iduser.toString()); %>"/>  




                <table cellpadding="20px" cellspacing="4">

                    <tr>
                        <td><h1>Cadastro de pontos de coleta</h1> </td> <br/>

                    <tr>   

                    <tr>
                        <td><h3>Cadastro de dados</h3> </td>
                        <td><h4>Selecione um ou mais itens abaixo</h4> </td>
                      </tr>  
                </table>

                <div class="container2">
                    <button id="a">
                        <a href="">
                            <img src="../img/plastico.png" alt="">
                        </a>
                    </button>
                    
                    <button id="b">
                        <a href="">
                            <img src="../img/vidro.png" alt="">
                        </a>
                    </button>
                    
                    <button id="c">
                        <a href="">
                            <img src="../img/metal.png" alt="">
                        </a>
                    </button>
                    
                    
                    <button id="g">
                        <a href="">
                            <img src="../img/radioativo.png" alt="" id="azul">
                        </a>
                    </button>
                    
                    <button id="h">
                        <a href="">
                            <img src="../img/oleodecozinha.png" alt="" id="azul">
                        </a>
                    </button>


                    <br>

                   


                    <button id="e">
                        <a href="">
                            <img src="../img/madeira.png" alt="">
                        </a>
                    </button>


                    <button id="j">
                        <a href="">
                            <img src="../img/perigoso.png" alt="">
                        </a>
                    </button>
                    
                    
                    <button id="i">
                        <a href="">
                            <img src="../img/naoreciclados.png" alt="">
                        </a>
                    </button>


                </div>
                <br><br>

                <button type="submit" class="botaocad">Concluir cadastro</button>
            </form 


        </div>









    </div>




    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.mask.js"></script>

</body>
</html>
