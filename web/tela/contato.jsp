<%-- 
    Document   : contato.jsp
    Created on : 18/04/2022, 12:29:40
    Author     : cdi
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


            <form action="ClienteServlet" method="POST">

                <h1>Fale conosco</h1> 

               


                <div class="form-group row">
                    <label for="inputnome" class="col-sm-2 col-form-label">Nome</label>
                    <div class="col-sm-7">
                        <input type="text" name="nomerazao" class="form-control" id="inputEmail3">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-6">
                        <input type="text"  name="endereco" class="form-control" id="inputEmail3">
                    </div>
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Telefone</label>
                    <div class="col-sm-2">
                        <input type="text"  name="numero" class="form-control" id="inputEmail3">
                    </div>
                    
                    
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Mensagem</label>
                    <div class="col-sm-20" class="rol-sm-10" ><br/>
                        <input type="text-area"  name="Mensagem" class="form-control2" id="inputEmail3" size="100">
                    </div>
                </div>

                

               
                
                

                    <label for="sltEscolaridade" class="col-sm-2 col-form-label">Assunto:</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="sltEscolaridade" name="uf" placeholder="escolha um assunto">
                            <option value="ES">Elogios </option>
                            <option value="MG">Sugestões </option>
                            <option value="SP">Reclamações </option>
                            <option value="RJ"> Solicitações</option>

                        </select>

                    </div>
                    


                
                
                
                


               
            
            
            
              <button type="submit" class="botaocad">Enviar</button>
            </form 


        </div>









    </div>




    <script type="text/javascript" src="../js/bootstrap.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.mask.js"></script>

</body>
</html>
