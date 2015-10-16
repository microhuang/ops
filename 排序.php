<?php

            /*usort($ret,function($a,$b){
                if($a['endTime']==0){
                    return 1;
                }elseif($a['endTime']==$b['endTime']){
                    return 0;
                }
                return $a['endTime']<$b['endTime']?-1:1;
            });*/
            //$byEndTime=array_map(function($element) {return ($element['endTime']==0)?PHP_INT_MAX:$element['endTime'];}, $ret);//array_column
            //$byAmount=array_map(function($element) {return $element['amount'];}, $ret);//array_column
            foreach($ret as $k => $v){
                $byEndTime[$k]=$v['endTime'];
                $byWithdraw[$k]=$v['canWithdraw'];
                $byAmount[$k]=$v['amount'];
            }
            array_multisort($byEndTime,SORT_ASC,$byWithdraw,SORT_ASC,$byAmount,SORT_ASC,$ret);//升序，0最大
