<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Auth;

class GuestController extends Controller
{
    //

    function login(){
    	
    	return view("login");
    }

    function do_login(Request $request){
    	$cek = Auth::attempt([
    		"username" => $request->txt_user,
    		"password" => $request->txt_pass,
    		"role" => "Admin"
    	],false);

    	if($cek){
    		return redirect("admin/");
    	}else{
    		return back()->with("error","Wrong Username and Password");
    	}
    }

    function logout(){
    	Auth::logout();
    	return redirect("/");
    }
}
