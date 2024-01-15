<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TournamentsInfo extends Model
{
    protected $table = 'tournaments.tournament_info';
    protected $primaryKey = 'tournamentID';

    public function winner()
    {
        return $this->belongsTo(TeamsInfo::class, 'winnerID', 'teamID');
    }
}
