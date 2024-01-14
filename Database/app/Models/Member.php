<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Member extends Model
{
    protected $table = 'members.info';

    public function team()
    {
        return $this->belongsToMany(TeamsInfo::class, 'teams.players', 'playerID', 'teamID');
    }

    public function membershipHistory()
    {
        return $this->hasMany(MembershipHistory::class, 'memberId');
    }

}
