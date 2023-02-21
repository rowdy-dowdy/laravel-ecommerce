<?php

namespace App\Http\Controllers;

use Illuminate\View\View;
use Illuminate\Http\Request;

class HomeController extends Controller
{
  public function index(Request $request): View
  {
    $homeBanners = \App\Models\Banner::where('type', 'home')->limit(3)->get();
    $homeBanners2 = \App\Models\Banner::where('type', 'home2')->limit(3)->get();
    $featureProducts = \App\Models\Product::whereHas('collections', function ($q) {
      $q->where('slug', 'feature');
    })->with('collections', function ($q) {
      $q->first();
    })->limit(5)->get();
    // dd($featureProducts);
    $onSaleProducts = \App\Models\Product::whereNotNull('promotion')->limit(5)->get();
    $topRateProducts = $onSaleProducts;

    return view('screens.home', [
      'homeBanners' => $homeBanners,
      'homeBanners2' => $homeBanners2,
      'featureProducts' => $featureProducts,
      'onSaleProducts' => $onSaleProducts,
      'topRateProducts' => $topRateProducts
    ]);
  }
}
