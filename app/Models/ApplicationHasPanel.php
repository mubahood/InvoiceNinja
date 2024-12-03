<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ApplicationHasPanel extends Model
{
    use HasFactory;
    /* fillable id	created_at	updated_at	application_id	user_id	
 */
    protected $fillable = ['application_id', 'user_id'];

    public function application()
    {
        return $this->belongsTo(Application::class, 'application_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
