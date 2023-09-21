<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

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
            $landlord = Landload::find($m->landload_id);
            if ($landlord == null) {
                throw new Exception("Landlord not found.", 1);
            }

            $total_paid = $m->renting->payments->sum('amount');
            $balance =  $total_paid - $m->renting->payable_amount;
            $m->renting->balance = $balance;
            $m->renting->save();
            DB::table('tenant_payments')->where('id', $m->id)->update(['balance' => $balance]);

            $landlord->update_balance();
            return $m;
        });
        self::updated(function ($m) {
            $m->process_balance($m);
            $landlord = Landload::find($m->landload_id);
            if ($landlord == null) {
                throw new Exception("Landlord not found.", 1);
            }

            $total_paid = $m->renting->payments->sum('amount');
            $balance = $m->renting->payable_amount - $total_paid;
            $balance =  $total_paid - $m->renting->payable_amount;
            $m->renting->save();
            DB::table('tenant_payments')->where('id', $m->id)->update(['balance' => $balance]);


            $landlord->update_balance();
            return $m;
        });
        self::deleted(function ($m) {
            try {
                $landlord = Landload::find($m->landload_id);
                if ($landlord != null) {
                    $landlord->update_balance();
                }
            } catch (\Throwable $th) {
                //throw $th;
            }

            return $m;
        });
        self::updating(function ($m) {
            $m = self::process_commission($m);
            return $m;
        });

        self::creating(function ($m) {
            $rent = Renting::find($m->renting_id);
            if ($rent == null) {
                $m->delete();
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

            $m = self::process_commission($m);
            return $m;
        });
    }

    public function landlord()
    {
        return $this->belongsTo(Landload::class, 'landload_id');
    }

    public static function process_commission($m)
    {

        $rent = Renting::find($m->renting_id);

        if ($rent == null) {
            throw new Exception("Invoice not found.", 1);
        }
        $room_id = $rent->room_id;

        $room = Room::find($room_id);
        if ($room == null) {
            throw new Exception("House not found while billing.", 1);
        }

        $percentage = 0;
        if ($room->commission_type == 1) {

            if ($room->price > 0) {
                $percentage = ($room->flate_rate_amount / $room->price) * 100;
                $percentage = ($percentage);
                $_percentage = ceil($percentage);
            }
            $m->commission_type = 'Flat Rate - ' . number_format($room->flate_rate_amount) . ", ({$_percentage}%)";
        } else {
            $m->commission_type = 'Percentage';
            $percentage =  $room->percentage_rate;
        }

        $total_rent = $m->amount;
        $commission =  ($percentage / 100) * $total_rent;
        $m->commission_type_value = $room->percentage_rate;
        $m->commission_amount = $commission;
        $m->landlord_amount = $total_rent - $commission;
        $m->house_id = $room->house_id;
        $m->room_id = $room->id;
        $m->landload_id = $room->landload_id;

        return $m;
    }

    public function house()
    {
        return $this->belongsTo(House::class);
    }
    public function room()
    {
        return $this->belongsTo(Room::class);
    }
}
