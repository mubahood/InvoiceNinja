<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Candidate extends Model
{
    use HasFactory;

    function sub()
    {
        return $this->belongsTo(Location::class, 'subcounty_id');
    }


    public static function boot()
    {
        parent::boot();
        self::deleting(function ($m) {
        });
        self::created(function ($m) {
        });
        self::creating(function ($m) {

            $m->district_id = 1;

            if ($m->subcounty_id != null) {
                $sub = Location::find($m->subcounty_id);
                if ($sub != null) {
                    $m->district_id = $sub->parent;
                } else {
                    $m->subcounty_id = 1;
                }
            }

            return $m;
        });


        self::updating(function ($m) {
            $m->district_id = 1;
            $sub = Location::find($m->subcounty_id);
            if ($sub != null) {
                $m->district_id = $sub->parent;
            } else {
                $m->subcounty_id = 1;
            }
            return $m;
        });
    }



    /* 
    public function setCvSharedWithPartnersAttribute($pictures)
    {
        if (is_array($pictures)) {
            $this->attributes['cv_shared_with_partners'] = json_encode($pictures);
        }
    }
 */
    /*     public function getCvSharedWithPartnersAttribute($pictures)
    {
        return json_decode($pictures, true);
    } */
}
