<?php

namespace App\Models;

use Carbon\Carbon;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Renting extends Model
{
    use HasFactory;



    public static function boot()
    {
        parent::boot();
        self::creating(function ($m) {

            $room = Room::find($m->room_id);
            if ($room == null) {
                throw new Exception("House not found while billing.", 1);
            }
            $m =  Renting::my_update($m);
            return $m;
        });

        self::created(function ($m) {
            $m->process_bill();
        });
        self::updated(function ($m) {
            if ($m->update_billing == 'Yes') {
                $m->process_bill();
            }
        });

        self::updating(function ($m) {
            return Renting::my_update($m);
        });
    }

    public function room()
    {
        $x = Room::find($this->room_id);
        if ($x == null) {
            $this->room_id = 1;
            $this->save();
        }
        return  $this->belongsTo(Room::class);
    }
    public function tenant()
    {
        $x = Tenant::find($this->tenant_id);
        if ($x == null) {
            $this->tenant_id = 1;
            $this->save();
        }
        return  $this->belongsTo(Tenant::class);
    }
    public function process_bill()
    {
        $m = $this;
        $house = House::find($m->house_id);
        if ($house == null) {
            throw new Exception("House not found while billing.", 1);
        }
        $room = Room::find($m->room_id);
        if ($room == null) {
            throw new Exception("House not found while billing.", 1);
        }

        $landload = Landload::find($m->landload_id);
        if ($landload == null) {
            throw new Exception("landload not found while billing.", 1);
        }


        $m->payable_amount = ($room->price * $m->number_of_months);
        $m->balance = -1 * (($room->price * $m->number_of_months) - $m->discount);
        $paidAmount = $m->payments->sum('amount');
        $m->balance = $m->balance + $paidAmount;
        $m->end_date = Carbon::parse($m->start_date)->addMonths($m->number_of_months);
        $m->is_overstay = 'No';
        $m->is_in_house = 'Yes';
        $m->invoice_status = 'Active';

        if ($room->commission_type == 1) {
            $m->commision_type = 'Flat Rate';
            $m->commision_type_value = $room->flate_rate_amount;
            $m->commision_amount = $room->flate_rate_amount * $m->number_of_months;
        } else {
            $m->commision_type = 'Percentage';
            $m->commision_type_value = $room->percentage_rate;
            $m->commision_amount = ($room->percentage_rate / 100) * ($room->price * $m->number_of_months);
        }

        $m->landlord_amount = $m->payable_amount - $m->commision_amount;
        $m->update_billing = 'No';
        $m->invoice_as_been_billed = 'Yes';
        $m->save();
        $room->status = 'Occupied';
        $room->save();
        if ($m->tenant != null) {
            $m->tenant->update_balance();
        }
        $landload->update_balance();
    }

    //$form->number('', __('Payable amount'));
    //$form->number('', __('Balance'));
    //$form->text('', __('Is overstay'));
    //$form->text('', __('Is in house'));
    public function house()
    {
        return $this->belongsTo(House::class);
    }
    public function payments()
    {
        return $this->hasMany(TenantPayment::class, 'renting_id');
    }


    public static function my_update($m)
    {
        $room = Room::find($m->room_id);
        if ($room == null) {
            throw new Exception("House not found.", 1);
        }
        $m->house_id = $room->house_id;
        return $m;
    }
}
