<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ApplicationOld extends Model
{
    use HasFactory;

    public function attarchments()
    {
        return $this->hasMany(Attarchment::class);
    }
}
