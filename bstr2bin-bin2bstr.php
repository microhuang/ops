<?php

function bin2bstr($input)
// Convert a binary expression (e.g., "100111") into a binary-string
{
  if (!is_string($input)) return null; // Sanity check

  // Pack into a string
  $input = str_split($input, 4);
  $str = '';
  foreach ($input as $v)
  {
      $str .= base_convert($v, 2, 16);
  }

  $str =  pack('H*', $str);

  return $str;
}

function bstr2bin($input,$flag='2')
// Binary representation of a binary-string
{
  if (!is_string($input)) return null; // Sanity check

  // Unpack as a hexadecimal string
  $value = unpack('H*', $input);

  // Output binary representation
  $value = str_split($value[1], 1);
  $bin = '';
  foreach ($value as $v)
  {
      $b = str_pad(base_convert($v, 16, 2), 4, '0', STR_PAD_LEFT);
      if($flag=='16')
      {
          $b = dechex(bindec($b));
      }

      $bin .= $b;
  }

  return $bin;
}

//test
$content = file_get_contents('/tmp/test.png');
$content = bstr2bin($content,'16');
//$content = bin2bstr($content);
var_dump($content);exit();
