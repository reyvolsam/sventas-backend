<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Campus extends Model
{
    use SoftDeletes;

    protected $table = 'campus';
    protected $fillable = ['name', 'description'];
	protected $guarded = ['id'];
    protected $dates = ['deleted_at'];
}
