<?php
//restore_error_handler();  //set_error_handler后，display_errors不起作用
//restore_exception_handler();
//error_reporting(E_ALL);
//ini_set('display_errors',1);

function vudate($format, $utimestamp = null)
{
    if (is_null($utimestamp))
        $utimestamp = microtime(true);
    $timestamp = floor($utimestamp);
    $milliseconds = round(($utimestamp - $timestamp) * 1000);
    $microseconds = round(($utimestamp - $timestamp) * 1000000);
    $date = date(preg_replace(array('`(?<!\\\\)v`','`(?<!\\\\)u`'), array($milliseconds,$microseconds), $format), $timestamp);
    return $date;
}

//echo vudate('Y-m-d H:i:s.u',time());
//echo vudate('Y-m-d H:i:s.u',microtime(true));
//echo "\n";exit;
