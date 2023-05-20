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
        self::updated(function ($m) {
            foreach (Landload::all() as $key => $value) {
                $value->balance = LandloadPayment::where('landload_id', $value->id)->sum('amount');
                if ($value->balance < 0) {
                    $value->fully_paid = 'No';
                } else {
                    $value->fully_paid = 'Yes';
                }
                $value->save();
            }
        });
        self::created(function ($m) { 

            foreach (Landload::all() as $key => $value) {
                $value->balance = LandloadPayment::where('landload_id', $value->id)->sum('amount');
                $value->save();
            }

            return $m;
        });
    }
}
