<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeamsInfo extends Model
{
    protected $table = 'teams.info';
    protected $primaryKey = 'teamID';

    public function members()
    {
        return $this->belongsToMany(Member::class, 'teams.players', 'teamID', 'playerID');
    }
}
