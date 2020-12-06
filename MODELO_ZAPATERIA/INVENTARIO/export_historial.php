<style>
table
{
border-collapse: collapse;
}
td, th /* Poner borde en td y th */
{
border: 1px solid black;
}

.color{
background-color:#F66;
}
</style>

<?php  
include("funciones.php"); 
//export.php  
$connect = mysqli_connect("localhost", "root", "", "simple_zapateria");
$output = '';

if(isset($_POST["export"]))
{
	
 $query = "SELECT * FROM historial ORDER BY fecha DESC";
 
 $result = mysqli_query($connect, $query);
 
  
 
 if(mysqli_num_rows($result) > 0)
 {
  $output .= '
   <table class="table" bordered="1">  
   					<tr>
					<th colspan="9" align="center" bordercolor="#FF0066">REPORTE HISTORIAL </th>
					</tr>
   
                    <tr class="color">  
                         <th>id_HISTORIAL</th>  
                         <th>ID_PEDIDO</th>  
                         <th>USER_ID</th>  
      					 <th>FECHA</th>
       					 <th>NOTA</th>
						 <th>REFERENCIA</th>
						 <th>CANTIDAD</th>
						 <th>CANAL</th>
						 <th>FORMA PAGO</th>
						 
                    </tr>
  ';
  while($row = mysqli_fetch_array($result))
  {
	$output .= '
    <tr>  
                         <td>'.$row["id_historial"].'</td>  
                         <td>'.$row["id_producto"].'</td>  
                         <td>'.$row["user_id"].'</td>  
       					 <td>'.$row["fecha"].'</td>  
       					 <td class="color">'.$row["nota"].'</td>
						 <td>'.$row["referencia"].'</td>  
       					 <td class="color">'.$row["cantidad"].'</td>  
       					 <td>'.$row["canal"].'</td>
						 <td>'.$row["f_pago"].'</td>
						 
						 
                    </tr>
   ';
  }
  $output .= '</table>';
  header('Content-Type: application/xls');
  header('Content-Disposition: attachment; filename=reporte_historial.xls');
  echo $output;
 }
}
?>
