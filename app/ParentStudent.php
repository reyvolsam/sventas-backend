<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ParentStudent extends Model
{
    use SoftDeletes;

    protected $fillable = ['student_id', 'name', 'parent_type_id', 'phone', 'address', 'created_at', 'updated_at'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

    public function ParentType()
    {
        return $this->belongsTo('App\ParentType');
    }//ParentType()

    public function Student()
    {
        return $this->belongsTo('App\Student');
    }//ParentType()
}

