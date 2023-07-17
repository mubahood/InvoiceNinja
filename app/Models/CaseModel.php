<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CaseModel extends Model
{
    use HasFactory;
    protected $table = 'cases';

    public static function boot()
    {
        parent::boot();
        self::creating(function ($m) {
            return CaseModel::my_update($m);
        });
        self::updating(function ($m) {
            return CaseModel::my_update($m);
        });
        self::deleting(function ($m) {
            if ($m->id == 1) {
                throw new Exception("You cannot delete this room.", 1);
            }
        });
    }

    public function reporter()
    {
        return $this->belongsTo(Administrator::class, 'reported_by');
    }
    public function district()
    {
        return $this->belongsTo(Location::class, 'district_id');
    }
    public function sub_county()
    {
        return $this->belongsTo(Location::class, 'sub_county_id');
    } 
    public static function my_update($m)
    {

        $sub_county = Location::find($m->sub_county_id);
        if ($sub_county == null) {
            throw new Exception("House not found.", 1);
        }
        $m->district_id = $sub_county->parent;

        return $m;
    }


    public function getOffencesAttribute($value)
    {
        if ($value == null) {
            return [];
        }
        return json_decode($value);
    }

    public function setOffencesAttribute($value)
    {
        $this->attributes['offences'] = json_encode($value);
    }



    public function getAttachmentsAttribute($value)
    {
        if ($value == null) {
            return [];
        }
        try{
            $data = json_decode($value);
            if(!is_array($data)){ 
                $data = [];
            }
        }catch(Exception $e){
            $data = [];
        }
        return $data;
    }

    public function setAttachmentsAttribute($value)
    {
        $this->attributes['attachments'] = json_encode($value);
    }


    public function getComplainantPhotoAttribute($value)
    {
        if ($value == null || $value == '' || strlen($value) < 3) {
            return url('user.png');
        }
        return $value;
    }

    public function getSuspectPhotoAttribute($value)
    {
        if ($value == null || $value == '' || strlen($value) < 3) {
            return url('user.png');
        }
        return $value;
    }
}
