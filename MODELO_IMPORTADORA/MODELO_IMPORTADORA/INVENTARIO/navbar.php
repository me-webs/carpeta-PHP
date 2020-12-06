﻿	<?php
		if (isset($title))
		{
	?>
<nav class="navbar navbar-default ">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <img src="img/gif/ejemploGif3.gif" class="navbar-header" class='responsive' style="width:100%;"/></img><br />
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Cadetería</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="<?php if (isset($active_productos)){echo $active_productos;}?>"><a href="stock.php"><i class='glyphicon glyphicon-barcode'></i> Inventario</a></li>
		<li class="<?php if (isset($active_categoria)){echo $active_categoria;}?>"><a href="categorias.php"><i class='glyphicon glyphicon-tags'></i> Zonas</a></li>
        <li class="<?php if (isset($active_talle)){echo $active_talle;}?>"><a href="talles.php"><i class='glyphicon glyphicon-tags'></i> Tipos</a></li>
		<li class="<?php if (isset($active_usuarios)){echo $active_usuarios;}?>"><a href="usuarios.php"><i  class='glyphicon glyphicon-user'></i> Usuarios</a></li>

		<li class="<?php if (isset($active_historial)){echo $active_historial;}?>"><a href="historial.php"><i  class='glyphicon glyphicon-user'></i> Historial</a></li>
        <li class="<?php if (isset($active_factura)){echo $active_factura;}?>"><a href="../FACTURAR/index.php"><i  class='glyphicon glyphicon-list-alt'></i> Facturación</a></li>
       </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="https://api.whatsapp.com/send?phone=59891074131" target='_blank'><i class='glyphicon glyphicon-envelope'></i> Soporte</a></li>
		<li><a href="login.php?logout"><i class='glyphicon glyphicon-off'></i> Salir</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	<?php
		}
	?>