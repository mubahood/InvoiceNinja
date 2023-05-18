<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;


    public static function boot()
    {
        parent::boot();
        self::creating(function ($m) {
            $m->status = 'Available';
            return Room::my_update($m);
        });
        self::updating(function ($m) {
            return Room::my_update($m);
        });
    }

    public static function my_update($m)
    {

        $house = House::find($m->house_id);
        if ($house == null) {
            throw new Exception("House not found.", 1);
        }

        $m->landload_id = $house->landload_id;
        $m->region_id = $house->region_id;
        $m->area_id = $house->area_id;

        return $m;
    }

    public static function get_rooms()
    {
        $houses = [];
        foreach (Room::where([])->orderBy('name', 'asc')->get() as $key => $h) {
            $houses[$h->id] = "#".$h->id." - ". $h->name . ", " . $h->house->name;
        }
        return $houses;
    }
    public static function get_ready_rooms()
    {
        $houses = [];
        foreach (Room::where(['status' => 'Vacant'])->orderBy('name', 'asc')->get() as $key => $h) {
            $houses[$h->id] = "#".$h->id." - ". $h->name . ", " . $h->house->name." - UGX ".number_format($h->price);
        }
        return $houses;
    }

    public function house()
    {
        return $this->belongsTo(House::class);
        # code...
    }


    public function getFurnishingsAttribute($d)
    {
        if ($d != null)
            return json_decode($d, true);
    }


    public function setFurnishingsAttribute($d)
    {
        if (is_array($d)) {
            $this->attributes['furnishings'] = json_encode($d);
        }
    }

    public function getUtilitiesAttribute($d)
    {
        if ($d != null)
            return json_decode($d, true);
    }


    public function setUtilitiesAttribute($d)
    {
        if (is_array($d)) {
            $this->attributes['utilities'] = json_encode($d);
        }
    }



    public function getInternetAccessAttribute($d)
    {
        if ($d != null)
            return json_decode($d, true);
    }


    public function setInternetAccessAttribute($d)
    {
        if (is_array($d)) {
            $this->attributes['internet_access'] = json_encode($d);
        }
    }


    public function getSecurityAttribute($d)
    {
        if ($d != null)
            return json_decode($d, true);
    }


    public function setSecurityAttribute($d)
    {
        if (is_array($d)) {
            $this->attributes['security'] = json_encode($d);
        }
    }


    public function getAmenitiesAttribute($d)
    {
        if ($d != null)
            return json_decode($d, true);
    }


    public function setAmenitiesAttribute($d)
    {
        if (is_array($d)) {
            $this->attributes['amenities'] = json_encode($d);
        }
    }

    public function getImagesAttribute($d)
    {
        if ($d != null)
            return json_decode($d, true);
    }


    public function setImagesAttribute($d)
    {
        if (is_array($d)) {
            $this->attributes['images'] = json_encode($d);
        }
    }
}
