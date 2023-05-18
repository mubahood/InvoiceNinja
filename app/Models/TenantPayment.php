<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TenantPayment extends Model
{
    use HasFactory;
    public function tenant()
    {
        return $this->belongsTo(Tenant::class);
    }
    public static function boot()
    {
        parent::boot();
        self::created(function ($m) {
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

            return $m;
        });
    }
}
