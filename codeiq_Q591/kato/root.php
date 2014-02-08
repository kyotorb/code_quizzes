<?php
$result = $result_full = $n = null;
function is_result($num)
{
    return count(array_unique(array_slice(str_split($num, 1), 0, 10))) == 10;
}
while (true) {
  $n = isset($n) ? $n + 1 : 1;
  $sqrt = explode('.', strval(sqrt($n)));
  if (count($sqrt) > 1) {
      list($i, $f) = $sqrt;
  } else {
      $i = $sqrt;       // 整数部のみなのでcontinueでも良さそう
      $f = '';
  }

  if (is_null($result) && is_result($f)) {
      $result = $n;
  }
  if (is_null($result_full) && is_result($i.$f)) {
      $result_full = $n;
  }
  if (isset($result) && isset($result_full)) break;
}
echo "only decimal place : {$result} / sqrt=".strval(sqrt($result))."\n";
echo "full number chars  : {$result_full} / sqrt=".strval(sqrt($result_full));

