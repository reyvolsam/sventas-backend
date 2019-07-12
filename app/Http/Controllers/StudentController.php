<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

use App\Student;
use App\ParentStudent;

class StudentController extends Controller
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
            $students_list = Student::with('grade')->select('id', 'enrollment', 'name', 'grade_id')->get();

            $this->res['data'] = $students_list;
            if(count($students_list) > 0){
                foreach ($students_list as $kc => $vc) $vc->loader = false;
                $this->res['message'] = 'Lista de Estudiantes obtenida correctamente.';
                $this->status_code = 200;
            } else {
                $this->res['message'] = 'No hay Estudiantes registrados hasta el momento.';
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
                'enrollment'            => 'required|max:255',
                'name'                  => 'required|max:255',
                'grade_id'              => 'required'
            ]);

            if(!$validator->fails()) {
                $name = $this->request->input('name');
                $enrollment = $this->request->input('enrollment');
                $student_repeated = Student::where('name', '=', $name)->where('enrollment', $enrollment)->count();

                if($student_repeated == 0){
                    $student = new Student;
                    $id = $student->create($this->request->all())->id;

                    $parents_stdents = $this->request->input('parents_students');

                    if(count($parents_stdents) > 0){
                        foreach ($parents_stdents as $kps => $vps) {
                            $parent_student = new ParentStudent;
                            $student->create($vps);
                        }
                    }

                    $this->res['message'] = 'Estudiante creado correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'El nombre del estudiante con la matricula ya existe.';
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
