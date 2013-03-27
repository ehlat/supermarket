<html>
<body>
<?php
$host="localhost";
$username="rahman";
$password="653201";
$db_name="s_market";

mysql_connect("$host", "$username", "$password")or die("cannot connect to the DB");
mysql_select_db("$db_name")or dir("connot select DB");
mysql_query("set names utf8");

$sql="SELECT `good_list`.`barcode` FROM `good_list` ";
$result1=mysql_query($sql);
if($result1 == FALSE) echo 'query faild';
//调出good_list中的所有rate里面没有商品


while($row=mysql_fetch_assoc($result1))
{
$barcode=$row['barcode'];

if(mysql_num_rows(mysql_query("SELECT `rate`.`barcode` FROM `rate` WHERE `rate`.`barcode` = '$barcode'"))==0)
{echo $barcode . '<br />';
$sql="INSERT INTO `rate`(`barcode`, `count`) VALUES ('$barcode',0);";
$result2=mysql_query($sql);
if($result2 == FALSE) echo 'query faild2';
}
}//把调出来的商品放到rate中

$sql="SELECT `record`.`barcode` FROM `record` WHERE 1";
$result3=mysql_query($sql);
if($result3 == FALSE) echo 'query faild3';
//record中的data调出来，与rate配对

while($row=mysql_fetch_assoc($result3))
{
$barcode=$row['barcode'];
if(mysql_num_rows(mysql_query("SELECT * FROM `rate` WHERE `rate`.`barcode` = '$barcode'"))>=1)
{
$sql="UPDATE `rate` SET `count`=`count`+1 WHERE `rate`.`barcode` = '$barcode'";
$result4=mysql_query($sql);
if($result4 == FALSE) echo 'query faild4';
}
}
//算出count的值


echo '<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><center><h1>排行榜更新成功！</h1></center>';
echo 
'<form name="tiaozhuan" action="cashier_login.php">
<center><input type="submit" value="跳转回销售模式"></center>
</form>';
?>

</body>
</html>