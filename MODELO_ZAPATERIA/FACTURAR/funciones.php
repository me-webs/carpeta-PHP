
<?php 

function get_row($table,$row, $id, $equal){
	global $con;
	$query=mysqli_query($con,"select $row from $table where $id='$equal'");
	$rw=mysqli_fetch_array($query);
	$value=$rw[$row];
	return $value;
}

function guardar_historial($id_producto,$user_id,$fecha,$nota,$reference,$quantity, $canal){
	global $con;
	$sql="INSERT INTO historial (id_historial, id_producto, user_id, fecha, nota, referencia, cantidad, canal)
	VALUES (NULL, '$id_producto', '$user_id', '$fecha', '$nota', '$reference', '$quantity', '$canal');";
	$query=mysqli_query($con,$sql);
	
	
}
?>