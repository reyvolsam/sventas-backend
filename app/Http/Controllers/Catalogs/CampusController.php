<?php

namespace App\Http\Controllers\Catalogs;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;

use App\User;
use App\Campus;

class CampusController extends Controller
{

    private $res = [];
    private $request;

    function __construct(Request $request)
    {
        $this->request = $request;
        $this->res['message'] = '';
        $this->status_code = 204;

        date_default_timezone_set('America/Mexico_City');
    }//__construct()

    public function lists()
    {
        try{
            $campus = Campus::all();

            $this->res['data'] = $campus;
            if(count($campus) > 0){
                $this->res['message'] = 'Lista de Campus obtenida correctamente.';
                $this->status_code = 200;
            } else {
                $this->res['message'] = 'No hay Campus registrados hasta el momento.';
                $this->status_code = 201;
            }
        } catch(\Exception $e){
            $this->res['msg'] = 'Error en el sistema.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }//lists()

    public function store()
    {
        try{
            $validator = Validator::make($this->request->all(), [
                'name'              => 'required|max:100',
                'description'       => 'max:255'
            ]);

            if(!$validator->fails()) {
                $name = $this->request->input('name');
                $campus_repeated = Campus::where('name', '=', $name)->count();

                if(count($campus_repeated) > 0){

                    $campus = new Campus;
                    $campus->create($this->request->all());

                    $this->res['message'] = 'Campus creado correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'El nombre del campus ya existe.';
                    $this->status_code = 422;
                }
            } else {
                $this->res['message'] = 'Por favor llene todos los campos requeridos o revise la longitud de los campos.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 422;
        }

        return response()->json($this->res, $this->status_code);
    }//store()

    public function update($id)
    {
        try{
            $validator = Validator::make($this->request->all(), [
                'name'              => 'required|max:100',
                'description'       => 'max:255'
            ]);

            if(!$validator->fails()) {
                $campus_exist = Campus::find($id);
                if($campus_exist){
                    Campus::updateOrCreate(['id' => $id], $this->request->all());
                    $this->res['message'] = 'Campus actualizado correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'El campus no existe.';
                    $this->status_code = 422;
                }
            } else {
                $this->res['message'] = 'Por favor llene todos los campos requeridos o revise la longitud de los campos.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 422;
        }

        return response()->json($this->res, $this->status_code);
    }//update()

    public function destroy($id)
    {
        try{
            $user_count = User::where('campus_id', $id)->count();
            if($user_count == 0){
                $campus = Campus::find($id);
                if($campus){
                    $campus->delete();
                    $this->res['message'] = 'Campus eliminado correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'El campus no existe.';
                    $this->status_code = 422;
                }
            } else {
                $s = ($user_count > 0) ? ' usuario': ' usuarios';
                $this->res['message'] = 'El campus esta asignado a '.$user_count.$s;
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 422;
        }

        return response()->json($this->res, $this->status_code);
    }//destroy()

}////
