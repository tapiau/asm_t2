<?php
/**
 * Description of Image
 *
 * @author Zbigniew 'zibi' Jarosik <zibi@nora.pl>
 */

class Image_Exception_FormatNotSupported extends Exception {};
class Image_Exception_FileNotFound extends Exception {};
class Image_Exception_NoImageFileDefined extends Exception {};

class Image
{
    /** @var null filename */
    public $file = null;
    public $width;
    public $height;
    public $size;
    /** @var  Resource */
    public $img = null;
    public $quality = 90;

    function __construct($file = null)
    {
        $this->file = $file;

        if(!is_null($this->file))
        {
            $this->load();
        }

        return $this;
    }
    public function copy($file = null)
    {
        $img = clone $this;

        if(!is_null($file))
        {
            $img->file = $file;
        }

        return $img;
    }
    public function load($file = null)
    {
        if(!is_null($file))
        {
            $this->file = $file;
        }

        if(is_null($this->file) || empty($this->file))
        {
            throw new Image_Exception_NoImageFileDefined('No image file defined!');
        }

        if(str_beginswith($this->file,'http://'))
        {
            $this->loadFromHTTP($this->file);
        }
        else
        {
            $this->img = imagecreatefromstring(file_get_contents($this->file));
            $this->size = filesize($this->file);
        }

        if(!is_resource($this->img))
        {
            throw new Exception("Cannot load image: [{$this->file}]");
        }

        $this->makeMeta();

        return $this;
    }
    public function fromString($string)
    {
        $image = new Image();
        $image->img = imagecreatefromstring($string);
        $image->size = strlen($string);

        if(!is_resource($this->img))
        {
            throw new Exception("Cannot load image: [{$this->file}]");
        }

        $image->makeMeta();

        return $image;
    }

    public function makeMeta()
    {
        $this->width = imagesx($this->img);
        $this->height = imagesy($this->img);
        $this->size = strlen($this->toString());

        return $this;
    }

    /**
     * @param $string
     * @return Image
     */
    static function createFromString($string)
    {
        $img = new Image();
        $img->img = imagecreatefromstring($string);
        $img->size = strlen($string);
        $img->makeMeta();

        return $img;
    }

    function resize($dst_x = false, $dst_y = false, $crop = false)
    {
        if(is_null($this->img))
        {
            throw new Exception('Image not loaded!');
        }

        $topsrc_x = 0;
        $topsrc_y = 0;

        if($dst_y === false)
        {
            $dst_y = round($dst_x * $this->height / $this->width);
        }
        elseif($dst_x === false)
        {
            $dst_x = round($dst_y * $this->width / $this->height);
        }

        if($crop)
        {
            if(($this->width / $this->height) > ($dst_x / $dst_y))
            {
                $topsrc_x = round(($this->width - ($this->height * $dst_x / $dst_y)) / 2);
            }
            else
            {
                $topsrc_y = round(($this->height - ($this->width * $dst_y / $dst_x)) / 2);
            }

            if($this->width < $dst_x)
            {
                $dst_x = $this->width;
                $topsrc_x = 0;
            }
            if($this->height < $dst_y)
            {
                $dst_y = $this->height;
                $topsrc_y = 0;
            }
        }
        else
        {
        }

        $dstImage = imagecreatetruecolor($dst_x, $dst_y);
        imagecopyresampled($dstImage, $this->img, 0, 0, $topsrc_x, $topsrc_y, $dst_x, $dst_y, $this->width - ($topsrc_x * 2), $this->height - ($topsrc_y * 2));

        if($dst_x > 300)
        {
            imageinterlace($dstImage, 1);
        }

        $this->img = $dstImage;

        $this->makeMeta();

        return $this;
    }
    public function setQuality($quality)
    {
        $this->quality = $quality;

        return $this;
    }
    public function save($file = null)
    {
        if(!is_null($file))
        {
            $this->file = $file;
        }

        $dir = dirname($this->file);

        if(!file_exists($dir))
        {
            mkdir($dir,0777,true);
        }
        imagejpeg($this->img, $this->file, $this->quality);
        $this->size = filesize($this->file);

        return $this;
    }
    public function saveResized($dst,$width,$height,$crop=false)
    {
        $img = $this->copy($dst);
        $img->resize($width,$height,$crop);
        $img->save();

        return $this;
    }

    function send()
    {
        if($this->img)
        {
            header("Content-type: image/jpeg");
            header("Content-size: ".$this->size);
            header("Content-Disposition: inline; filename=".basename($this->file));
            imagejpeg($this->img, null, $this->quality);
        }
    }
    public function loadFromHTTP($url, $timeout = 5)
    {
        $url = str_replace('?','%3F',$url);
        $ch = curl_init(); // create cURL handle (ch)
        if (!$ch)
        {
            die("Couldn't initialize a cURL handle");
        }

        // set some cURL options
        curl_setopt($ch, CURLOPT_URL,            $url);
        curl_setopt($ch, CURLOPT_HEADER,         false);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT,        2);

        $ret = curl_exec($ch);
        $c = curl_getinfo($ch);

        if($c['http_code'] != 200)
        {
            throw new Image_Exception_FileNotFound($url);
        }
//		$this->mime = $c['content_type'];

        try
        {
            $this->img = imagecreatefromstring($ret);
            $this->size = sizeof($ret);
        }
        catch(Exception $e)
        {
            throw new Image_Exception_FormatNotSupported("File: '{$url}'");
        }

        return $this;
    }
    public function toString()
    {
        ob_start();
        imagejpeg($this->img, null, $this->quality);
        $string = ob_get_contents();
        ob_end_clean();

        return $string;
    }

    public function getRGB($x,$y)
    {
        return RGB::fromRGBPixel(imagecolorat($this->img,$x,$y));
    }
    public function setPixel($x,$y,$colour)
    {
        imagesetpixel($this->img,$x,$y,$colour);

        return $this;
    }
}
