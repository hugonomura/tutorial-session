<!DOCTYPE html>
<html>
  <head>
    <title>Caronas | Cadastro</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <script src="jquery-1.9.1.min.js"></script>
  </head>
  <body>
    <header class="container">
      <h1 id="logo"><a href="index.jsp">Caronas</a></h1>
      <nav id="menu">
        <ul>
          <li><a href="index.jsp">Inicio</a></li>
          <li><a href="cadastro.jsp" class="active">Cadastro</a></li>
        </ul>
      </nav>
    </header>
    <section class="container">
      <article id="form">
        <header>
          <h1>Cadastro</h1>
        </header>
        <form autocomplete="on" action="CadastraUsuario" method="post">
          <p><span class="rotulo"><label for="username">Nome de usuario</label></span><span class="campo"><input type="text" id="username" name="username"></span></p>
          <p><span class="rotulo"><label for="email">E-mail</label></span><span class="campo"><input type="email" id="email" name="email"></span></p>
          <p><span class="rotulo"><label for="pwd">Senha</label></span><span class="campo"><input type="password" id="pwd" name="senha"></span></p>
          <p><span class="rotulo"><label for="conf-pwd">Confirmar senha</label></span><span class="campo"><input type="password" id="conf-pwd"></span></p>
          <p><span class="rotulo"><label for="dt-nto">Data de nascimento</label></span><span class="campo"><input type="date" id="dt-nto"></span></p>
          <p><span class="rotulo"><label for="masc">Sexo</label></span><span class="campo">
            <input type="radio" name="sexo" value="masc" id="masc" checked><label for="masc">M</label>
            <input type="radio" name="sexo" value="fem" id="fem"><label for="fem">F</label></span></p>
          <p><span class="rotulo"><label for="endereco">Endere�o</label></span><span class="campo"><input type="text" id="endereco"></span></p>
          <p><span class="rotulo"><label for="estado">Estado</label></span><span class="campo">
            <select name="estado" id="estado">
                <option value="" selected></option>
                <option value="RJ">RJ</option>
                <option value="SP">SP</option>
                <option value="SC">SC</option>
            </select>
          </span></p>
          <p><span class="rotulo"><label for="cidade">Cidade</label></span><span class="campo">
            <select name="cidade" id="cidade">
            </select>
          </span></p>
          <p><span class="rotulo"><label for="rota">Rota</label></span><span class="campo">
            <select id="rota">
              <option>Av. General Carneiro</option>
              <option>Av. Armando Pannunzio</option>
              <option>Av. Moreira Cesar</option>
            </select></span></p>
          <p><span class="rotulo"><label for="telefone">Telefone</label></span><span class="campo"><input type="tel" id="telefone"></span></p>
          <p><span id="desc-erro" class="rotulo"></span><span id="erro" class="campo"></span></p>
          <p><input type="submit" id="cadastrar" value="Cadastrar!"></p>
        </form>
      </article>
    </section>
    <footer class="container">
      <p>Desenvolvimento Web - UFSCar Sorocaba - 2013</p>
    </footer>
    <script>
      $(document).ready(function(){
        // permitindo apenas letras minusculas no campo username
        $('#username').keyup(function(){
          var element = $(this);
          var so_letras = /[^a-z]/;
          if(so_letras.test(element.val())){
            $('#desc-erro').fadeIn(1000, function(){
              $(this).html('Erro nome:');
            });
            $('#erro').fadeIn(1000, function(){
              $(this).html('apenas letras min�sculas.');
            });
          }
          var valor = element.val().replace(/[^a-z]/,'');
          element.val(valor);
        });

        // limpando notifica��o do nome
        $('#username').focusout(function(){
          $('#desc-erro').fadeOut(1000, function(){
            $(this).html('');
          });
          $('#erro').fadeOut(1000, function(){
            $(this).html('');
          });
        });

        // verificando se o e-maill � v�lido
        $('#email').focusout(function(){
          var filtro = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
          if(filtro.exec($('#email').val()) === null && $('#email').val()){
            $('#desc-erro').fadeIn(1000, function(){
             $(this).html('Erro e-mail:');
           });
           $('#erro').fadeIn('slow', function(){
             $(this).html('informe e-mail v�lido.');
           });
          }else{
            $('#desc-erro').fadeOut(1000, function(){
              $(this).html('');
            });
            $('#erro').fadeOut(1000, function(){
              $(this).html('');
            });
          }
        });

        // ajax
        $('#estado').change(function(){
          $.ajax({
            type: "GET",
            url: "BuscaCidade",
            dataType: "html",
            data: {uf: $('#estado').val() }
          }).done(function(data){
            $('#cidade').html(data);
          });
        });
      });
    </script>
  </body>
</html>
