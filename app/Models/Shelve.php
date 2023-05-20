<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shelve extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();
        self::creating(function ($m) {
            return Shelve::my_update($m);
        });
        self::updating(function ($m) {
            return Shelve::my_update($m);
        });
    }

    public static function my_update($m)
    {

        $sec = StoreSection::find($m->store_section_id);
        if ($sec == null) {
            throw new Exception("Section not found.", 1);
        }

        $m->store_id = $sec->store_id;

        return $m;
    }
}
