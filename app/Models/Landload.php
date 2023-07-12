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
            } else {
                House::where([
                    'landload_id' => $m->id
                ])->update([
                    'landload_id' => 1
                ]);
                Room::where([
                    'landload_id' => $m->id
                ])->update([
                    'landload_id' => 1
                ]);
                LandloadPayment::where([
                    'landload_id' => $m->id
                ])->update([
                    'landload_id' => 1
                ]);
            }
        });
    }


    public function update_balance()
    {
        $this->balance = $this->rentings->sum('landlord_amount') - $this->payments->sum('amount');
        if ($this->balance < 1) {
            $this->fully_paid = 'Yes';
        } else {
            $this->fully_paid = 'No';
        }
        $this->save();
    }

    public function payments()
    {
        return $this->hasMany(LandloadPayment::class, 'landload_id');
    }
    public function rentings()
    {
        return $this->hasMany(Renting::class, 'landload_id');
    }


    use HasFactory;
    public function houses()
    {
        return $this->hasMany(House::class);
    }
}
