<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    public function course_category()
    {
        return $this->belongsTo(CourseCategory::class);
    }
    public function course_chapters()
    {
        return $this->hasMany(CourseChapter::class);
    }
    public function course_topics()
    {
        return $this->hasMany(CourseTopic::class);
    }

    use HasFactory;
}
