<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/check-database-connection', 'DatabaseController@checkConnection');

Route::group(['prefix' => 'teams'], function () {
    Route::get('/getTeamMembers/{teamId}', 'TeamController@getTeamMembers');
    Route::post('/addTeamMember/{teamId}/{memberId}', 'TeamController@addTeamMember');
    Route::post('/removeTeamMember/{teamId}/{memberId}', 'TeamController@removeTeamMember');
    Route::post('/updateTeam/{teamId}', 'TeamController@updateTeam');
    Route::post('/deleteTeam/{teamId}', 'TeamController@deleteTeam');
    Route::post('/addTeam', 'TeamController@addTeam');
    Route::get('/getTeams', 'TeamController@getTeams');
    Route::get('/getTeam/{teamId}', 'TeamController@getTeam');
    Route::get('/getTeamCaptains', 'TeamController@getTeamCaptains');
});

Route::group(['prefix' => 'members'], function () {
    Route::get('/getMembers', 'MemberController@getMembers');
    Route::get('/getMember/{id}', 'MemberController@getMember');
    Route::post('/updateMember', 'MemberController@updateMember');
    Route::post('/deleteMember', 'MemberController@deleteMember');
    Route::post('/addMember', 'MemberController@addMember');
});

Route::group(['prefix' => 'tournaments'], function () {
    Route::get('/getTournaments', 'TournamentController@getTournaments');
});


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
