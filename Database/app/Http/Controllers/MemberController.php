<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\MembershipHistory;
use Illuminate\Http\Request;

class MemberController extends Controller
{
    public function getMembers(Request $request)
    {
        $perPage = $request->input('rows', 10); // Number of items per page, default to 10
        $page = $request->input('first', 0) / $perPage + 1; // Calculate the current page

        $members = Member::with('team')->with('membershipHistory')
            ->skip(($page - 1) * $perPage)
            ->take($perPage)
            ->get();

        $totalRecords = Member::count(); // Get the total number of records

        $result = $members->map(function ($member) {
            $teamName = optional($member->team->first())->teamName;
            $teamID = optional($member->team->first())->teamID;
            $teamSponsor = optional($member->team->first())->sponsor;
            $joinDate = optional($member->membershipHistory->first())->joinDate;

            return [
                'id' => $member->id,
                'profilePicture' => $member->profilePicture,
                'firstName' => $member->firstName,
                'lastName' => $member->lastName,
                'role' => $member->role,
                'street' => $member->street,
                'birthYear' => $member->birthYear,
                'joinDate' => $joinDate,
                'teamName' => $teamName,
                'teamID' => $teamID,
                'sponsor' => $teamSponsor,
            ];
        });

        return response()->json(['result' => $result, 'totalRecords' => $totalRecords]);
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
        $member->firstName = $request[0]['firstName'];
        $member->lastName = $request[0]['lastName'];
        $member->mail = $request[0]['mail'];
        $member->phoneNumber = $request[0]['phoneNumber'];
        $member->street = $request[0]['street'];
        $member->birthYear = $request[1];
        $member->role = 'None';
        $member->save();

        $membershipHistory = new MembershipHistory();
        $membershipHistory->memberId = $member->id;
        $membershipHistory->save();

        return response()->json(['result' => $member]);
    }

    public function getMember(Request $request)
    {
        $member = Member::with('team')->with('membershipHistory')->where('id', $request->id)->get();

        $result = $member->map(function ($member) {
            $teamName = optional($member->team->first())->teamName;
            $teamID = optional($member->team->first())->teamID;
            $teamSponsor = optional($member->team->first())->sponsor;
            $joinDate = optional($member->membershipHistory->first())->joinDate;
            return [
                'id' => $member->id,
                'profilePicture' => $member->profilePicture,
                'firstName' => $member->firstName,
                'lastName' => $member->lastName,
                'role' => $member->role,
                'street' => $member->street,
                'birthYear' => $member->birthYear,
                'joinDate' => $joinDate,
                'teamName' => $teamName,
                'teamID' => $teamID,
                'sponsor' => $teamSponsor,
            ];
        });
    
        return response()->json(['result' => $result]);
    }
}