<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Codigo PHP</title>
<?php
$nombre = $_POST['nombre'];
$mail = $_POST['mail'];
$pais = $_POST['pais'];
$ciudad = $_POST['ciudad'];
$header = 'From: ' . $mail . " \r\n";
$header .= "X-Mailer: PHP/" . phpversion() . " \r\n";
$header .= "Mime-Version: 1.0 \r\n";
$header .= "Content-Type: text/plain";
$mensaje = "Este mensaje fue enviado por " . $nombre . ", del pais " . $pais . ", de la ciudad " . $ciudad . " \r\n";
$mensaje .= "Su e-mail es: " . $mail . " \r\n";
$mensaje .= "Mensaje: " . $_POST['mensaje'] . " \r\n";
$mensaje .= "Enviado el " . date('d/m/Y', time());
$para = 'lawebdecarlos@yahoo.es';
$asunto = 'Mensaje de la pagina web';
mail($para, $asunto, utf8_decode($mensaje), $header); 
?>
<style type="text/css">
<!--
.Estilo3 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: xx-large;
	color: #666666;
	font-weight: bold;
}
a:link {
	color: #FFFFFF;
	text-decoration: none;
}
a:visited {
	color: #FFFFFF;
	text-decoration: none;
}
a:hover {
	color: #006600;
	text-decoration: underline;
}
a:active {
	color: #FFFFFF;
	text-decoration: none;
}
body {
	background-image: url();
	background-color: #99CC66;
}
.Estilo4 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: x-small;
}
-->
</style></head>

<body>
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="right">
      <p align="center" class="Estilo4">EL CORREO CON EL MENSAJE SE HA ENVIADO A LA CUENTA DE CORREO ELECTRONICO ESPECIFICADA EN EL CODIGO INSERTADO EN ESTA P&Aacute;GINA </p>
      </div></td>
  </tr>
  <tr>
    <td height="39"><div align="center"></div></td>
  </tr>
  <tr>
    <td><a href="http://eng.dolcegabbana.it/sfilatadeg07/sfilata.asp?sec=woman&amp;id=news210508" target="_blank"></a></td>
  </tr>
  <tr>
    <td><div align="center"><span class="Estilo3"><a href="formulario.html" target="_self">volver</a></span></div></td>
  </tr>
</table>
</body>
</html>
