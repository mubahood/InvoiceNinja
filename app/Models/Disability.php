<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Disability extends Model
{
    use HasFactory;

    public function people()
    {
        return $this->hasMany(Person::class, 'disability_id');
    }
}
