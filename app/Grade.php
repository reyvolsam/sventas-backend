<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Grade extends Model
{
    
    protected $fillable = ['name', 'description', 'campus_id'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];


    public function campus()
    {
        return $this->belongsTo('App\Campus');
    }//campus()
}
