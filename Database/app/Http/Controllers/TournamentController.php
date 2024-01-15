<?php

namespace App\Http\Controllers;

use App\Models\TournamentsInfo;
use Illuminate\Http\Request;

class TournamentController extends Controller
{
    public function getTournaments()
    {
        $tournaments = TournamentsInfo::with('winner')->get();

        return response()->json(['tournaments' => $tournaments]);
    }
}


