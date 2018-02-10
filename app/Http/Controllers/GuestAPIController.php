<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Fish;
use Market;
use Fungsi;
use Market_detail;

class GuestAPIController extends Controller
{
    //
	function list_fish(Request $request){
		$cari = $request->cari;
		$response = array();
		if(empty($cari)){
			$list = Fish::all();
		}else{
			$list = Fish::where("fish_name","like","%".$cari."%")->get();
		}
		$response["jumlah"] = count($list);
		$response["data"] = array();
		foreach($list as $list){
			$data=array();
			$data["id"] = $list->id;
			$data["fish_name"] = $list->fish_name;
			$data["base_price"] = $list->base_price;
			$data["fish_photo"] = $list->fish_photo;

			array_push($response["data"], $data);
		}

		return json_encode($response);
	}

	function detail_fish_by_id($id){
		
		$list = Fish::where("id",$id)->get();

		$response["jumlah"] = count($list);
		$response["data"] = array();
		foreach($list as $list){
			$data=array();
			$data["id"] = $list->id;
			$data["fish_name"] = $list->fish_name;
			$data["base_price"] = $list->base_price;
			$data["fish_photo"] = $list->fish_photo;

			array_push($response["data"], $data);
		}

		return json_encode($response);
	}

	function detail_fish_by_name($name){
		
		$list = Fish::where("fish_name",$name)->get();
		
		$response["jumlah"] = count($list);
		$response["data"] = array();
		foreach($list as $list){
			$data=array();
			$data["id"] = $list->id;
			$data["fish_name"] = $list->fish_name;
			$data["base_price"] = $list->base_price;
			$data["fish_photo"] = $list->fish_photo;

			array_push($response["data"], $data);
		}

		return json_encode($response);
	}

	function list_market(Request $request){
		$cari = $request->cari;
		$response = array();
		if(empty($cari)){
			$list = Market::all();
		}else{
			$list = Market::where("market_name","like","%".$cari."%")->get();
		}
		$response["jumlah"] = count($list);
		$response["data"] = array();
		foreach($list as $list){
			$data=array();
			$data["id"] = $list->id;
			$data["market_name"] = $list->market_name;
			$data["market_address"] = $list->market_address;
			$data["long"] = Fungsi::lat_long($list->market_address)[1];
			$data["lat"] = Fungsi::lat_long($list->market_address)[0];

			array_push($response["data"], $data);
		}

		return json_encode($response);
	}

	function detail_market($id){
		
		$list = Market::where("id",$id)->get();

		$response["jumlah"] = count($list);
		$response["data"] = array();

		foreach($list as $list){
			$data=array();
			$data["id"] = $list->id;
			$data["market_name"] = $list->market_name;
			$data["market_address"] = $list->market_address;
			$data["long"] = Fungsi::lat_long($list->market_address)[1];
			$data["lat"] = Fungsi::lat_long($list->market_address)[0];
			array_push($response["data"], $data);
			$response["fish_data"] = array();
			$fish = Market_detail::where("market_id",$id)->get();		
			foreach($fish as $fish){
				$data_fish = array();
				$data_fish["id"] = $fish->fish->id;
				$data_fish["fish_name"] = $fish->fish->fish_name;
				$data_fish["base_price"] = $fish->fish->base_price;
				$data_fish["fish_photo"] = $fish->fish->fish_photo;
				array_push($response["fish_data"], $data_fish);
			}

		}

		return json_encode($response);
	}
    
}
