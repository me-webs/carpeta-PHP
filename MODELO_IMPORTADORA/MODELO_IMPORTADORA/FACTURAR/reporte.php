<?php
	
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: login.php");
		exit;
        }
	
	/* Connect To Database*/
	require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
	
	$active_facturas="";
	$active_productos="";
	$active_clientes="";
	$active_usuarios="";	
	$active_reporte="active";
	$title="Reporte | CADETERÍA";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <?php include("head.php");?>
  </head>
  <body>
	<?php
	include("navbar.php");
	?>

<div class="container">
	<div class="panel panel-info">

	<div class="table-responsive">

	<h4><i class='glyphicon glyphicon-search'></i> Reporte Ventas</h4>

		

		<table class="table">
				<tr  class="info">
					<th>Año</th>
					<th>Mes</th>
					<th>Cantidad</th>
					<th>Monto $UY</th>
				</tr>
	<tr><td>

	<?php

    $query=mysqli_query($con, "select YEAR(fecha_factura), MONTH(fecha_factura), COUNT(id_factura), SUM(total_venta) 
    	FROM facturas WHERE fecha_factura BETWEEN '2018-01-01 00:00:00.000' AND '2100-12-31 00:00:00.000' GROUP BY MONTH(fecha_factura) ORDER BY YEAR(fecha_factura) DESC, MONTH(fecha_factura) DESC");
    
    while($fila=mysqli_fetch_row($query)){
    	echo " </td><tr><th> ";
    	echo round($fila[0],0) . "</th><th>";
    	
        if( round($fila[1],0)==1){
        echo "Enero" . "</th><th>";
        }if( round($fila[1],0)==2){
        echo "Febrero" . "</th><th>";
        }if( round($fila[1],0)==3){
        echo "Marzo" . "</th><th>";
        }if( round($fila[1],0)==4){
        echo "Abril" . "</th><th>";
        }if( round($fila[1],0)==5){
        echo "Mayo" . "</th><th>";
        }if( round($fila[1],0)==6){
        echo "Junio" . "</th><th>";
        }if( round($fila[1],0)==7){
        echo "Julio" . "</th><th>";
        }if( round($fila[1],0)==8){
        echo "Agosto" . "</th><th>";
        }if( round($fila[1],0)==9){
        echo "Septiembre" . "</th><th>";
        }if( round($fila[1],0)==10){
        echo "Octubre" . "</th><th>";
        }if( round($fila[1],0)==11){
        echo "Noviembre" . "</th><th>";
        }if( round($fila[1],0)==12){
        echo "Diciembre" . "</th><th>";
        }

    	echo round($fila[2],0) . "</th><th> $ ";
    	echo round($fila[3],0) . "</th><th>";
    	
    	echo " </th> </tr>";
    	}


    	$resultado=mysqli_query($con, "select YEAR(fecha_factura),  COUNT(id_factura), SUM(total_venta) 
    	FROM facturas WHERE fecha_factura BETWEEN '2020-01-01 00:00:00.000' AND '2100-12-31 00:00:00.000' ");

    	while($fila=mysqli_fetch_row($resultado)){
    	echo "<br>";
    	echo " </td><tr class='info'><th> ";
    	echo " Total Gestión :" . "</th><th>";
    	echo " " . "</th><th>";
    	echo round($fila[1],0) . "</th><th> $ ";
    	echo round($fila[2],0) . "</th><th>";
    	
    	echo " </tr> ";
    	}

    	/*$resultado=mysqli_query($con, "select YEAR(fecha_factura),  COUNT(id_factura), SUM(total_venta) 
    	FROM facturas WHERE fecha_factura BETWEEN '2018-01-01 00:00:00.000' AND '2018-12-31 00:00:00.000' ");

    	while($fila=mysqli_fetch_row($resultado)){
    	echo "<br>";
    	echo " </td><tr class='info'><th> ";
    	echo " Total recaudado en el año 2018 :" . "</th><th>";
    	echo " " . "</th><th>";
    	echo $fila[1] . "</th><th> $ ";
    	echo $fila[2] . "</th><th>";
    	
    	echo " </tr> ";
    	}*/


   			?>
   			
   		
	

	</div></div></div>
	</tr></table>

	<?php
	echo " <br><br><br> ";

	include("footer.php");
	?>
	<script type="text/javascript" src="js/reporte.js"></script>
  </body>
</html>