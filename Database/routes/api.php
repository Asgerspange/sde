<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
use App\Http\Controllers\DatabaseController;

Route::get('/check-database-connection', [DatabaseController::class, 'checkConnection']);

Route::group(['prefix' => 'teams'], function () {
    Route::post('/getTeams', [DatabaseController::class, 'getTeams']);
});
Route::get('/getMembers', [DatabaseController::class, 'getMembers']);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
