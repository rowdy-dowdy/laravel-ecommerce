<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Banner extends Model
{
  public function getImage($default = '') {
    if (!empty($this->image)) {
      return str_replace('\\', '/', Storage::disk(config('voyager.storage.disk'))->url($this->image));
    }
    return $default;
  }
}
