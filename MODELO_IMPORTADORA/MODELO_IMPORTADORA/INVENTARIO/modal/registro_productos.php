	<?php
		if (isset($con))
		{
	?>
	<!-- Modal -->
	<div class="modal fade" id="nuevoProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Agregar nuevo envío</h4>
		  </div>
		  <div class="modal-body">
			<form class="form-horizontal" method="post" id="guardar_producto" name="guardar_producto">
			<div id="resultados_ajax_productos"></div>
			  <div class="form-group">
				<label for="codigo" class="col-sm-3 control-label">* Código</label>
				<div class="col-sm-8">
				  <input type="text" class="form-control" id="codigo" name="codigo" placeholder="Código de identificación" required>
				</div>
			  </div>
			  
			  <div class="form-group">
				<label for="nombre" class="col-sm-3 control-label">* Dirección</label>
				<div class="col-sm-8">
					<textarea class="form-control" id="nombre" name="nombre" placeholder="Nombre del producto" required maxlength="255" ></textarea>
				  
				</div>
			  </div>
			  
			  <div class="form-group">
				<label for="categoria" class="col-sm-3 control-label">* Zonas </label>
				<div class="col-sm-8">
					<select class='form-control' name='categoria' id='categoria' required>
						<option value="">Selecciona una zona</option>
							<?php 
							$query_categoria=mysqli_query($con,"select * from categorias order by nombre_categoria");
							while($rw=mysqli_fetch_array($query_categoria))	{
								?>
							<option value="<?php echo $rw['id_categoria'];?>"><?php echo $rw['nombre_categoria'];?></option>			
								<?php
							}
							?>
					</select>			  
				</div>
			  </div>
			  
			<div class="form-group">
				<label for="precio" class="col-sm-3 control-label">* Precio </label>
				<div class="col-sm-8">
				  <input type="text" class="form-control" id="precio" name="precio" placeholder="Precio de venta del producto" required pattern="^[0-9]{1,5}(\.[0-9]{0,2})?$" title="Ingresa sólo números con 0 ó 2 decimales" maxlength="8">
				</div>
			</div>
			
			<div class="form-group">
				<label for="stock" class="col-sm-3 control-label">* Cantidad </label>
				<div class="col-sm-8">
				  <input type="number" min="0" class="form-control" id="stock" name="stock" placeholder="Inventario inicial" value="1" required  maxlength="8">
				</div>
			</div>
            
            
             <div class="form-group">
				<label for="talle" class="col-sm-3 control-label">* Tipo</label>
				<div class="col-sm-8">
					<select class='form-control' name='talle' id='talle' required>
						<option value="">Selecciona un tipo</option>
							<?php 
							$query_categoria=mysqli_query($con,"select * from talles order by id_talle");
							while($rw=mysqli_fetch_array($query_categoria))	{
								?>
							<option value="<?php echo $rw['id_talle'];?>"><?php echo $rw['nombre_talle'];?></option>			
								<?php
							}
							?>
					</select>			  
				</div>
			  </div>
              
              <div class="form-group">
				<label for="detalle" class="col-sm-3 control-label">Detalle</label>
				<div class="col-sm-8">
					<textarea class="form-control" id="detalle" name="detalle" placeholder="Detalle del producto" maxlength="500" >Sin detalles</textarea>
				  
				</div>
			  </div>
              
              <div class="form-group">
				<label for="modelo" class="col-sm-3 control-label">Horario</label>
				<div class="col-sm-8">
					<textarea class="form-control" id="modelo" name="modelo" placeholder="Observación horario" maxlength="50" >Horario completo</textarea>
				  
				</div>
			  </div>
              
              <div class="form-group">
				<label for="codigo_barras" class="col-sm-3 control-label">Código de Barras</label>
				<div class="col-sm-8">
					<textarea class="form-control" id="codigo_barras" name="codigo_barras" placeholder="Código barras"  maxlength="20" >Código Barras</textarea>
				  
				</div>
			  </div>
			 
             <div class="form-group">
				<label for="img" class="col-sm-3 control-label">Ruta img</label>
				<div class="col-sm-8">
					<textarea class="form-control" id="img" name="img" placeholder="Ruta img" maxlength="500" ></textarea>
				  
				</div>
			  </div>
			 
			
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
			<button type="submit" class="btn btn-primary" id="guardar_datos">Guardar datos</button>
		  </div>
		  </form>
		</div>
	  </div>
	</div>
	<?php
		}
	?>