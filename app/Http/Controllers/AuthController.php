<?php
namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use Validator;


class AuthController extends Controller
{

    private $request;
    private $res = array();

    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->res['status'] = false;
        $this->res['msg'] = '';
    }//

}////