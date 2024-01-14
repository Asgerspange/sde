<?php

namespace App\Http\Controllers;

use App\Models\Member;
use Illuminate\Http\Request;

class MemberController extends Controller
{
        public function getMembers()
    {
        $members = Member::with('team')->get();
    
        $result = $members->map(function ($member) {
            $teamName = optional($member->team->first())->teamName;
            return [
                'id' => $member->id,
                'firstName' => $member->firstName,
                'lastName' => $member->lastName,
                'role' => $member->role,
                'birthYear' => $member->birthYear,
                'teamName' => $teamName,
            ];
        });
    
        return response()->json(['result' => $result]);
    }

    public function updateMember(Request $request)
    {
        $member = Member::find($request->id);
        $member->firstName = $request->firstName;
        $member->lastName = $request->lastName;
        $member->role = $request->role;
        $member->birthYear = $request->birthYear;
        $member->save();

        return response()->json(['result' => $member]);
    }

    public function deleteMember(Request $request)
    {
        $member = Member::find($request->id);

        if ($member) {
            $member->membershipHistory()->delete();

            $member->delete();

            return response()->json(['result' => $member]);
        } else {
            return response()->json(['error' => 'Member not found'], 404);
        }
    }

    public function addMember(Request $request)
    {
        $member = new Member();
        $member->firstName = $request->firstName;
        $member->lastName = $request->lastName;
        $member->mail = $request->mail;
        $member->phoneNumber = $request->phoneNumber;
        $member->street = $request->street;
        $member->birthYear = $request->birthYear;
        $member->role = 'None';
        $member->save();

        return response()->json(['result' => $member]);
    }
}
