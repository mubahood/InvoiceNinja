<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Landload extends Model
{
    public static function boot()
    {
        parent::boot();
        self::deleting(function ($m) {
            if ($m->id == 1) {
                throw new Exception("You cannot delete the default landload.", 1);
            }
        });
    }


    use HasFactory;
    public function houses()
    {
        return $this->hasMany(House::class);
    }
}
