<?php
/**
 * Created by PhpStorm.
 * User: goha
 * Date: 11.11.2018
 * Time: 01:29
 */

require_once __DIR__.'/src/func.php';

$fileName = '../unicorn2.png';

$img = imagecreatefrompng($fileName);

$xMax = imagesx($img);
$yMax = imagesy($img);

$charData = [];
$charMap = [];

$color = imagecolorallocate($img,255,0,0);

for($y=0;$y<$yMax;$y++)
{
    imageline($img,0,$y*8,0,$y*8,$color);
    for($x=0;$x<$xMax;$x++)
    {
        imageline($img,$x*8,0,$x*8,191,$color);
        for($byte=0;$byte<8;$byte++)
        {
            $data = '';
            for($pixel=0;$pixel<8;$pixel++)
            {
                $xPoint = $x*8+$pixel;
                $yPoint = $y*8+$byte;

                printr("{$xPoint}x{$yPoint}:".imagecolorat($img,$xPoint,$yPoint));
//                $data = ($data<<1) + imagecolorat($img,$xPoint,$yPoint);
                $data .= imagecolorat($img,$xPoint,$yPoint)!=0?'1':'0';
            }

            $charData[$y][$x][$byte] = $data;
        }

        $char = join(',',$charData[$y][$x]);

        $charMap[md5($char)] = $char;
        $charData[$y][$x] = $char;
    }
}

printr($charMap);
printr(count($charMap));


$color = imagecolorallocate($img,255,0,0);

for($y=0;$y<$yMax;$y++)
{
    imageline($img,0,$y*8,255,$y*8,$color);
}
for($x=0;$x<$xMax;$x++)
{
    imageline($img,$x*8,0,$x*8,191,$color);
}


imageline($img,8,0,8,191,$color);

imagepng($img,'../aa.png');
