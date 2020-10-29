<?php

$sets = ['set1' => ['a1','a2'], 'set2'=>[] ];
$var = [
    'set1' => $sets['set1'],
    'set2' => $sets['set2'],
];

error_log(print_r($var, TRUE));
error_log("var=" . json_encode($var, JSON_FORCE_OBJECT)); // var={"set1":{"0":"a1","1":"a2"},"set2":{}}
echo               json_encode($var) . "\n";              //     {"set1":["a1","a2"],"set2":[]}

?>
