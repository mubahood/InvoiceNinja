<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CourseTopic extends Model
{
    use HasFactory;
    public function course_chapter()
    {
        return $this->belongsTo(CourseChapter::class);
    }

    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    public $fillable = [
        'course_chapter_id',
        'name',
        'type',
        'video',
        'youtube',
        'files',
        'description',
        'minutes',
    ];
}
