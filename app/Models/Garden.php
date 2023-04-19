<?php

namespace App\Models;

use Carbon\Carbon;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Garden extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();
        self::created(function ($m) {
            Garden::generate_protocols($m);
        });
    }

    public static function generate_protocols($m)
    {
        $crop = Crop::find($m->crop_id);
        if ($crop == null) {
            throw new Exception("Crop not found.", 1);
        }

        $pros = CropProtocol::where([
            'crop_id' => $crop->id
        ])->orderBy('step', 'asc')->get();
        foreach ($pros as $key => $pro) {
            $act = new GardenActivity();
            $act->garden_id = $m->id;
            $act->user_id = $m->user_id;
            $act->crop_activity_id = $pro->id;
            $act->activity_name = $pro->name;
            $act->activity_description = $pro->details;
            $planting_date = Carbon::parse($m->planting_date);
            if ($pro->is_before_planting == 'Pre-planting') {
                $act->activity_date_to_be_done =  $planting_date->subDays($pro->days_before_planting);
            } else {
                $act->activity_date_to_be_done =  $planting_date->addDays($pro->days_after_planting);
            }
            $date_2 = Carbon::parse($act->activity_date_to_be_done);
            $act->activity_due_date = $date_2->addDays(((int)($pro->acceptable_timeline)));
            $act->farmer_has_submitted = 'No';
            $act->agent_has_submitted = 'No';
            $act->save();
        }
    }
}
