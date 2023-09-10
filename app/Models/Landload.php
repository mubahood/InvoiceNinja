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

        $payable_amount = 0;
        $paid_amount = 0;
        $balance = 0;
        foreach ($this->rentings as $renting) {
            if ($renting->payments != null) {
                $payable_amount += $renting->payments->sum('landlord_amount');
            }
        }
        foreach ($this->payments as $payment) {
            $paid_amount += $payment->amount;
        }
        $balance = $payable_amount - $paid_amount;
        if ($balance < 1) {
            $this->fully_paid = 'Yes';
        } else {
            $this->fully_paid = 'No';
        }
        $this->payable_amount = $payable_amount;
        $this->paid_amount = $paid_amount;
        $this->balance = $balance;
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
