<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LandloadPayment extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();
        self::creating(function ($m) {

            return $m;
        });
        self::updated(function ($m) {
            $m->landload->update_balance();
        });
        self::created(function ($m) {
            $m->landload->update_balance();
        });
    }

    public function landload()
    {
        return $this->belongsTo(Landload::class);
    }
}
