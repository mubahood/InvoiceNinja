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

            $m->payable_amount = ($room->price * $m->number_of_months);
            $m->balance = -1 * (($room->price * $m->number_of_months) - $m->discount);
            $m->end_date = Carbon::parse($m->start_date)->addMonths($m->number_of_months);
            $m->is_overstay = 'No';
            $m->is_in_house = 'Yes';

            $room->status = 'Occupied';
            $room->save();
            return $m;
        });

        self::created(function ($m) {
            $m->process_bill();
        });
        self::updated(function ($m) {
            $m->process_bill();
        });

        self::updating(function ($m) {
            return Renting::my_update($m);
        });
    }

    public function room()
    {
        return  $this->belongsTo(Room::class);
    }
    public function tenant()
    {
        return  $this->belongsTo(Tenant::class);
    }
    public function process_bill()
    {
        $m = $this;
        $bill = LandloadPayment::where([
            'renting_id' => $m->id
        ])->first();

        if ($bill == null) {
            $house = House::find($m->house_id);
            if ($house == null) {
                throw new Exception("House not found while billing.", 1);
            }
            $room = Room::find($m->room_id);
            if ($room == null) {
                throw new Exception("House not found while billing.", 1);
            }


            $bill = new LandloadPayment();
            $bill->renting_id = $m->id;
            $bill->landload_id = $house->landload_id;
            $bill->room_id = $m->room_id;
            // calculating total amount for room and commission
            $total_room_amount = $room->price * $m->number_of_months;
            if ($room->percentage_rate != null) {
                error_log("perce");
                $total_commission_rate = ($room->percentage_rate * $m->number_of_months) / 100;
                $company_credit = $total_room_amount * $total_commission_rate; 
                $landlord_credit = $total_room_amount - $company_credit;
            } 
            elseif($room->flate_rate_amount != null){
                
                $company_credit = intval($room->flate_rate_amount * $m->number_of_months);
                error_log($company_credit);
                $landlord_credit = $total_room_amount - $company_credit; 
            }else{
                $company_credit = 10;
                $landlord_credit = $total_room_amount; 
            }

            $bill->amount = $total_room_amount;
            $bill->amount_payable_to_landload = $landlord_credit;
            $bill->amount_payable_to_company = $company_credit;

            $bill->details = "Being bill for rent of {$m->number_of_months} months in room {$room->name}, from {$m->start_date} to {$m->end_date}. 
            Invoice no. #{$m->id}";
            
            $bill->save();

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
