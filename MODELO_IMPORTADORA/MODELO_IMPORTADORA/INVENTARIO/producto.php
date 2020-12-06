﻿<?php
	
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: login.php");
		exit;
        }

	/* Connect To Database*/
	require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
	include("funciones.php");
	
	$active_productos="active";
	$active_clientes="";
	$active_usuarios="";	
	$title="Artículos - CADETERÍA";
	
	if (isset($_POST['reference']) and isset($_POST['quantity'])){
		$quantity=intval($_POST['quantity']);
		$reference=mysqli_real_escape_string($con,(strip_tags($_POST["reference"],ENT_QUOTES)));
		$canal='NEW';
		$f_pago='NEW';
		$id_producto=intval($_GET['id']);
		$user_id=$_SESSION['user_id'];
		$firstname='';
		$firstname=$_SESSION['firstname'];
		$codigo_producto= get_row('products','codigo_producto', 'id_producto', $id_producto);
		
		$nota="$firstname agregó $quantity producto(s) al inventario - Ref: $codigo_producto";
		$fecha=date("Y-m-d H:i:s");
		guardar_historial($id_producto,$user_id,$fecha,$nota,$reference,$quantity, $canal, $f_pago);
		$update=agregar_stock($id_producto,$quantity);
		if ($update==1){
			$message=1;
		} else {
			$error=1;
		}
	}
	
	if (isset($_POST['reference_remove']) and isset($_POST['quantity_remove'])){
		$quantity=intval($_POST['quantity_remove']);
		$reference=mysqli_real_escape_string($con,(strip_tags($_POST["reference_remove"],ENT_QUOTES)));
		$canal=mysqli_real_escape_string($con,(strip_tags($_POST["canal_remove"],ENT_QUOTES)));
		$f_pago=mysqli_real_escape_string($con,(strip_tags($_POST["f_pago_remove"],ENT_QUOTES)));
		$id_producto=intval($_GET['id']);
		$user_id=$_SESSION['user_id'];
		$firstname=$_SESSION['firstname'];
		$codigo_producto= get_row('products','codigo_producto', 'id_producto', $id_producto);
		$nota="$firstname eliminó $quantity producto(s) del inventario - Ref: $codigo_producto";
		$fecha=date("Y-m-d H:i:s");
		guardar_historial($id_producto,$user_id, $fecha,$nota,$reference,$quantity, $canal, $f_pago);
		$update=eliminar_stock($id_producto,$quantity);
		if ($update==1){
			$message=1;
		} else {
			$error=1;
		}
	}
	
	if (isset($_GET['id'])){
		$id_producto=intval($_GET['id']);
		$query=mysqli_query($con,"select * from products where id_producto='$id_producto'");
		$row=mysqli_fetch_array($query);
		
	} else {
		die("Producto no existe");
	}
	
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <?php include("head.php");?>
   
  </head>
  <body>
	<?php
	include("navbar.php");
	include("modal/agregar_stock.php");
	include("modal/eliminar_stock.php");
	include("modal/editar_productos.php");
	
	if(empty($row['img'])){
	$img='https://c7cc61b3-a-62cb3a1a-s-sites.googlegroups.com/site/varioscontenidosedicion/foto_imegen_ppal_merks.jpg?attachauth=ANoY7coMO9jY4cgQmQkA3Fq_xVC_xd8MP-WU2RRHTNDjLnvNKNdHPg67eO-FPzOHJEzgxFOm1F8bW5ibZqHjQiVprt1jxN6dnU8adfPj_rGVh9FHo066PuJQ70DtnSmS5tSP_rOxANFXGlEH-6BtRwOzi0nCXUfrtqlV83l1bVEtkKmOfWNQM7-Ib6JbGyDc575wHpb_kkFasvzuV79krrAbFFGk3iVNrSaQfSiQHzqBUcJ-Em9AorvIXa7pPtNCnIe0__vR4bOr&attredirects=0';
	}else{
	$img=$row['img'];
	}
	
	?>
	
	<div class="container">

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-body">
            <div class="row">
              <div class="col-sm-4 col-sm-offset-2 text-center">
				 <!-- IMAGEN INTERNA --><img class="item-img img-responsive" src='<?php echo $img;?>' alt=""> 
				  
                  <?php $talle_name = get_row('talles', 'descripcion_talle', 'id_talle', $row['id_talle']);?>
                  <br>
                    <a href="#" class="btn btn-danger" onclick="eliminar('<?php echo $row['id_producto'];?>')" title="Eliminar"> <i class="glyphicon glyphicon-trash"></i> Eliminar </a> 
					<a href="#myModal2" data-toggle="modal" data-codigo='<?php echo $row['codigo_producto'];?>' 
                    data-nombre='<?php echo $row['nombre_producto'];?>' data-categoria='<?php 
					echo $row['id_categoria']?>' data-precio='<?php echo $row['precio_producto']?>' 
                    data-stock='<?php echo $row['stock'];?>' data-id='<?php echo $row['id_producto'];?>' 
                    data-talle='<?php echo $row['id_talle'];?>' data-modelo='<?php echo $row['modelo'];?>' 
                    data-detalle='<?php echo $row['detalle'];?>' data-codigo_barras='<?php 
					echo $row['codigo_barras'];?>' data-img='<?php echo $row['img'];?>' 
                    class="btn btn-info" title="Editar"> <i class="glyphicon glyphicon-pencil"></i> Editar </a>	
					
              </div>
			  
              <div class="col-sm-4 text-left">
                <div class="row margin-btm-20">
                
                	<!-- NOMBRE PRODUCTO -->
                    <div class="col-sm-12">
                      <span class="item-title"> <?php echo $row['nombre_producto'];?></span>
                    </div>
                    <!-- CÓDIGO PRODUCTO -->
                    <div class="col-sm-12 margin-btm-10">
                      <span class="item-number"><?php echo $row['codigo_producto'];?></span>
                    </div>
                    <div class="col-sm-12 margin-btm-10">
                    </div>
                    
                    <!-- STOCK DISPONIBLE -->
                    <div class="col-sm-12">
                      <span class="current-stock">Estado de pedido</span>
                    </div>
                    <div class="col-sm-12 margin-btm-10">
                      <span class="item-quantity"><?php echo number_format($row['stock'],0);?></span>
                    </div>
                    
                    <!-- PRECIO  -->
					<div class="col-sm-12">
                      <span class="current-stock"> Precio   </span>
                    </div>
					<div class="col-sm-12">
                      <span class="item-price">$ <?php echo number_format($row['precio_producto'],0);?></span>
                    </div>
                    
                    <!-- TALLE  -->
					<div class="col-sm-12">
                      <span class="current-stock"> Tipo  </span>
                    </div>
					<div class="col-sm-12">
                      <span class="item-price"> <?php echo $talle_name;?></span>
                    </div>
                    
                    <!-- DETALLE -->
                    <div class="col-sm-12">
                      <span class="current-stock"> Detalle  </span>
                    </div>
					<div class="col-sm-12">
                      <span class="item-number"> <?php echo $row['detalle'];?></span>
                    </div>
                    <!-- -->
                    
                    <!-- MODELO -->
                    <div class="col-sm-12">
                      <span class="current-stock"> Tipo  </span>
                    </div>
					<div class="col-sm-12">
                      <span class="item-price"> <?php echo $row['modelo'];?></span>
                    </div>
                    <!-- -->
                    
                     <!-- MODELO -->
                    <div class="col-sm-12">
                      <span class="current-stock"> Código Barras  </span>
                    </div>
					<div class="col-sm-12">
                      <span class="item-price"> <?php echo $row['codigo_barras'];?></span>
                    </div>
                    <!-- -->
                    
                     <!-- ruta 
                    <div class="col-sm-12">
                      <span class="current-stock"> Img Ruta </span>
                    </div>
					<div class="col-sm-12">
                      <span class="item-price"> <?php /**echo $row['img'];*/?></span>
                    </div>
                     -->
                    
					
                    <div class="col-sm-12 margin-btm-10">
					</div>
                    <div class="col-sm-6 col-xs-6 col-md-4 ">
                      <a href="" data-toggle="modal" data-target="#add-stock"><img width="100px"  src="img/stock-in.png"></a>
                    </div>
                    <div class="col-sm-6 col-xs-6 col-md-4">
                      <a href="" data-toggle="modal" data-target="#remove-stock"><img width="100px"  src="img/stock-out.png"></a>
                    </div>
                    <div class="col-sm-12 margin-btm-10">
                    </div>
                    
                   
                                    </div>
              </div>
            </div>
            <br>
            <div class="row">

            <div class="col-sm-8 col-sm-offset-2 text-left">
                  <div class="row">
                    <?php
					
					
					
					
					
						if (isset($message)){
							?>
						<div class="alert alert-success alert-dismissible" role="alert">
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						  <strong>Aviso!</strong> Datos procesados exitosamente.
						</div>	
							<?php
						}
						if (isset($error)){
							?>
						<div class="alert alert-danger alert-dismissible" role="alert">
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						  <strong>Error!</strong> No se pudo procesar los datos.
						</div>	
							<?php
						}
					?>	
                    
					 <table class='table table-bordered'>
						<tr class="success">
							<th class='text-center' colspan=5>HISTORIAL DE INVENTARIO</th>
						</tr>
						<tr  class="success">
							<td>Fecha</td>
							<td>Hora</td>
							<td>Descripción</td>
							<td>Referencia</td>
							<td class='text-center'>Total</td>
						</tr>
						<?php
							$query=mysqli_query($con,"select * from historial where id_producto='$id_producto' order by fecha desc");
							while ($row=mysqli_fetch_array($query)){
								?>
						<tr>
							<td><?php echo date('d/m/Y', strtotime($row['fecha']));?></td>
							<td><?php echo date('H:i:s', strtotime($row['fecha']));?></td>
							<td><?php echo $row['nota'];?></td>
							<td><?php echo $row['referencia'];?></td>
							<td class='text-center'><?php echo number_format($row['cantidad'],2);?></td>
						</tr>		
								<?php
							}
						?>
                        <tr>
			
					</tr>
                    
                   
                
                        
					 </table>
                  </div>
                                    
                                    
				</div>
            </div>
          </div>
        </div>
    </div>
</div>



</div>

	
	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/productos.js"></script>
  </body>
</html>
<script>
$( "#editar_producto" ).submit(function( event ) {
  $('#actualizar_datos').attr("disabled", true);
  
 var parametros = $(this).serialize();
	 $.ajax({
			type: "POST",
			url: "ajax/editar_producto.php",
			data: parametros,
			 beforeSend: function(objeto){
				$("#resultados_ajax2").html("Mensaje: Cargando...");
			  },
			success: function(datos){
			$("#resultados_ajax2").html(datos);
			$('#actualizar_datos').attr("disabled", false);
			window.setTimeout(function() {
				$(".alert").fadeTo(500, 0).slideUp(500, function(){
				$(this).remove();});
				location.replace('stock.php');
			}, 4000);
		  }
	});
  event.preventDefault();
})

	$('#myModal2').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var codigo = button.data('codigo') // Extract info from data-* attributes
		var nombre = button.data('nombre')
		var categoria = button.data('categoria')
		var precio = button.data('precio')
		var stock = button.data('stock')
		var id = button.data('id')
		var talle = button.data('talle')
		var modelo = button.data('modelo')
		var detalle = button.data('detalle')
		var codigo_barras = button.data('codigo_barras')
		var img = button.data('img')
		var modal = $(this)
		modal.find('.modal-body #mod_codigo').val(codigo)
		modal.find('.modal-body #mod_nombre').val(nombre)
		modal.find('.modal-body #mod_categoria').val(categoria)
		modal.find('.modal-body #mod_precio').val(precio)
		modal.find('.modal-body #mod_stock').val(stock)
		modal.find('.modal-body #mod_id').val(id)
		modal.find('.modal-body #mod_talle').val(talle)
		modal.find('.modal-body #mod_modelo').val(modelo)
		modal.find('.modal-body #mod_detalle').val(detalle)
		modal.find('.modal-body #mod_codigo_barras').val(codigo_barras)
		modal.find('.modal-body #mod_img').val(img)
	})
	
	function eliminar (id){
		var q= $("#q").val();
		if (confirm("Realmente deseas eliminar el producto")){	
			location.replace('stock.php?delete='+id);
		}
	}
</script>