<?php

namespace App\Models;

use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Product extends Model
{
  protected static function boot()
  {
    parent::boot();

    static::addGlobalScope('age', function (Builder $builder) {
      $builder->where('status', 1);
    });
  }

  public function collections () {
    return $this->belongsToMany(Collection::class);
  }

  public function getUrl($default = '') {
    if (!empty($this->slug)) {
      return route('product', $this->slug);
    }
    return $default;
  }

  public function getImage($default = '') {
    if (!empty($this->image)) {
      return str_replace('\\', '/', Storage::disk(config('voyager.storage.disk'))->url($this->image));
    }
    else if (!empty($this->images) && is_array($this->images) && count($this->images)) {
      return str_replace('\\', '/', Storage::disk(config('voyager.storage.disk'))->url($this->images[0]));
    }
    return $default;
  }

  public function getImages() {
    $images = [];
    if (!empty($this->images) && is_array($this->images)) {
      foreach ($this->images as $key => $value) {
        array_push($images, str_replace('\\', '/', Storage::disk(config('voyager.storage.disk'))->url($value)));
      }
    }
    return $images;
  }

  public function getCollection() {
    if (count($this->collections) > 0) {
      return $this->collections[0];
    }
    return null;
  }
}
