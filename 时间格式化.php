<?php
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
