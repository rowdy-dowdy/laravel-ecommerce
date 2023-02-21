<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [\App\Http\Controllers\HomeController::class , 'index'])->name('home');
Route::get('/news', [\App\Http\Controllers\HomeController::class , 'index'])->name('news');
Route::get('/blogs/:slug', [\App\Http\Controllers\HomeController::class , 'index'])->name('blog');
Route::get('/articles/:slug', [\App\Http\Controllers\HomeController::class , 'index'])->name('post');
Route::get('/shop', [\App\Http\Controllers\HomeController::class , 'index'])->name('shop');
Route::get('/collections/:slug', [\App\Http\Controllers\HomeController::class , 'index'])->name('cleection');
Route::get('/products/:slug', [\App\Http\Controllers\HomeController::class , 'index'])->name('product');

require __DIR__.'/auth.php';
require __DIR__.'/default.php';
