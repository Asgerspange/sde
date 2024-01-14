<?php

namespace App\Http\Controllers;

use App\Models\TeamsInfo;
use Illuminate\Http\Request;

class TeamController extends Controller
{
    public function getTeams()
    {
        $teams = TeamsInfo::all();

        return response()->json(['teams' => $teams]);
    }

    public function getTeam($teamId)
    {
        $team = TeamsInfo::find($teamId);

        return response()->json(['team' => $team]);
    }

    public function getTeamMembers($teamId)
    {
        $team = TeamsInfo::find($teamId);
        $members = $team->members;

        return response()->json(['members' => $members]);
    }

    public function addTeamMember($teamId, $memberId)
    {
        $team = TeamsInfo::find($teamId);
        $team->members()->attach($memberId);

        return response()->json(['message' => 'Member added to team']);
    }

    public function removeTeamMember($teamId, $memberId)
    {
        $team = TeamsInfo::find($teamId);
        $team->members()->detach($memberId);

        return response()->json(['message' => 'Member removed from team']);
    }

    public function updateTeam($teamId)
    {
        $team = TeamsInfo::find($teamId);
        $team->teamName = 'New Team Name';
        $team->save();

        return response()->json(['message' => 'Team updated']);
    }

    public function deleteTeam($teamId)
    {
        $team = TeamsInfo::find($teamId);
        $team->delete();

        return response()->json(['message' => 'Team deleted']);
    }

    public function addTeam(Request $request)
    {
        $team = new TeamsInfo();
        $team->teamName = $request->teamName;
        $team->captainID = $request->captainID;
        $team->sponsor = $request->sponsor;
        $team->gameID = $request->gameID;
        $team->save();

        return response()->json(['message' => 'Team added']);
    }
}


