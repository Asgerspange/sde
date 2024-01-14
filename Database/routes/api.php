<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/check-database-connection', 'DatabaseController@checkConnection');

Route::group(['prefix' => 'teams'], function () {
    Route::post('/getTeams', 'DatabaseController@getTeams');
});

Route::group(['prefix' => 'members'], function () {
    Route::get('/getMembers', 'MemberController@getMembers');
    Route::post('/updateMember', 'MemberController@updateMember');
    Route::post('/deleteMember', 'MemberController@deleteMember');
    Route::post('/addMember', 'MemberController@addMember');
});


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
