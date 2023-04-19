<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Person extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();
        self::deleting(function ($m) {
        });
        self::created(function ($m) {
        });
        self::creating(function ($m) {

           /*  $m->district_id = 1;

            if ($m->subcounty_id != null) {
                $sub = Location::find($m->subcounty_id);
                if ($sub != null) {
                    $m->district_id = $sub->parent;
                } else {
                    $m->subcounty_id = 1;
                }
            } */

            $m->group_id = 1;
            $sub = Group::find($m->group_id);
            if ($sub != null) {
                $m->association_id = $sub->association_id;
            } else {
                $m->group_id = 1;
            } 
            
            return $m;
        });


        self::updating(function ($m) {
           /*  $m->district_id = 1;
            $sub = Location::find($m->subcounty_id);
            if ($sub != null) {
                $m->district_id = $sub->parent;
            } else {
                $m->subcounty_id = 1;
            } 

            $m->group_id = 1;
            $sub = Group::find($m->group_id);
            if ($sub != null) {
                $m->association_id = $sub->association_id;
            } else {
                $m->group_id = 1;
            }  */

            return $m;
        });
    }

    public function association(){
        return $this->belongsTo(Association::class);
    }

    public function disability(){
        return $this->belongsTo(Disability::class,'disability_id');
    }

    public function district(){
        return $this->belongsTo(Location::class,'district_id');
    }
    public function getDisabilityTextAttribute()
    {
        $d = Disability::find($this->disability_id);
        if($d == null){
            return 'Not mentioned.';
        }
        return $d->name;
    }
    public function getGroupTextAttribute()
    {
        $d = Group::find($this->group_id);
        if($d == null){
            return 'Not group.';
        }
        return $d->name_text; 
    }
    public function getAdministratorTextAttribute()
    {
        $d = Administrator::find($this->administrator_id);
        if($d == null){
            return 'Not group.';
        }
        return $d->name; 
    }
    public function getSubcountyTextAttribute()
    {
        $d = Location::find($this->subcounty_id);
        if($d == null){
            return 'Not group.';
        } 
        return $d->name_text; 
    }

    protected $appends = ['disability_text','group_text','administrator_text','subcounty_text'];
}
