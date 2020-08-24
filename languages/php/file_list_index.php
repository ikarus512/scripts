<?php
### List all files recoursively.

echo "<h4>index (/var/www/index.php)</h4>\n";
echo_all_files('/var/www');


function echo_all_files($prefix, $dir = '') {
#    echo "### echo_all_files($prefix $dir)<br>\n";
    $items = scandir($prefix . $dir, SCANDIR_SORT_ASCENDING); # print_r($items);echo "<br>\n";
    $files = [];   foreach ($items as $item) if (is_file($prefix.$dir.'/'.$item)) array_push($files, $item); # echo ' &nbsp; files=' . implode(', ', $files) . "<br>\n";
    $subdirs = []; foreach ($items as $item) if (is_dir($prefix.$dir.'/'.$item) && !in_array($item, ['.', '..'])) array_push($subdirs, $item); # echo ' &nbsp; subdirs=' . implode(', ', $subdirs) . "<br>\n";
    foreach ($subdirs as $subdir) echo_all_files($prefix, $dir . '/' . $subdir);
    echo "<br>\n";
    foreach ($files as $file) echo "<a href=$dir/$file>$dir/$file</a>" . filesz($prefix.$dir.'/'.$file) . "<br>\n";
}

function filesz($file) {
     $n = filesize($file);
     if     ($n >= 1e9) return ' (' . strval(intval($n / 1e9, 2)) . ' GB)';
     elseif ($n >= 1e6) return ' (' . strval(intval($n / 1e6, 2)) . ' MB)';
     elseif ($n >= 1e3) return ' (' . strval(intval($n / 1e3, 2)) . ' KB)';
     else               return ' (' . strval($n)                  . ' B)';
}
?>
