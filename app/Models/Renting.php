<?php

namespace App\Models;

use Carbon\Carbon;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Renting extends Model
{
    use HasFactory;


    protected $appends = [
        'name_text', 'name_text2', 'amount_paid', 'commission_amount',
        'landlord_amount',
        'last_payment_date',
        'last_payment_amount',
        'months_paid',
    ];

    //getter for amount_paid
    public function getAmountPaidAttribute()
    {
        return $this->payments->sum('amount');
    }

    //getter for commission_amount
    public function getCommissionAmountAttribute()
    {
        return $this->payments->sum('commission_amount');
    }

    //getter for landlord_amount_amount
    public function getLandlordAmountAttribute()
    {
        return $this->payments->sum('landlord_amount');
    }

    //getter for last_payment_date
    public function getLastPaymentDateAttribute()
    {
        $last_payment = $this->payments->last();
        if ($last_payment == null) {
            return null;
        }
        return $last_payment->created_at;
    }

    //getter for last_payment_amount
    public function getLastPaymentAmountAttribute()
    {
        $last_payment = $this->payments->last();
        if ($last_payment == null) {
            return null;
        }
        return $last_payment->amount;
    }

    //getter for months_paid
    public function getMonthsPaidAttribute()
    {

        //calculate amount_paid
        $amount_paid = $this->payments->sum('amount');
        $room_price = $this->room->price;
        if($room_price == 0){
            return 0;
        }

        $percentage_paid = $amount_paid / $room_price;
        //round to nearest whole number
        $months_paid = round($percentage_paid, 2);
        return $months_paid;
    }

    public function getNameTextAttribute()
    {
        return $this->room->name_text;
    }

    public function getNameText2Attribute()
    {
        //format like this 1st Jan 2021
        $start_date = Carbon::parse($this->start_date)->format('jS M y');
        $end_date = Carbon::parse($this->end_date)->format('jS M y');
        return $start_date . ' - ' . $end_date;
    }

    public static function boot()
    {
        parent::boot();
        self::updating(function ($m) {
            $room = Room::find($m->room_id);
            if ($room == null) {
                throw new Exception("House not found while billing.", 1);
            }
            $m->landload_id =  $room->landload_id;
            $m =  Renting::my_update($m);
            return $m;
        });
        self::creating(function ($m) {

            $room = Room::find($m->room_id);
            if ($room == null) {
                throw new Exception("House not found while billing.", 1);
            }
            $m =  Renting::my_update($m);
            $m->landload_id =  $room->landload_id;

            return $m;
        });

        self::created(function ($m) {
            $m->process_bill();
        });

        self::updated(function ($m) {
            if ($m->update_billing == 'Yes') {
                $m->process_bill();
            }

            $room = Room::find($m->room_id);
            if ($room == null) {
                throw new Exception("House not found while billing.", 1);
            }
            if ($m->invoice_status == 'Active') {
                $room->status = 'Occupied';
            } else {
                $room->status = 'Vacant';
            }
            $room->save();
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


        $m->payable_amount = ($room->price * $m->number_of_months);
        $m->balance = -1 * (($room->price * $m->number_of_months) - $m->discount);
        $paidAmount = $m->payments->sum('amount');
        $m->balance = $m->balance + $paidAmount;
        $m->end_date = Carbon::parse($m->start_date)->addMonths($m->number_of_months);
        $m->is_overstay = 'No';
        $m->is_in_house = 'Yes';

        $m->update_billing = 'No';
        $m->invoice_as_been_billed = 'Yes';
        $m->save();
        if ($m->invoice_status == 'Active') {
            $room->status = 'Occupied';
        } else {
            $room->status = 'Vacant';
        }

        $room->save();
        if ($m->tenant != null) {
            $m->tenant->update_balance();
        }
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
        $m->is_overstay = 'No';
        if ($m->invoice_status == 'Active') {
            $lastDate = Carbon::parse($m->end_date);
            $now = Carbon::now();
            if ($now->gt($lastDate)) {
                $m->is_overstay = 'Yes';
            } else {
                $m->is_overstay = 'No';
            }
        }
        return $m;
    }
}
