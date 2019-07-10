<?php

namespace App\Http\Controllers\Catalogs;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;

use App\Grade;

class GradeController extends Controller
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
            $grades_list = Grade::select('id', 'name', 'description', 'campus_id')->get();

            $this->res['data'] = $grades_list;
            if(count($grades_list) > 0){
                foreach ($grades_list as $kc => $vc) $vc->loader = false;
                $this->res['message'] = 'Lista de Grados obtenida correctamente.';
                $this->status_code = 200;
            } else {
                $this->res['message'] = 'No hay Grados registrados hasta el momento.';
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
     * @return \Illuminate\Http\Response
     */
    public function store()
    {
        try{
            $validator = Validator::make($this->request->all(), [
                'name'              => 'required|max:10',
                'description'       => 'max:255'
            ]);

            if(!$validator->fails()) {
                $name = $this->request->input('name');

                $grade_repeated = User::where('name', $name)->count();
                if($grade_repeated == 0){                    
                    $grade_trash = Grade::withTrashed()->where('name', $name)->count();

                    if($grade_trash == 0){
                        $grade = new Grade;
                        $grade->create($this->request->all());

                        $this->res['message'] = 'Grado creado correctamente.';
                        $this->status_code = 200;
                    } else {
                        Grade::withTrashed()->where('name', $name)->restore();

                        $grade = User::where('name', $name)->first();

                        $grade->updateOrCreate([$grade->id], $this->request->all());

                        $this->res['message'] = 'Grado restaurado correctamente.';
                        $this->status_code = 422;
                    }
                } else {
                    $this->res['message'] = 'El grado ya existe.';
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
    public function update(Request $request, $id)
    {
        try{
            $validator = Validator::make($this->request->all(), [
                'name'              => 'required|max:10',
                'description'       => 'max:255'
            ]);

            if(!$validator->fails()) {
                $grade_exist = Grade::find($id);
                if($grade_exist){
                    Grade::updateOrCreate(['id' => $id], $this->request->all());
                    $this->res['message'] = 'Grado actualizado correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'El Grado no existe.';
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
                $grade = Grade::find($id);
                if($grade){
                    $grade->delete();
                    $this->res['message'] = 'Grado eliminado correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'El grado no existe.';
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
