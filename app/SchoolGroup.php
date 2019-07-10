<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SchoolGroup extends Model
{
    protected $fillable = ['name', 'description', 'grade_id'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

    public function Grade()
    {
        return $this->belongsTo('App\Grade');
    }//campus()
}
