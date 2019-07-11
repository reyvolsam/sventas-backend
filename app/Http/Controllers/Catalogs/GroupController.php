<?php

namespace App\Http\Controllers\Catalogs;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator; 

use App\SchoolGroup;

class GroupController extends Controller
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

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try{
            $groups_list = SchoolGroup::with('grade')->select('id', 'name', 'description', 'grade_id')->get();

            $this->res['data'] = $groups_list;
            if(count($groups_list) > 0){
                foreach ($groups_list as $kc => $vc) $vc->loader = false;
                $this->res['message'] = 'Lista de Grupos obtenida correctamente.';
                $this->status_code = 200;
            } else {
                $this->res['message'] = 'No hay Grupos registrados hasta el momento.';
                $this->status_code = 201;
            }
        } catch(\Exception $e){
            $this->res['msg'] = 'Error en el sistema.'.$e;
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
                'name'              => 'required|max:50',
                'grade_id'          => 'required',
                'description'       => 'max:255'
            ]);

            if(!$validator->fails()) {
                $name = $this->request->input('name');

                $school_group_repeated = SchoolGroup::where('name', $name)->count();
                if($school_group_repeated == 0){                    
                    $school_group_trash = SchoolGroup::withTrashed()->where('name', $name)->count();

                    if($school_group_trash == 0){
                        $school_group = new SchoolGroup;
                        $school_group->create($this->request->all());

                        $this->res['message'] = 'Grupo creado correctamente.';
                        $this->status_code = 200;
                    } else {
                        SchoolGroup::withTrashed()->where('name', $name)->restore();

                        $school_group = SchoolGroup::where('name', $name)->first();

                        $school_group->updateOrCreate(['id' => $school_group->id], $this->request->all());

                        $this->res['message'] = 'Grupo restaurado correctamente.';
                        $this->status_code = 422;
                    }
                } else {
                    $this->res['message'] = 'El grupo ya existe.';
                    $this->status_code = 423;
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
    }

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
    public function update($id)
    {
        try{
            if(is_numeric($id)){
                $validator = Validator::make($this->request->all(), [
                    'name'              => 'required|max:50',
                    'grade_id'          => 'required|numeric',
                    'description'       => 'max:255'
                ]);

                if(!$validator->fails()) {
                    $school_group_exist = SchoolGroup::find($id);
                    if($school_group_exist){
                        SchoolGroup::updateOrCreate(['id' => $id], $this->request->all());
                        $this->res['message'] = 'Grupo actualizado correctamente.';
                        $this->status_code = 200;
                    } else {
                        $this->res['message'] = 'El Grupo no existe.';
                        $this->status_code = 422;
                    }
                } else {
                    $this->res['message'] = 'Por favor llene todos los campos requeridos o revise la longitud de los campos.';
                    $this->status_code = 422;
                }
            } else {
                $this->res['message'] = 'ID incorrecto.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 422;
        }

        return response()->json($this->res, $this->status_code);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            if(is_numeric($id)){                
                $school_group = SchoolGroup::find($id);
                if($school_group){
                    $school_group->delete();
                    $this->res['message'] = 'Grupo eliminado correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'El Grupo no existe.';
                    $this->status_code = 422;
                }
            } else {
                $this->res['message'] = 'ID incorrecto.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 422;
        }

        return response()->json($this->res, $this->status_code);
    }
    
}
