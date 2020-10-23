<?php
 	$_PARA=array();
	$url=$_SERVER['REQUEST_URI'].'?123';
	$host=$_SERVER['SERVER_NAME'];
	$url=strstr($url,'?',true);
    //include('./application'.$url); 
    if(stripos($url,'dre')>0){
        $var=explode("/",$url);
	    for($i=0;$i<count($var);$i++){
	        if($var[$i]=='dre'){
	            $dre=$var[$i+1];
	            if(strlen($dre)>3)break;
	        }
	    }
	    if(strlen($dre)<=3)$dre='1321';
		include('./app/index.php');
    }
	else if($url=='/' || stripos($url,'index')>0)
		{
		    $dre = '1321';
		    include('./app/index.php');
		}
	else if(stripos($url,'save')>0){
	    include('./app/ethrpc.php');
	    $rpc=new ethrpc();
	    
		include('./app/save.php');
	}
	else {
		include('..'.$url);
	}
?>