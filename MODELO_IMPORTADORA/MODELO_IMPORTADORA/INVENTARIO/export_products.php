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
$connect = mysqli_connect("localhost", "root", "", "simple_stock");
$output = '';


if(isset($_POST["export"]))
{
	
 $query = "SELECT * FROM products ORDER BY id_categoria DESC";
 
 $result = mysqli_query($connect, $query);
 
 if(mysqli_num_rows($result) > 0)
 {
  $output .= '
   <table class="table" bordered="1">  
   
   					<tr>
					<th colspan="9" align="center" bordercolor="#FF0066">REPORTE FACTURAS </th>
					</tr>
   
                    <tr class="color">  
                         <th>ID_PEDIDO</th>  
                         <th class="color">CODIGO_PEDIDO</th>  
                         <th>DIRECCIÓN_PEDIDO</th>  
      					 <th>DATE_ADDED</th>
       					 <th>PRECIO_PEDIDO</th>
						 <th class="color">GESTIONADO</th>
						 <th>ID_ZONAS</th>
						 <th>ID_TIPO</th>
						 <th>MODELO</th>
						 <th>DETALLE</th>
						 <th>CODIGO_BARRAS</th>
						 <th>IMG</th>
						 <th>ID_ESTADO</th>
						 
                    </tr>
  ';
  while($row = mysqli_fetch_array($result))
  {
	$output .= '
    <tr>  
                         <td>'.$row["id_producto"].'</td>  
                         <td class="color">'.$row["codigo_producto"].'</td>  
                         <td>'.$row["nombre_producto"].'</td>  
       					 <td>'.$row["date_added"].'</td>  
       					 <td>'.$row["precio_producto"].'</td>
						 <td class="color">'.$row["stock"].'</td>  
       					 <td>'.$row["id_categoria"].'</td>  
       					 <td>'.$row["id_talle"].'</td>
						 <td>'.$row["modelo"].'</td>
						 <td>'.$row["detalle"].'</td>  
       					 <td>'.$row["codigo_barras"].'</td>
						 <td>'.$row["img"].'</td>
						 <td>'.$row["id_estado"].'</td>
						 
						 
                    </tr>
   ';
  }
  $output .= '</table>';
  header('Content-Type: application/xls');
  header('Content-Disposition: attachment; filename=reporte_productos.xls');
  echo $output;
 }
}
?>
