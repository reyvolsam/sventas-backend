<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Student extends Model
{
    use SoftDeletes;

    protected $fillable = ['enrollment', 'name', 'grade_id', 'school_group_id','created_at', 'updated_at'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

    public function Grade()
    {
        return $this->belongsTo('App\Grade');
    }//grade()

    public function SchoolGroup()
    {
        return $this->belongsTo('App\SchoolGroup');
    }//grade()

}
