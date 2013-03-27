<?php
$host="localhost"; // Host name 
$username="rahman"; // Mysql username 
$password="653201"; // Mysql password 
$db_name="s_market"; // Database name 
$tbl_name="users"; // Table name

mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

//barcode and name sent from the form
$barcode = $_POST['barcode'];
$name = $_POST['name'];

// To protect MySQL injection (more detail about MySQL injection)
$barcode = stripslashes($barcode);
$name = stripslashes($name);
$barcode = mysql_real_escape_string($barcode);
$name = mysql_real_escape_string($name);

$sql="SELECT  `good_list` . * ,  `goods_in_stock` . * 
FROM good_list, goods_in_stock
WHERE (`goods_in_stock`.`barcode` =  `good_list`.`barcode` AND `goods_in_stock`.`barcode` =  '$barcode')
OR (`goods_in_stock`.`barcode` =  `good_list`.`barcode` AND `good_list`.`name` = '$name')
";


$result = mysql_query($sql);
if($result=== FALSE) {echo "query faild";}
else{echo "query succeed";}

$count=mysql_num_rows($result);
$row=mysql_fetch_assoc($result);

$price=$row['out_price'];
//echo $price;
$discount=$row['discount'];
//echo $discount;
$amount=$row['amount'];
//echo $amount;
$final_price=$price*$discount;
$name=$row['name'];


if($count==1&& $amount>=1){
if($amount>=1)header("location:cashier_sell_suc.php?id=".$row['barcode']);}
else {
if( $amount<1){echo"您所要的商品已售完";}
else{echo"找不到您所输入的商品";}
}