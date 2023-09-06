<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TenantPayment extends Model
{
    use HasFactory;
    public function process_balance($m)
    {
        $rent = Renting::find($m->renting_id);
        if ($rent == null) {
            throw new Exception("Invoice not found.", 1);
        }

        $rent->balance += $m->amount;
        if ($rent->balance > -1) {
            $rent->fully_paid = 'Yes';
        } else {
            $rent->fully_paid = 'No';
        }
        $rent->save();
        $m->tenant->update_balance();
    }
    public function tenant()
    {
        return $this->belongsTo(Tenant::class);
    }
    public function renting()
    {
        return $this->belongsTo(Renting::class);
    }
    public static function boot()
    {
        parent::boot();
        self::created(function ($m) {

            $m->process_balance($m);

            return $m;
        });
        self::updated(function ($m) {

            $m->process_balance($m);

            return $m;
        });
        self::creating(function ($m) {
            $rent = Renting::find($m->renting_id);
            if ($rent == null) {
                throw new Exception("Invoice not found.", 1);
            }

            $rent->balance += $m->amount;
            $m->tenant_id = $rent->tenant_id;
            $m->balance = $rent->balance;
            $stat_rent = Utils::my_date($rent->start_date);
            $end_rent = Utils::my_date($rent->end_date);
            $m->details = "Cash received from {$rent->tenant->name} being payment of rent of
             {$rent->number_of_months} months from {$stat_rent} to {$end_rent}. 
             Invoice no. #{$rent->id}.";

            self::process_commission($m);
            return $m;
        });
    }

    public static function process_commission($m)
    {
        $room_id = Renting::find($m->renting_id)->value('room_id');
        
        $room = Room::find($room_id);
        if ($room == null) {
            throw new Exception("House not found while billing.", 1);
        }

        if ($room->commission_type == 1) {
            $m->commission_type = 'Flat Rate';
            $m->commission_type_value = $room->flate_rate_amount;
            $m->commission_amount = $room->flate_rate_amount * $m->number_of_months;
        } else {
            $m->commission_type = 'Percentage';
            $m->commission_type_value = $room->percentage_rate;
            $m->commission_amount = ($room->percentage_rate / 100) * ($m->amount * $m->months);
        
        }

        $m->landlord_amount = ($m->amount * $m->months) - (($room->percentage_rate / 100) * ($m->amount * $m->months));
        error_log($m->landlord_amount);
      
    }

}
