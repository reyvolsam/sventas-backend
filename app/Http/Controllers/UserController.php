<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

use App\User;

class UserController extends Controller
{

    private $res = [];
    private $request;
    private static $generic_password = "Nextio2019";

    function __construct(Request $request)
    {
        $this->request = $request;
        $this->res['message'] = '';
        $this->status_code = 204;

        date_default_timezone_set('America/Mexico_City');
    }//__construct()

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try{
            $user_list = [];

            $user_list = User::all();

            if(count($user_list) > 0){
                $this->res['data'] = $user_list;
            } else {
                $this->res['message'] = 'No hay usuarios hasta el momento.';
            }

            $this->status_code = 200;
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store()
    {
        try{
            $validator = Validator::make($this->request->all(), [
                'name'              => 'required|max:255',
                'email'             => 'required|max:255|email',
                'campus_id'         => 'required',
                'group_id'          => 'required'
            ]);

            $id                     = $this->request->input('id');
            $data['name']           = $this->request->input('name');
            $data['email']          = $this->request->input('email');
            $data['campus_id']      = $this->request->input('campus_id');
            $data['group_id']       = $this->request->input('group_id');
            $data['active']         = $this->request->input('active');

            if(!$validator->fails()) {
                $user = User::where('email', '=', $data['email'])->get();

                if(count($user) == 0){
                    $user = User::withTrashed()
                                    ->where('email', '=',$data['email'])
                                    ->get();
                    if( count($user) > 0 ){
                        $user = User::withTrashed()
                                    ->where('email', '=', $data['email'])
                                    ->restore();

                        //$user = User::where('email', '=', $data['email'])->first();

                        $user->password         = bcrypt(self::$generic_password);

                        $user->avatar           = 'avatar.png';
                        $user->campus_id        = $data['campus_id'];
                        $user->group_id         = $data['group_id'];
                        $user->active           = $data['active'];
                        $user->save();

                        $this->res['message'] = 'Usuario restaurado correctamente.';
                        $this->status_code = 201;
                    } else {
                        $user = new User;
                        $user->name             = $data['name'];
                        $user->email            = $data['email'];
                        $user->password         = bcrypt(self::$generic_password);
                        $user->avatar           = 'avatar.png';
                        $user->campus_id        = $data['campus_id'];
                        $user->group_id         = $data['group_id'];
                        $user->active           = $data['active'];
                        $user->save();

                        $this->res['message'] = 'Usuario creado correctamente.';
                        $this->status_code = 201;
                    }
                } else {
                    $this->res['message'] = 'El correo electrónico ya existe.';
                    $this->status_code = 423;
                }
            } else {
                $this->res['message'] = 'Por favor llene todos los campos requeridos.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }//store

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
