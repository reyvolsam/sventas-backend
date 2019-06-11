<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

use App\User;

class UserController extends Controller
{

    private $res = [];
    private $request;
    private static $generic_password = "jQ0s5S3Mx1*";

    function __construct(Request $request)
    {
        $this->request = $request;
        $this->res['message'] = '';
        $this->res['status_code'] = 204;

        date_default_timezone_set('America/Mexico_City');
    }//__construct()

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $validator = Validator::make($this->request->all(), [
            'name'              => 'required|max:255',
            'email'             => 'required|max:255|email',
            'group_id'          => 'required'
        ]);

        $id                     = $this->request->input('id');
        $data['name']           = $this->request->input('name');
        $data['email']          = $this->request->input('email');
        $data['group_id']       = $this->request->input('group_id');
        $data['active']         = $this->request->input('active');

        try{
            if(!$validator->fails()) {
                if($id == null){

                    $user = User::where('email', '=', $data['email'])->get();

                    if(count($user) == 0){
                        $user = User::withTrashed()
                                        ->where('email', '=',$data['email'])
                                        ->get();
                        if( count($user) > 0 ){
                            $user = User::withTrashed()
                                        ->where('email', '=', $data['email'])
                                        ->restore();

                            $user = User::where('email', '=', $data['email'])->first();

                            $user->password         = bcrypt(self::$generic_password);
                            
                            $user->avatar           = 'avatar.png';
                            $user->group_id         = $data['group_id'];
                            $user->active           = $data['active'];
                            $user->save();

                            $this->res['client'] = $user;
                            $this->res['message'] = 'Usuario restaurado correctamente.';
                            $this->res['status_code'] = 201;
                        } else {
                            $user = new User;
                            $user->name       = $data['name'];
                            $user->email            = $data['email'];
                            $user->password         = bcrypt(self::$generic_password);    
                            $user->avatar           = 'avatar.png';
                            $user->group_id         = $data['group_id'];
                            $user->active           = $data['active'];
                            $user->save();

                            $this->res['client'] = $user;
                            $this->res['message'] = 'Usuario creado correctamente.';
                            $this->res['status_code'] = 201;
                        }
                    } else {
                        $this->res['msg'] = 'El usuario ya existe.';
                        $this->res['status_code'] = 423;
                    }
                } else {
                    $user = User::find($id);

                    $user->first_name       = $data['first_name'];
                    $user->last_name        = $data['last_name'];
                    $user->email            = $data['email'];
                    $user->phone            = $data['phone'];
                    $user->active           = $data['active'];
                    $user->group_id         = $data['group_id'];                    
                    $user->save();

                    $this->res['client'] = $user;
                    $this->res['message'] = 'Usuario actualizado correctamente.';
                    $this->res['status_code'] = 201;          
                }
            } else {
                $this->res['msg'] = 'Por favor llene todos los campos requeridos.';
                $this->res['status_code'] = 422;
            }
        } catch(\Exception $e) {
            $this->res['msg'] = 'Error en la Base de Datos.'.$e;
            $this->res['status_code'] = 500;
        }
        return response()->json($this->res, $this->res['status_code']);
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
    public function update(Request $request, $id)
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
