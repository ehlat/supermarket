<meta http-equiv="refresh" content="7;url=cashier_return.php">
<?php
$price=$_POST['price'];
$barcode=$_POST['barcode'];
$j=0;

$host="localhost";
$username="rahman";
$password="653201";
$db_name="s_market";

mysql_connect("$host", "$username", "$password")or die("cannot connect to the DB");
mysql_select_db("$db_name")or dir("connot select DB");
mysql_query("set names utf8");

$sql="SELECT * FROM `s_market`.`record` WHERE `record`.`barcode` = '$barcode' AND `record`.`out_price`='$price'";
$res=mysql_query($sql);
$count = mysql_num_rows($res);
while($row=mysql_fetch_assoc($res)){
$dis = $row['dis'];}


if($count>=1)
{
// Code inside if block if userid is already there

$sql="DELETE FROM `s_market`.`record` WHERE `record`.`barcode` = '$barcode' AND `record`.`out_price`='$price' AND `record`.`dis`= '$dis';";
$result = mysql_query($sql);
if($result == FALSE) echo 'query faild1';


$sql="UPDATE `goods_in_stock` 
SET `goods_in_stock`.`amount`=`goods_in_stock`.`amount` + 1  
WHERE `goods_in_stock`.`barcode` = '$barcode' 
AND `goods_in_stock`.`out_price` = '$price';";


$resul = mysql_query($sql);
if($resul == FALSE) {echo 'query faild2';}
echo '<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><center><h1>清楚销售记录成功！</h1></center>';
echo 
'<form name="tiaozhuan" action="cashier_return.php">
<center><input type="submit" value="快速跳转"></center>
</form>';
}
else
{
echo '<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><center><h1>对不起，没有这笔买卖记录，不能退换！</h1></center>';
echo 
'<form name="tiaozhuan" action="cashier_return.php">
<center><input type="submit" value="快速跳转"></center>
</form>';
}
//header("location:header"location:cashier_login.php");





?>