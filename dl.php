<?php  
$url=$_POST["url"];
$url='/www/wwwroot/default/dlAll.sh'.' '.(string)$url;
$nameurl='curl'.' '.$_POST["url"].' | grep my_show__name | awk -F ">" \'{ print $2}\'| awk -F "<" \'{print $1}\' >>name.txt';
system($nameurl);
$name=fopen("name.txt","r");
$name=fgets($name);
$name=substr($name,0,strlen($name)-1);
system('rm -f name.txt');
$name=$name.'.tar.gz';
echo $name;
if (file_exists ($name)){
echo "<meta http-equiv=refresh content='0; url=$name'>"; 
} else {
system($url);
echo "<meta http-equiv=refresh content='0; url=$name'>"; 
}
?>
