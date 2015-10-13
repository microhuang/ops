<?php
/*
 * 以相同概率从n长度集合中有序输出m个结果
 */
function genknuth($m,$n){
        for($i=0;$i<$n;$i++){
                if(rand()%($n-$i)<$m){
                        echo $i;
                        $m--;
                }
        }
}

genknuth(2,5);
