<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'auth', 'middleware' => 'cors'], function (){
    Route::post('login', 'Auth\LoginController@auth');
    Route::post('logout', 'Auth\LoginController@logout');
});

Route::group(['middleware' => ['cors', 'auth:api']], function (){
    Route::post('campus/lists', 'Catalogs\CampusController@lists');
    Route::resource('campus', 'Catalogs\CampusController');

    Route::resource('user', 'UserController');

    Route::resource('grade', 'Catalogs\GradeController');
});
