<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DatabaseController extends Controller
{
    public function checkConnection()
    {
        try {
            DB::connection()->getPdo();
            $connected = true;
        } catch (\Exception $e) {
            $connected = $e;
        }

        return response()->json(['connected' => $connected]);
    }

    public function getTeams(Request $request)
    {
        $team = $this->getTeam($request->team);

        return response()->json([
            'team' => $team->original['result']
        ]);
    }

    private function getTeam($teamName)
    {
        $databaseName = 'NAAES';

        DB::connection()->setDatabaseName($databaseName);

        $result = DB::table('members.info as m')
            ->select('m.firstName', 'm.lastName', 'm.role')
            ->join('teams.players as tp', 'm.id', '=', 'tp.playerID')
            ->join('teams.info as t', 'tp.teamID', '=', 't.teamID')
            ->where('t.teamName', '=', $teamName)
            ->get();

            return response()->json(['result' => $result]);
    }

    public function getMembers()
    {
        $databaseName = 'NAAES';

        DB::connection()->setDatabaseName($databaseName);

        $result = DB::table('members.info')->get();

        return response()->json(['result' => $result]);
    }
}
